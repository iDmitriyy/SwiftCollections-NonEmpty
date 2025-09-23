//
//  DictionaryUnifyingProtocol.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

// swiftformat:disable unusedArguments

public protocol DictionarySequence<Key, Value>: Swift.Sequence where Element == (key: Key, value: Value) {
  associatedtype Key: Hashable
  associatedtype Value
}

// MARK: DictionaryCollection

public protocol DictionaryCollection<Key, Value>: DictionarySequence {
  associatedtype Index: Comparable
  
  associatedtype Keys: Swift.Collection<Key>, Equatable
  associatedtype Values: Swift.Collection<Value>
  
  var keys: Keys { get }
  var values: Values { get }
  
  var isEmpty: Bool { get }
  
  var count: Int { get }
  
  func index(forKey key: Key) -> Index?
}

// MARK: - Single value (get subscript)

public protocol SingleValueGetSubscriptDictionary<Key, Value>: DictionaryCollection {
  subscript(key: Key) -> Value? { get }
  
  subscript(position: Index) -> Element { get }
}

extension Dictionary: SingleValueGetSubscriptDictionary {}

extension OrderedDictionary: SingleValueGetSubscriptDictionary {}

extension TreeDictionary: SingleValueGetSubscriptDictionary {}

// MARK: - Single value (set subscript)

public protocol SingleValueSetSubscriptDictionary<Key, Value>: SingleValueGetSubscriptDictionary {
  subscript(key: Key) -> Value? { get set }
  subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value { get set }
  
  @discardableResult
  mutating func updateValue(_ value: Value, forKey key: Key) -> Value?
  
  mutating func removeValue(forKey key: Key) -> Value?
  
  mutating func remove(at index: Self.Index) -> Self.Element
}

extension Dictionary: SingleValueSetSubscriptDictionary {}

extension OrderedDictionary: SingleValueSetSubscriptDictionary {}

extension TreeDictionary: SingleValueSetSubscriptDictionary {}

// MARK: - Multiple values for Index subscript

public protocol MultiValueIndexSubscriptDictionary<Key, Value>: DictionaryCollection {
  /// For ordinary Dict types it is ==
  /// For multi-value for key dictionaries it is some Sequence<Value>
  associatedtype InstanceForIndex: Sequence
  
  subscript(position: Index) -> InstanceForIndex { get }
  
  mutating func remove(at index: Self.Index) -> InstanceForIndex
}

// MARK: - Multiple values for key (get subscript)

// MARK: - Multiple values for key (set subscript)

// MARK: - NonEmpty Dictionary Protocol

// public protocol SingleValueNonEmptyDictionary<Key, Value>: DictionaryProtocol0 {
////  subscript(key: Key) -> Value? { get }
////
////  @discardableResult
////  mutating func updateValue(_ value: Value, forKey key: Key) -> Value?
//
//  /// with NonEmptyDictionary filter function returns Dictionary
//  associatedtype FilterResultType: NonEmptyDictionaryProtocol<Key, Value>
//  func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> FilterResultType
//
//  // todo
////  func remapValues<T, E>(_ transform: (Value) throws(E) -> T) throws(E) -> Self
////  func remapValues<T>(_ transform: (Value) throws -> T) rethrows -> SelfType<Key, T>
////  func compactMapValues<T>(_ transform: (Value) throws -> T?) rethrows -> SelfType<Key, T>
//
//  mutating func merge(_ keysAndValues: some Sequence<(Key, Value)>,
//                      uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows
//
//  func merging(_ other: some Sequence<(Key, Value)>,
//               uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> Self
// }

// protocol SingleValueNonEmptyMutableDictionary<Key, Value>: NonEmptyDictionaryProtocol {}

// swiftformat:enable all

// MARK: - Single Value For Key Dictionary Protocol

public protocol SingleValueForKeyDictionary<Key, Value>: EmptyInitializableDictionary,
  SingleValueSetSubscriptDictionary {}


// MARK: - Default Imps

extension SingleValueGetSubscriptDictionary {
  @inlinable
  public func hasValue(forKey key: Key) -> Bool {
    // TODO: inspect which is faster – key.contain or index(forKey: key) or valueForKey
    // @specialize – choose most perfomant execution path for each specialization, if found
    // Self: Dictionary | OrderedDictionary
    // Key: String | ?Int
    // Value: -
    
    // keys.contains(key)
    index(forKey: key) != nil
  }
}
