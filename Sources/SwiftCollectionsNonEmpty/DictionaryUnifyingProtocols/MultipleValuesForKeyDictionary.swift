//
//  MultipleValuesForKeyDictionary.swift
//  swiftCollections-nonEmpty
//
//  Created by tmp on 23/09/2025.
//

// swiftformat:disable unusedArguments

// MARK: - MultipleValuesDictionary IndexSubscript

public protocol MultipleValuesDictionaryWithIndexSubscript<Key, Value>: DictionaryCollection {
  /// can either be a single value or a sequence of values
  associatedtype InstanceForIndex
  
  subscript(position: Index) -> InstanceForIndex { get }
  
  mutating func remove(at index: Self.Index) -> InstanceForIndex
}

// MARK: - Multiple values for key (get subscript)

public protocol MultipleValuesForKeyGetSubscriptDictionary<Key, Value>: DictionaryCollection {
  associatedtype ValuesForKey: Collection<Value>
  
  subscript(key: Key) -> ValuesForKey? { get }
}
