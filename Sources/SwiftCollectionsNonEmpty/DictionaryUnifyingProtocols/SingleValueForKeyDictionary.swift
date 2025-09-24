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

// MARK: CommonOperations Dictionary Protocol

/// Operations where:
/// - (filter) regular dictionary return Self as a Result
/// - (filter) nonEmpty dictionary return Base as a Result
public protocol CommonOperationsDictionaryProtocol<Key, Value>: NonEmptyCompatibleOperationsDictionary {
  /// Self for regular Dictionary types | Base for NonEmpty. Use when both regular & its NonEmpty variant uses
  /// Particilary, used by filter() method
  associatedtype FilterValues: NonEmptyCompatibleOperationsDictionary<Key, Value>
//  
  func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> FilterValues
  
  // how?
  // func mapValues<NewValue>(_ transform: (Value) throws -> NewValue) rethrows -> Self<Key, NewValue>
  
  // func compactMapValues<NewValue>(_ transform: (Value) throws -> NewValue?) rethrows -> Self<Key, NewValue>
}

// MARK: - NonEmpty Dictionary Protocol

public protocol NonEmptyDictionaryType<Key, Value>: CommonOperationsDictionaryProtocol { // where FilterValues == Base
//  associatedtype Base: NonEmptyCompatibleOperationsDictionary<Key, Value>
}

// MARK: Below are protocol with operations that are not possible for NonEmpty

// MARK: - Single value (set subscript)

public protocol SingleValueSetSubscriptDictionary<Key, Value>: CommonOperationsDictionaryProtocol where FilterValues == Self { //
  subscript(key: Key) -> Value? { get set } // overload with set
  subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value { get set } // overload with set
  
  mutating func removeValue(forKey key: Key) -> Value?
  
  mutating func remove(at index: Self.Index) -> Self.Element
}

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

// MARK: - checking api surface

//extension NonEmptyDictionary {
extension Dictionary {
  fileprivate mutating func `check available api and overloads`() {
    // inherited from Sequence default imps:
    // allSatisfy
    // contains(where:)
    // count(where:)
    // elementsEqual(_ other:, by: )
    // enumerated
    // first(where:)
    // flatMap
    // forEach
    // min / max
    // randomElement
    // randomElement(using:)
    // reduce | reduce(into:)
    // reversed
    // shuffled() shuffled(using:)
    // sorted(by: ) / sorted(using: )
    
    // inherited from Collections default imps:
    // firstIndex(where:)
    // indices(where:)
    
    // Dictionary specific | overloaded:
    // self.removeAll() // regular: Self.self    nonEmpty: Base.self // added to EmptyInitializableDictionary
    
    // merge(_: some, uniquingKeysWith:)  // regular: Self.self    nonEmpty: Self.self
    // merged(_: some, uniquingKeysWith:) // regular: Self.self    nonEmpty: Self.self
    
    // _________________
    
    // self.filter()    // regular: Self.self                  nonEmpty: Base.self

    // mapValues        // regular: Self<_, NewValue>          nonEmpty: Self<_, NewValue>
    // compactMapValues // regular: Self<_, NewValue>          nonEmpty: Base<_, NewValue>

    // > suffix
  }
}

fileprivate func `check methods generically`<Dict: SingleValueForKeyDictionary>(dict: Dict) {
//  var filtered: Dict = dict.filter { _ in true }
//  let first = dict[dict.startIndex]
//  filtered[first.key] = first.value
  
  
}
