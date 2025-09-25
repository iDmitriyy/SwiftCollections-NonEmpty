//
//  NonEmpty+Init.swift
//  swiftCollections-nonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

extension NonEmpty {
  @inlinable @inline(__always)
  internal init(_ucheckedNonEmptyRawValue: Base) {
    self.init(rawValue: _ucheckedNonEmptyRawValue)!
  }
}

// MARK: - RangeReplaceable Collection Types NonEmpty initializer

extension NonEmpty where Base: RangeReplaceableCollection {
  @inlinable @inline(__always)
  public init(element: Element) {
    var coll = Base()
    coll.append(element)
    self.init(_ucheckedNonEmptyRawValue: coll)
  }
  
  @inlinable @inline(__always)
  public init(elements first: Element, _ other: Element...) {
    var coll = Base()
    coll.append(first)
    coll.append(contentsOf: other)
    self.init(_ucheckedNonEmptyRawValue: coll)
  }
}

// MARK: - Compatible Set Types NonEmpty initializer

extension NonEmpty where Base: NonEmptyAvailableOutOfBoxConvenienceInitSet {
  @inlinable @inline(__always)
  public init(element: Element) {
    let backingInstance = Base(CollectionOfOne(element))
    self.init(_ucheckedNonEmptyRawValue: backingInstance)
  }
  
  @inlinable @inline(__always)
  public init(elements first: Element, _ other: Element...) {
    var backingInstance = Base(CollectionOfOne(first))
    backingInstance.formUnion(other)
    self.init(_ucheckedNonEmptyRawValue: backingInstance)
  }
}

// MARK: - SingleValueForKey Dictionary Types NonEmpty initializer

extension NonEmpty where Base: DictionaryProtocol {
  @inlinable @inline(__always)
  public init(element: Element) {
    var backingInstance = Base()
    backingInstance.updateValue(element.value, forKey: element.key)
    self.init(_ucheckedNonEmptyRawValue: backingInstance)
  }
  
  @inlinable @inline(__always)
  public init(elements first: Element, _ other: Element...) {
    var backingInstance = Base()
    backingInstance.updateValue(first.value, forKey: first.key)
    for (key, value) in other {
      backingInstance.updateValue(value, forKey: key)
    }
    self.init(_ucheckedNonEmptyRawValue: backingInstance)
  }
}
