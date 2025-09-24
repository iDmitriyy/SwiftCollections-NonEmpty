//
//  NonEmpty+SingleValueForKeyDictionary.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 23/09/2025.
//

// swiftformat:disable unusedArguments

//extension NonEmpty: NonEmptyDictionaryType where Self.Collection: CommonOperationsDictionaryProtocol, Self.Key == Self.Collection.Key {
//
//}

//extension NonEmpty: NonEmptyDictionaryType where Collection: CommonOperationsDictionaryProtocol {
//  
//}

struct Foo<Dict>: CustomStringConvertible {
  var description: String { ""}
  
}

typealias NonEmptyGenericDict<Key: Hashable, Value, B: CommonOperationsDictionaryProtocol> = NonEmpty<B> where B.Key == Key, B.Value == Value

extension NonEmptyGenericDict {
  func nonEmptyFunc() {}
}

func foo<K, V>(_ nonEmptyDict: NonEmptyDictionary<K, V>, orderedNonEmptyDict: NonEmptyOrderedDictionary<K, V>) {
  bar0(dd: nonEmptyDict)
  bar1(dd: orderedNonEmptyDict)
}

func bar0<K, V, B>(dd: NonEmpty<B>) where B: SingleValueForKeyDictionary, B.Key == K, B.Value == V {
  dd.nonEmptyFunc()
}

func bar1<K, V, B>(dd: NonEmptyGenericDict<K, V, B>) where B: SingleValueForKeyDictionary {
  dd.nonEmptyFunc()
  let filtered0: B = dd.rawValue
  let filtered1: B = dd.rawValue.filter { _ in true }
//  let filtered2: B = dd.filter { _ in true }
}
