//
//  DictionaryProtocolConformances.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 23/09/2025.
//

// MARK: - SingleValueForKey Dictionary

extension Dictionary: DictionaryProtocol {
  // FIXME: why it is required by compiler for only Swift.Dictionary but not others
  public mutating func merge(_ other: some UndestructiveNonEmptinessMutableOperationsDictionary<Key, Value>,
                             uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows {
    try merge(unnamedKeyValuesView, uniquingKeysWith: combine)
  }
  
  public func merging(_ other: some UndestructiveNonEmptinessMutableOperationsDictionary<Key, Value>,
                      uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> Self {
    try merging(unnamedKeyValuesView, uniquingKeysWith: combine)
  }
  
  // FIXME: call removeAll()[with default argument from Standard library] instead of hardcoding `false`
  public mutating func removeAll() { removeAll(keepingCapacity: false) }
}

extension OrderedDictionary: DictionaryProtocol {
  public mutating func removeAll() { removeAll(keepingCapacity: false) }
}

extension TreeDictionary: DictionaryProtocol {
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


// MARK: - - Unique KeysWithValues Initializable Dictionary

extension Dictionary: UniqueKeysWithValuesInitializableDictionary {}

extension OrderedDictionary: UniqueKeysWithValuesInitializableDictionary {}

extension TreeDictionary: UniqueKeysWithValuesInitializableDictionary {}
