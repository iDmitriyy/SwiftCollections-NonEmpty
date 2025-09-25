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

extension NonEmpty: DictionaryCollection where Base: DictionaryCollection {
  public typealias Key = Base.Key
  
  public typealias Value = Base.Value
  
  public typealias Keys = Base.Keys
  
  public typealias Values = Base.Values
  
  // properties & methods:
  
  public var keys: Base.Keys { rawValue.keys }
  
  public var values: Base.Values { rawValue.values }
  
  public func index(forKey key: Base.Key) -> Base.Index? {
    rawValue.index(forKey: key)
  }
}

// MARK: - SingleValueGetSubscriptDictionary

extension NonEmpty: SingleValueGetSubscriptDictionary where Base: SingleValueGetSubscriptDictionary {
  public subscript(key: Base.Key) -> Base.Value? { rawValue[key] }
  
  public subscript(key: Base.Key, default defaultValue: @autoclosure () -> Base.Value) -> Base.Value {
    rawValue[key, default: defaultValue()]
  }
}

// MARK: - UndestructiveNonEmptinessMutableOperationsDictionary

extension NonEmpty: UndestructiveNonEmptinessMutableOperationsDictionary where Base: UndestructiveNonEmptinessMutableOperationsDictionary {
  @discardableResult
  public mutating func updateValue(_ value: Base.Value, forKey key: Base.Key) -> Base.Value? {
    _baseReadModify.updateValue(value, forKey: key)
  }
  
  public mutating func merge(_ keysAndValues: some Sequence<(Base.Key, Base.Value)>,
                             uniquingKeysWith combine: (Base.Value, Base.Value) throws -> Base.Value) rethrows {
    try _baseReadModify.merge(keysAndValues, uniquingKeysWith: combine)
  }
  
  public func merging(_ other: some Sequence<(Base.Key, Base.Value)>,
                      uniquingKeysWith combine: (Base.Value, Base.Value) throws -> Base.Value)
    rethrows -> Self {
    let baseMerged = try _baseReadModify.merging(other, uniquingKeysWith: combine)
    return Self(_ucheckedNonEmptyRawValue: baseMerged)
  }
  
  public mutating func merge(_ other: some UndestructiveNonEmptinessMutableOperationsDictionary<Base.Key, Base.Value>,
                             uniquingKeysWith combine: (Base.Value, Base.Value) throws -> Base.Value) rethrows {
    try merge(other.unnamedKeyValuesView, uniquingKeysWith: combine)
  }
  
  public func merging(_ other: some UndestructiveNonEmptinessMutableOperationsDictionary<Base.Key, Base.Value>,
                      uniquingKeysWith combine: (Base.Value, Base.Value) throws -> Base.Value)
    rethrows -> Self {
    try merging(other.unnamedKeyValuesView, uniquingKeysWith: combine)
  }
}

// MARK: - DifferentResultTypesOperationsDictionary

extension NonEmpty: DifferentResultTypesOperationsDictionary where Base: DifferentResultTypesOperationsDictionary,
  Base.FilterValues == Base {
  public func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> Base {
    try rawValue.filter(isIncluded)
  }
}

// MARK: - Map / CompactMap

extension NonEmpty where Base: DictionaryCollection {
  public func mapValues<T, ResultBase>(_ transform: (Base.Value) throws -> T) rethrows -> NonEmpty<ResultBase>
    where ResultBase: SingleValueSetSubscriptDictionary, ResultBase: EmptyInitializableDictionary,
    ResultBase.Key == Base.Key, ResultBase.Value == T {
    let resultBase: ResultBase = try rawValue.mapValues(transform)
    return NonEmpty<ResultBase>(_ucheckedNonEmptyRawValue: resultBase)
  }
  
  public func compactMapValues<T, ResultBase>(_ transform: (Base.Value) throws -> T?) rethrows -> ResultBase
    where ResultBase: SingleValueSetSubscriptDictionary, ResultBase: EmptyInitializableDictionary,
    ResultBase.Key == Base.Key, ResultBase.Value == T {
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
