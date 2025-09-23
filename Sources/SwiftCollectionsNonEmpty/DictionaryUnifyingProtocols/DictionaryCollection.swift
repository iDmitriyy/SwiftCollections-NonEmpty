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
  
//  func enumerated() -> EnumeratedSequence<Self>
//  
//  func forEach(_ body: (Self.Element) throws -> Void) rethrows
//  
//  func contains(where predicate: (Self.Element) throws -> Bool) rethrows -> Bool
//  
//  func count<E>(where predicate: (Self.Element) throws(E) -> Bool) throws(E) -> Int
//  
//  func allSatisfy(_ predicate: (Self.Element) throws -> Bool) rethrows -> Bool
//  
//  func first(where predicate: (Self.Element) throws -> Bool) rethrows -> Self.Element?
//  
//  @warn_unqualified_access
//  func min(by areInIncreasingOrder: (Self.Element, Self.Element) throws -> Bool) rethrows -> Self.Element?
//  
//  @warn_unqualified_access
//  func max(by areInIncreasingOrder: (Self.Element, Self.Element) throws -> Bool) rethrows -> Self.Element?
//  
//  func randomElement() -> Self.Element?
//  
//  func randomElement(using generator: inout some RandomNumberGenerator) -> Self.Element?
//  
//  func reduce<Result>(_ initialResult: Result,
//                      _ nextPartialResult: (Result, (key: Key, value: Value)) throws -> Result) rethrows -> Result
//  
//  func reduce<Result>(into initialResult: Result,
//                      _ updateAccumulatingResult: (inout Result, (key: Key, value: Value)) throws -> ()) rethrows -> Result
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
  
  @available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
  func indices(where predicate: (Self.Element) throws -> Bool) rethrows -> RangeSet<Self.Index>
}
