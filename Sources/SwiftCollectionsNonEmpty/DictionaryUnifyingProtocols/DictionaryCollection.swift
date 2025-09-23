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
  
  func enumerated() -> EnumeratedSequence<Self>
  
  func forEach(_ body: (Self.Element) throws -> Void) rethrows
  
  func contains(where predicate: (Self.Element) throws -> Bool) rethrows -> Bool
  
  func count<E>(where predicate: (Self.Element) throws(E) -> Bool) throws(E) -> Int
  
  func allSatisfy(_ predicate: (Self.Element) throws -> Bool) rethrows -> Bool
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
  
  func firstIndex(where predicate: (Self.Element) throws -> Bool) rethrows -> Self.Index?
}

// swiftformat:enable unusedArguments
