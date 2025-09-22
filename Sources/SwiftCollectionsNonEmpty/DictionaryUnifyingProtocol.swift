//
//  DictionaryUnifyingProtocol.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

// swiftformat:disable unusedArguments

public protocol DictionaryRootProtocol<Key, Value>: Swift.Sequence where Element == (key: Key, value: Value) {
  associatedtype Key: Hashable
  associatedtype Value
}

// MARK: DictionaryProtocol0

public protocol DictionaryProtocol0<Key, Value>: DictionaryRootProtocol {
  associatedtype Index: Comparable
  
  associatedtype Keys: Swift.Collection<Key>, Equatable
  associatedtype Values: Swift.Collection<Value>
  
  var keys: Keys { get }
  var values: Values { get }
  
  var isEmpty: Bool { get }
  
  var count: Int { get }
  
  func index(forKey key: Key) -> Index?
}

extension Dictionary: DictionaryProtocol0 {}

extension OrderedDictionary: DictionaryProtocol0 {}

extension TreeDictionary: DictionaryProtocol0 {}

// MARK: Empty Initializable

public protocol EmptyInitializableDictionaryProtocol<Key, Value>: DictionaryProtocol0 {
  init()
}

extension Dictionary: EmptyInitializableDictionaryProtocol {}

extension OrderedDictionary: EmptyInitializableDictionaryProtocol {}

extension TreeDictionary: EmptyInitializableDictionaryProtocol {}

// MARK: - With minimum Capacity Initializable

public protocol WithCapacityInitializableDictionaryProtocol<Key, Value>: EmptyInitializableDictionaryProtocol {
  init(minimumCapacity: Int)
  
  mutating func reserveCapacity(_ minimumCapacity: Int)
  
  mutating func removeAll(keepingCapacity keepCapacity: Bool)
}

extension Dictionary: WithCapacityInitializableDictionaryProtocol {}

extension OrderedDictionary: WithCapacityInitializableDictionaryProtocol {
  public init(minimumCapacity: Int) {
    self.init()
    reserveCapacity(minimumCapacity)
  }
}

// extension TreeDictionary: WithCapacityInitializableDictionaryProtocol {}

// MARK: - Single value (get subscript)

public protocol SingleValueGetSubscriptDictionaryProtocol<Key, Value>: DictionaryProtocol0 {
  subscript(key: Key) -> Value? { get }
  
  subscript(position: Index) -> Element { get }
}

extension Dictionary: SingleValueGetSubscriptDictionaryProtocol {}

extension OrderedDictionary: SingleValueGetSubscriptDictionaryProtocol {}

extension TreeDictionary: SingleValueGetSubscriptDictionaryProtocol {}

// MARK: - Single value (set subscript)

public protocol SingleValueSetSubscriptDictionaryProtocol<Key, Value>: SingleValueGetSubscriptDictionaryProtocol {
  subscript(key: Key) -> Value? { get set }
  subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value { get set }
  
  @discardableResult
  mutating func updateValue(_ value: Value, forKey key: Key) -> Value?
  
  mutating func removeValue(forKey key: Key) -> Value?
  
  mutating func remove(at index: Self.Index) -> Self.Element
}

extension Dictionary: SingleValueSetSubscriptDictionaryProtocol {}

extension OrderedDictionary: SingleValueSetSubscriptDictionaryProtocol {}

extension TreeDictionary: SingleValueSetSubscriptDictionaryProtocol {}

// MARK: - Multiple values for Index subscript

public protocol MultuValueIndexSubscriptDictionaryProtocol<Key, Value>: DictionaryProtocol0 {
  /// For ordinary Dict types it is ==
  /// For multi-value for key dictionaries it is some Sequence<Value>
  associatedtype InstanceForIndex: Sequence
  
  subscript(position: Index) -> InstanceForIndex { get }
  
  mutating func remove(at index: Self.Index) -> InstanceForIndex
}

// extension Dictionary: SingleValueSetSubscriptDictionaryProtocol {}
//
// extension OrderedDictionary: SingleValueSetSubscriptDictionaryProtocol {}
//
// extension TreeDictionary: SingleValueSetSubscriptDictionaryProtocol {}

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
