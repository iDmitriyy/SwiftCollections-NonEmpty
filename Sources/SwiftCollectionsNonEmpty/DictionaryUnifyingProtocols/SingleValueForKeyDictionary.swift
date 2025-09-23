//
//  SingleValueForKeyDictionary.swift
//  swiftCollections-nonEmpty
//
//  Created by tmp on 23/09/2025.
//

// swiftformat:disable unusedArguments

// MARK: - Single value (get subscript)

public protocol SingleValueGetSubscriptDictionary<Key, Value>: DictionaryCollection {
  subscript(key: Key) -> Value? { get }
  subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value { get }
  
  subscript(position: Index) -> Element { get }
  
  
//  func mapValues<T>(_ transform: (Value) throws -> T) rethrows -> Dictionary<Key, T>
}

extension Dictionary {
  mutating func dddd() {
    let ss: Self = filter { _ in true}
  }
}

extension OrderedDictionary {
  mutating func dddd() {
    let ss: Self = filter { _ in true}
    
    self.removeAll()
  }
}

// MARK: - Operations common for both regular & nonEmpty Dictionary

public protocol NonEmptyCompatibleOperationsDictionary<Key, Value>: SingleValueGetSubscriptDictionary {
  @discardableResult
  mutating func updateValue(_ value: Value, forKey key: Key) -> Value?
  
  mutating func merge(_ keysAndValues: some Sequence<(Key, Value)>,
                      uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows
  
  func merging(_ other: some Sequence<(Key, Value)>,
               uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> Self
}

// MARK: - NonEmpty Dictionary Protocol

public protocol NonEmptyDictionaryType<Key, Value>: NonEmptyCompatibleOperationsDictionary {
  associatedtype Base: NonEmptyCompatibleOperationsDictionary<Key, Value>
}

// MARK: - Single value (set subscript)

public protocol SingleValueSetSubscriptDictionary<Key, Value>: NonEmptyCompatibleOperationsDictionary {
  subscript(key: Key) -> Value? { get set } // overload with set
  subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value { get set } // overload with set
  
  mutating func removeValue(forKey key: Key) -> Value?
  
  mutating func remove(at index: Self.Index) -> Self.Element
  
  // FilterResultType is:
  // Self for Dictionary
  // Base for NonEmptyDictionary
  // func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> Self
}


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

// MARK: - Single ValueForKey Dictionary

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
