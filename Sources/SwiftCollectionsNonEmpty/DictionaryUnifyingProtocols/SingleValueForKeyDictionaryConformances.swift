//
//  SingleValueForKeyDictionaryConformances.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 23/09/2025.
//

// MARK: - SingleValueForKey Dictionary

extension Dictionary: DictionaryProtocol {
  // FIXME: why it is required by compiler for only Swift.Dictionary but not others
  public mutating func merge(_ other: some UndestructiveNonEmptinessMutableOperationsDictionary<Key, Value>,
                             uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows {
    try merge(unnamedKeyValues, uniquingKeysWith: combine)
  }
  
  public func merging(_ other: some UndestructiveNonEmptinessMutableOperationsDictionary<Key, Value>,
                      uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> Self {
    try merging(unnamedKeyValues, uniquingKeysWith: combine)
  }
  
  // FIXME: call removeAll() [with default argument] from Standard library instead of hardcoding
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

// --- workoaround for merge

extension DictionaryCollection {
  /// Adapter removing key value labels from Dictionary.Element
  public var unnamedKeyValues: some Sequence<(Key, Value)> {
    IterationDeferredMapSequence(sequence: self, transform: {  key, value in (key, value) })
  }
}
