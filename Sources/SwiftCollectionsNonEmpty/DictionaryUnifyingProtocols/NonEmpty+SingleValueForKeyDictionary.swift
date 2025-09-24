//
//  NonEmpty+SingleValueForKeyDictionary.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 23/09/2025.
//

// swiftformat:disable unusedArguments

// extension NonEmpty: NonEmptyDictionaryType where Self.Collection: CommonOperationsDictionaryProtocol, Self.Key == Self.Collection.Key {
//
// }

// extension NonEmpty: NonEmptyDictionaryType where Collection: CommonOperationsDictionaryProtocol {
//
// }

struct Foo<Dict>: CustomStringConvertible {
  var description: String { "" }
}

public typealias NonEmptyGenericDict<Key: Hashable, Value, B: NonEmptyUndestructiveOperationsDictionary> = NonEmpty<B>
  where B.Key == Key, B.Value == Value

extension NonEmptyGenericDict {
  func nonEmptyFunc() {}
  
  public func __filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows { // -> Collection
    // allSatisfy(true)
    // rawValue.filter(isIncluded: isIncluded) as! Collection
  }
}

// MARK: - NonEmpty + Destructive Operations

extension NonEmpty where Collection: NonEmptyDestructiveOperationsDictionary, Collection.FilterValues == Collection {
  public func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> Collection {
    try rawValue.filter(isIncluded)
  }
}

// MARK: - Testing api

func foo<K, V>(_ nonEmptyDict: NonEmptyDictionary<K, V>, orderedNonEmptyDict: NonEmptyOrderedDictionary<K, V>) {
  bar0(dd: nonEmptyDict)
  bar1(dd: orderedNonEmptyDict)
}

func bar0<K, V, B>(dd: NonEmpty<B>) where B: SingleValueForKeyDictionary, B.Key == K, B.Value == V {
  dd.nonEmptyFunc()
  
  let filtered0: B = dd.rawValue
  let filtered1: B = dd.rawValue.filter { _ in true }
  let filtered2: B = dd.filter { _ in true }
}

func bar1<K, V, B>(dd: NonEmptyGenericDict<K, V, B>) where B: SingleValueForKeyDictionary {
  dd.nonEmptyFunc()
  let filtered0: B = dd.rawValue
  let filtered1: B = dd.rawValue.filter { _ in true }
  let filtered2: B = dd.filter { _ in true }
  
  var mutable = filtered2
  let (key, value) = filtered0[filtered0.startIndex]
  mutable.updateValue(value, forKey: key)
}

func bar2<K, V>(dd: NonEmptyGenericDict<K, V, some SingleValueForKeyDictionary>) {
  dd.nonEmptyFunc()
  let base = dd.rawValue
  let baseFiltered = dd.rawValue.filter { _ in true }
  let nonEmptyFiltered = dd.filter { _ in true }
  
  var mutable = nonEmptyFiltered
  let (key, value) = base[base.startIndex]
  mutable.updateValue(value, forKey: key)
  
  let merged = mutable.merging(mutable, uniquingKeysWith: { l, r in r })
  mutable.merge(mutable, uniquingKeysWith: { l, r in r })
  
//  let merged = filtered0.merging(filtered1, uniquingKeysWith: { lhs, rhs in
//    rhs
//  })
}
