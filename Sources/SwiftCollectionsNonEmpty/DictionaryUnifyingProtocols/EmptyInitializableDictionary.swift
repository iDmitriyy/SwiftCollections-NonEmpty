//
//  EmptyInitializableDictionary.swift
//  swiftCollections-nonEmpty
//
//  Created by tmp on 23/09/2025.
//

// MARK: - Empty Initializable

public protocol EmptyInitializableDictionary<Key, Value>: DictionaryCollection {
  init()
}

// MARK: - Capacity Reservable

public protocol CapacityReservableDictionary<Key, Value>: EmptyInitializableDictionary {
  mutating func reserveCapacity(_ minimumCapacity: Int)
}

// MARK: - With minimum Capacity Initializable

public protocol WithCapacityInitializableDictionary<Key, Value>: EmptyInitializableDictionary {
  init(minimumCapacity: Int)
  
  mutating func removeAll(keepingCapacity keepCapacity: Bool)
}

extension Dictionary: WithCapacityInitializableDictionary {}

extension OrderedDictionary: WithCapacityInitializableDictionary {
  public init(minimumCapacity: Int) {
    self.init()
    reserveCapacity(minimumCapacity)
  }
}

// extension TreeDictionary: WithCapacityInitializableDictionaryProtocol {} // no functions to reserveCapacity
