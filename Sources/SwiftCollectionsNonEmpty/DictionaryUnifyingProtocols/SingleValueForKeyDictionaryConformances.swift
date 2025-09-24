//
//  SingleValueForKeyDictionaryConformances.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 23/09/2025.
//

// MARK: - SingleValueForKey Dictionary

extension Dictionary: SingleValueForKeyDictionary {
  // FIXME: call removeAll() [with default argument] from Standard library instead of hardcoding
  public mutating func removeAll() { removeAll(keepingCapacity: false) }
}

extension OrderedDictionary: SingleValueForKeyDictionary {
  public mutating func removeAll() { removeAll(keepingCapacity: false) }
}

extension TreeDictionary: SingleValueForKeyDictionary {
  public mutating func removeAll() { self = [:] }
}

// MARK: - EmptyInitializable WithCapacity Dictionary

extension Dictionary: EmptyInitializableWithCapacityDictionary {}

extension OrderedDictionary: EmptyInitializableWithCapacityDictionary {
  public init(minimumCapacity: Int) {
    self.init()
    reserveCapacity(minimumCapacity)
  }
}

// extension TreeDictionary: WithCapacityInitializableDictionaryProtocol {} // no functions to reserveCapacity
