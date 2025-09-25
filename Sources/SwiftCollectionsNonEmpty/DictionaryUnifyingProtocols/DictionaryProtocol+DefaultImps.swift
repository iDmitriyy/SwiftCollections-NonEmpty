//
//  DictionaryProtocol+DefaultImps.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 25/09/2025.
//

// MARK: - Map / CompactMap

extension DictionaryCollection {
  public func mapValues<T, ResultBase>(_ transform: (Value) throws -> T) rethrows -> ResultBase
    where ResultBase: SingleValueSetSubscriptDictionary, ResultBase: EmptyInitializableDictionary,
    ResultBase.Key == Key, ResultBase.Value == T {
    var mapped = ResultBase()
    for (key, value) in self {
      mapped[key] = try transform(value)
    }
    return mapped
  }
  
  // Improvement: - use CapacityReservable overloads
  
  public func compactMapValues<T, ResultBase>(_ transform: (Value) throws -> T?) rethrows -> ResultBase
    where ResultBase: SingleValueSetSubscriptDictionary, ResultBase: EmptyInitializableDictionary,
    ResultBase.Key == Key, ResultBase.Value == T {
    var resultBase = ResultBase()
    for (key, value) in self {
      if let transformedValue = try transform(value) {
        resultBase[key] = transformedValue
      }
     }
    return resultBase
  }
}

// MARK: - Unnamed KeyValues View

extension DictionaryCollection {
  /// Adapter removing key value labels from Dictionary.Element
  public var unnamedKeyValuesView: some Sequence<(Key, Value)> {
    IterationDeferredMapSequence(sequence: self, transform: {  key, value in (key, value) })
  }
}

// MARK: - Additional Default Imps

extension SingleValueGetSubscriptDictionary { // DictionaryCollection if `index(forKey: key)`
  @inlinable
  public func hasValue(forKey key: Key) -> Bool {
    // Improvement: - inspect which is faster – keys.contain or index(forKey: key) or valueForKey
    // @specialize – choose most perfomant execution path for each specialization, if found
    // Self: Dictionary | OrderedDictionary
    // Key: String | ?Int | CustomHashable LargeKeyStruct
    // Value: - LargeValueStruct
    
    // keys.contains(key)
    index(forKey: key) != nil
  }
}
