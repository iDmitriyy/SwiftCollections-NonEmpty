//
//  NonEmpty+DictionaryProtocol.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 23/09/2025.
//

@_spi(NonEmptyExternallyExtendable) import NonEmpty

extension NonEmpty: DictionaryCollection where Collection: DictionaryCollection {
  public typealias Key = Collection.Key
  
  public typealias Value = Collection.Value
  
  public typealias Keys = Collection.Keys
  
  public typealias Values = Collection.Values
  
  // :
  
  public var keys: Collection.Keys { rawValue.keys }
  
  public var values: Collection.Values { rawValue.values }
  
  public func index(forKey key: Collection.Key) -> Collection.Index? {
    rawValue.index(forKey: key)
  }
}

extension NonEmpty: SingleValueGetSubscriptDictionary where Collection: SingleValueGetSubscriptDictionary {
  public subscript(key: Collection.Key) -> Collection.Value? { rawValue[key] }
  
  public subscript(key: Collection.Key, default defaultValue: @autoclosure () -> Collection.Value) -> Collection.Value {
    rawValue[key, default: defaultValue()]
  }
}

extension NonEmpty: UndestructiveNonEmptinessMutableOperationsDictionary where Collection: UndestructiveNonEmptinessMutableOperationsDictionary {
  @discardableResult
  public mutating func updateValue(_ value: Collection.Value, forKey key: Collection.Key) -> Collection.Value? {
    _rawValueMutable.updateValue(value, forKey: key)
  }
  
  public mutating func merge(_ keysAndValues: some Sequence<(Collection.Key, Collection.Value)>,
                             uniquingKeysWith combine: (Collection.Value, Collection.Value) throws -> Collection.Value) rethrows {
    try _rawValueMutable.merge(keysAndValues, uniquingKeysWith: combine)
  }
  
  public func merging(_ other: some Sequence<(Collection.Key, Collection.Value)>,
                      uniquingKeysWith combine: (Collection.Value, Collection.Value) throws -> Collection.Value)
    rethrows -> Self {
    let baseMerged = try _rawValueMutable.merging(other, uniquingKeysWith: combine)
    return Self(_ucheckedNonEmptyRawValue: baseMerged)
  }
  
  public mutating func merge(_ other: some UndestructiveNonEmptinessMutableOperationsDictionary<Collection.Key, Collection.Value>,
                             uniquingKeysWith combine: (Collection.Value, Collection.Value) throws -> Collection.Value) rethrows {
    try merge(other.unnamedKeyValues, uniquingKeysWith: combine)
  }
  
  public func merging(_ other: some UndestructiveNonEmptinessMutableOperationsDictionary<Collection.Key, Collection.Value>,
                      uniquingKeysWith combine: (Collection.Value, Collection.Value) throws -> Collection.Value)
    rethrows -> Self {
    try merging(other.unnamedKeyValues, uniquingKeysWith: combine)
  }
}

// MARK: - NonEmpty + Destructive Operations

extension NonEmpty: DifferentResultTypesOperationsDictionary where Collection: DifferentResultTypesOperationsDictionary,
  Collection.FilterValues == Collection {
  public func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> Collection {
    try rawValue.filter(isIncluded)
  }
  
  // FIXME: remove FilterValues
  // ? inntroduce SequenceInitializerDictionary protocol for map operations?
}

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

public typealias NonEmptyGenericDict<Key: Hashable, Value, B: UndestructiveNonEmptinessMutableOperationsDictionary> = NonEmpty<B>
  where B.Key == Key, B.Value == Value

extension NonEmptyGenericDict {
  func nonEmptyFunc() {}
}

func foo<K, V>(_ nonEmptyDict: NonEmptyDictionary<K, V>, orderedNonEmptyDict: NonEmptyOrderedDictionary<K, V>) {
  bar0(dd: nonEmptyDict)
  bar1(dd: orderedNonEmptyDict)
}

func bar0<K, V, B>(dd: NonEmpty<B>) where B: DictionaryProtocol, B.Key == K, B.Value == V {
  dd.nonEmptyFunc()
  
  let filtered0: B = dd.rawValue
  let filtered1: B = dd.rawValue.filter { _ in true }
  let filtered2: B = dd.filter { _ in true }
}

func bar1<K, V, B>(dd: NonEmptyGenericDict<K, V, B>) where B: DictionaryProtocol {
  dd.nonEmptyFunc()
  let filtered0: B = dd.rawValue
  let filtered1: B = dd.rawValue.filter { _ in true }
  let filtered2: B = dd.filter { _ in true }
  
  var mutable = filtered2
  let (key, value) = filtered0[filtered0.startIndex]
  mutable.updateValue(value, forKey: key)
}

func bar2<K, V>(nonEmpty: NonEmptyGenericDict<K, V, some DictionaryProtocol>) {
  nonEmpty.nonEmptyFunc()
  let base = nonEmpty.rawValue
  let baseFiltered = nonEmpty.rawValue.filter { _ in true }
  let nonEmptyFiltered = nonEmpty.filter { _ in true }
  
  // NonEmptyUndestructiveMutableOperationsDictionary
  
  var mutable = nonEmptyFiltered
  let (key, value) = base[base.startIndex]
  mutable.updateValue(value, forKey: key)
  
  var nonEmptyMutable = nonEmpty
  nonEmptyMutable.updateValue(value, forKey: key)
  
  let merged = mutable.merging(mutable, uniquingKeysWith: { _, r in r })
  mutable.merge(mutable, uniquingKeysWith: { _, r in r })
  
  nonEmptyMutable.merge(nonEmptyMutable, uniquingKeysWith: { _, r in r })
  nonEmptyMutable.merge(mutable, uniquingKeysWith: { _, r in r })
  
//  let merged = filtered0.merging(filtered1, uniquingKeysWith: { lhs, rhs in
//    rhs
//  })
}
