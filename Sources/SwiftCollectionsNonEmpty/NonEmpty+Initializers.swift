//
//  NonEmpty+Init.swift
//  swiftCollections-nonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

extension NonEmpty {
  @inlinable @inline(__always)
  internal init(_ucheckedNonEmptyRawValue: Collection) {
    self.init(rawValue: _ucheckedNonEmptyRawValue)!
  }
}

// MARK: - RangeReplaceable Collection Types NonEmpty initializer

extension NonEmpty where Collection: RangeReplaceableCollection {
  @inlinable @inline(__always)
  public init(element: Element) {
    var coll = Collection()
    coll.append(element)
    self.init(_ucheckedNonEmptyRawValue: coll)
  }
  
  @inlinable @inline(__always)
  public init(elements first: Element, _ other: Element...) {
    var coll = Collection()
    coll.append(first)
    coll.append(contentsOf: other)
    self.init(_ucheckedNonEmptyRawValue: coll)
  }
}

// MARK: - Compatible Set Types NonEmpty initializer

extension NonEmpty where Collection: NonEmptyCompatibleSetCollection {
  @inlinable @inline(__always)
  public init(element: Element) {
    let backingInstance = Collection(CollectionOfOne(element))
    self.init(_ucheckedNonEmptyRawValue: backingInstance)
  }
  
  @inlinable @inline(__always)
  public init(elements first: Element, _ other: Element...) {
    var backingInstance = Collection(CollectionOfOne(first))
    backingInstance.formUnion(other)
    self.init(_ucheckedNonEmptyRawValue: backingInstance)
  }
}

// MARK: - SingleValueForKey Dictionary Types NonEmpty initializer

extension NonEmpty where Collection: SingleValueForKeyDictionary {
  @inlinable @inline(__always)
  public init(element: Element) {
    var backingInstance = Collection()
    backingInstance.updateValue(element.value, forKey: element.key)
    self.init(_ucheckedNonEmptyRawValue: backingInstance)
  }
  
  @inlinable @inline(__always)
  public init(elements first: Element, _ other: Element...) {
    var backingInstance = Collection()
    backingInstance.updateValue(first.value, forKey: first.key)
    for (key, value) in other {
      backingInstance.updateValue(value, forKey: key)
    }
    self.init(_ucheckedNonEmptyRawValue: backingInstance)
  }
}
