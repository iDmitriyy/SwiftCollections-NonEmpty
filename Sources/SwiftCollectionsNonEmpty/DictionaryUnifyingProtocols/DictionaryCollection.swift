//
//  DictionaryCollection.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

// swiftformat:disable unusedArguments

public protocol DictionarySequence<Key, Value>: Swift.Sequence where Element == (key: Key, value: Value) {
  associatedtype Key: Hashable
  associatedtype Value
}

// MARK: - DictionaryCollection

public protocol DictionaryCollection<Key, Value>: DictionarySequence {
  associatedtype Index: Comparable
  
  associatedtype Keys: Swift.Collection<Key>, Equatable
  associatedtype Values: Swift.Collection<Value>
  
  var keys: Keys { get }
  var values: Values { get }
  
  var isEmpty: Bool { get }
  
  var count: Int { get }
  
  func index(forKey key: Key) -> Index?
}

// swiftformat:enable unusedArguments
