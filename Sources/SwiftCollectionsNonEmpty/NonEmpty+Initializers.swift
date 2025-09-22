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

