//
//  NonEmpty+DictionaryProtocol.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 23/09/2025.
//

@_spi(NonEmptyExternallyExtendable) private import NonEmpty

public typealias NonEmptyGenericDict<Key: Hashable, Value, B: UndestructiveNonEmptinessMutableOperationsDictionary> = NonEmpty<B>
  where B.Key == Key, B.Value == Value

// MARK: - DictionaryCollection

extension NonEmpty: DictionaryCollection where Collection: DictionaryCollection {
  public typealias Key = Collection.Key
  
  public typealias Value = Collection.Value
  
  public typealias Keys = Collection.Keys
  
  public typealias Values = Collection.Values
  
  // properties & methods:
  
  public var keys: Collection.Keys { rawValue.keys }
  
  public var values: Collection.Values { rawValue.values }
  
  public func index(forKey key: Collection.Key) -> Collection.Index? {
    rawValue.index(forKey: key)
  }
}

// MARK: - SingleValueGetSubscriptDictionary

extension NonEmpty: SingleValueGetSubscriptDictionary where Collection: SingleValueGetSubscriptDictionary {
  public subscript(key: Collection.Key) -> Collection.Value? { rawValue[key] }
  
  public subscript(key: Collection.Key, default defaultValue: @autoclosure () -> Collection.Value) -> Collection.Value {
    rawValue[key, default: defaultValue()]
  }
}

// MARK: - UndestructiveNonEmptinessMutableOperationsDictionary

extension NonEmpty: UndestructiveNonEmptinessMutableOperationsDictionary where Collection: UndestructiveNonEmptinessMutableOperationsDictionary {
  @discardableResult
  public mutating func updateValue(_ value: Collection.Value, forKey key: Collection.Key) -> Collection.Value? {
    _rawValueReadModify.updateValue(value, forKey: key)
  }
  
  public mutating func merge(_ keysAndValues: some Sequence<(Collection.Key, Collection.Value)>,
                             uniquingKeysWith combine: (Collection.Value, Collection.Value) throws -> Collection.Value) rethrows {
    try _rawValueReadModify.merge(keysAndValues, uniquingKeysWith: combine)
  }
  
  public func merging(_ other: some Sequence<(Collection.Key, Collection.Value)>,
                      uniquingKeysWith combine: (Collection.Value, Collection.Value) throws -> Collection.Value)
    rethrows -> Self {
    let baseMerged = try _rawValueReadModify.merging(other, uniquingKeysWith: combine)
    return Self(_ucheckedNonEmptyRawValue: baseMerged)
  }
  
  public mutating func merge(_ other: some UndestructiveNonEmptinessMutableOperationsDictionary<Collection.Key, Collection.Value>,
                             uniquingKeysWith combine: (Collection.Value, Collection.Value) throws -> Collection.Value) rethrows {
    try merge(other.unnamedKeyValuesView, uniquingKeysWith: combine)
  }
  
  public func merging(_ other: some UndestructiveNonEmptinessMutableOperationsDictionary<Collection.Key, Collection.Value>,
                      uniquingKeysWith combine: (Collection.Value, Collection.Value) throws -> Collection.Value)
    rethrows -> Self {
    try merging(other.unnamedKeyValuesView, uniquingKeysWith: combine)
  }
}

// MARK: - DifferentResultTypesOperationsDictionary

extension NonEmpty: DifferentResultTypesOperationsDictionary where Collection: DifferentResultTypesOperationsDictionary,
  Collection.FilterValues == Collection {
  public func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> Collection {
    try rawValue.filter(isIncluded)
  }
}

// MARK: - Map / CompactMap

extension NonEmpty where Collection: DictionaryCollection {
  public func mapValues<T, ResultBase>(_ transform: (Collection.Value) throws -> T) rethrows -> NonEmpty<ResultBase>
    where ResultBase: SingleValueSetSubscriptDictionary, ResultBase: EmptyInitializableDictionary,
    ResultBase.Key == Collection.Key, ResultBase.Value == T {
    let resultBase: ResultBase = try rawValue.mapValues(transform)
    return NonEmpty<ResultBase>(_ucheckedNonEmptyRawValue: resultBase)
  }
  
  public func compactMapValues<T, ResultBase>(_ transform: (Collection.Value) throws -> T?) rethrows -> ResultBase
    where ResultBase: SingleValueSetSubscriptDictionary, ResultBase: EmptyInitializableDictionary,
    ResultBase.Key == Collection.Key, ResultBase.Value == T {
    try rawValue.compactMapValues(transform)
  }
}

// MARK: - Testing api

// func foo<K, V>(_: NonEmptyDictionary<K, V>, orderedNonEmptyDict _: NonEmptyOrderedDictionary<K, V>) {}
//
// func bar0<K, V, B>(dd _: NonEmpty<B>) where B: DictionaryProtocol, B.Key == K, B.Value == V {}
//
// func bar1<K, V>(dd _: NonEmptyGenericDict<K, V, some DictionaryProtocol>) {}
//
// func bar2<K, V>(nonEmpty: NonEmptyGenericDict<K, V, some DictionaryProtocol>) {
//  var mutableNonEmpty = nonEmpty
//  let maybeEmpty = nonEmpty.rawValue
//  var mutableMaybeEmpty = maybeEmpty
//
//  // filter:
//
//  let filteredNonEmpty = nonEmpty.filter { _ in true }
//  let filteredMaybeEmpty = nonEmpty.rawValue.filter { _ in true }
//
//  // updateValue
//  let (key, value) = nonEmpty[nonEmpty.startIndex]
//  mutableNonEmpty.updateValue(value, forKey: key)
//  mutableMaybeEmpty.updateValue(value, forKey: key)
//
//  // merging
//  let mergedNonEmpty0 = nonEmpty.merging(nonEmpty, uniquingKeysWith: { _, r in r })
//  let mergedNonEmpty1 = nonEmpty.merging(maybeEmpty, uniquingKeysWith: { _, r in r })
//  let mergedNonEmpty2 = nonEmpty.merging(maybeEmpty.unnamedKeyValuesView, uniquingKeysWith: { _, r in r })
//
//  let mergedMaybeEmpty0 = maybeEmpty.merging(nonEmpty, uniquingKeysWith: { _, r in r })
//  let mergedMaybeEmpty1 = maybeEmpty.merging(maybeEmpty, uniquingKeysWith: { _, r in r })
//  let mergedMaybeEmpty2 = maybeEmpty.merging(maybeEmpty.unnamedKeyValuesView, uniquingKeysWith: { _, r in r })
//
//  // merge
//  mutableNonEmpty.merge(nonEmpty, uniquingKeysWith: { _, r in r })
//  mutableNonEmpty.merge(maybeEmpty, uniquingKeysWith: { _, r in r })
//
//  mutableMaybeEmpty.merge(nonEmpty, uniquingKeysWith: { _, r in r })
//  mutableMaybeEmpty.merge(maybeEmpty, uniquingKeysWith: { _, r in r })
//
//  // map / compactMap
//
//  let mappedNonEmpty = nonEmpty.mapValues { String(describing: $0) } as NonEmptyTreeDictionary
//  let compactMappedNonEmpty = nonEmpty.compactMapValues { String(describing: $0) } as TreeDictionary
//
//  let mappedMaybeEmpty = maybeEmpty.mapValues { String(describing: $0) } as TreeDictionary
//  let compactMappedMaybeEmpty = maybeEmpty.compactMapValues { String(describing: $0) } as TreeDictionary
// }
