//
//  DictionaryCollection.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

// swiftformat:disable unusedArguments

// MARK: - DictionaryCollection

public protocol DictionaryCollection<Key, Value>: Swift.Collection where Element == (key: Key, value: Value) {
  associatedtype Key: Hashable
  associatedtype Value
  
  associatedtype Keys: Swift.Collection<Key>, Equatable
  associatedtype Values: Swift.Collection<Value>
  
  var keys: Keys { get }
  var values: Values { get }
    
  func index(forKey key: Key) -> Index?
}
