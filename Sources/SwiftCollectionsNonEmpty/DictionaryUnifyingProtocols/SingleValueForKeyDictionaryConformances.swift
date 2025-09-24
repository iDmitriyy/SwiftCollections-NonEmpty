//
//  SingleValueForKeyDictionaryConformances.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 23/09/2025.
//

// MARK: - SingleValueForKey Dictionary

extension Dictionary: SingleValueForKeyDictionary {
  // FIXME: why it is required by compiler for only Swift.Dictionary but not others
  public mutating func merge(_ other: some NonEmptyUndestructiveOperationsDictionary<Key, Value>,
                             uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows {
    try merge(unnamedKeyValues, uniquingKeysWith: combine)
  }
  
  public func merging(_ other: some NonEmptyUndestructiveOperationsDictionary<Key, Value>,
                      uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> Self {
    try merging(unnamedKeyValues, uniquingKeysWith: combine)
  }
  
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

// --- workoaround for merge

extension DictionaryCollection {
  var unnamedKeyValues: some Sequence<(Key, Value)> { UnnamedKeyValuesSequence(dict: self) }
}

fileprivate struct UnnamedKeyValuesSequence<Key, Value>: Sequence {
  typealias Element = (Key, Value)
  
  private var dictIterator: AnyIterator<(key: Key, value: Value)>
  
  init(dict: some DictionaryCollection<Key, Value>) {
    dictIterator = AnyIterator(dict.makeIterator())
  }
  
  func makeIterator() -> some IteratorProtocol<Element> {
    AnyIterator<Element> {
      if let keyValue = dictIterator.next() {
        keyValue
      } else {
        nil
      }
    }
  }
}
