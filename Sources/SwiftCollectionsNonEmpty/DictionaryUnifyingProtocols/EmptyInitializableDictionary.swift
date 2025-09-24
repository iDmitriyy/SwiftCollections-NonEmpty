//
//  EmptyInitializableDictionary.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 23/09/2025.
//

// swiftformat:disable unusedArguments

// MARK: - Empty Initializable

public protocol EmptyInitializableDictionary<Key, Value>: DictionaryCollection {
  init()
  
  mutating func removeAll()
}

// MARK: - Capacity Reservable

public protocol CapacityReservableDictionary<Key, Value>: DictionaryCollection {
  mutating func reserveCapacity(_ minimumCapacity: Int)
}

// MARK: - EmptyInitializable WithCapacity Dictionary

public protocol EmptyInitializableWithCapacityDictionary<Key, Value>: EmptyInitializableDictionary, CapacityReservableDictionary {
  init(minimumCapacity: Int)
  
  mutating func removeAll(keepingCapacity keepCapacity: Bool)
}
