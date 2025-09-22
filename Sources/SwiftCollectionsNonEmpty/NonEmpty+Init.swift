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
  internal init(head: Element, tail: [Element]) {
    var coll = Collection()
    coll.append(head)
    coll.append(contentsOf: tail)
    self.init(_ucheckedNonEmptyRawValue: coll)
  }
  
  @inlinable @inline(__always)
  internal init(head: Element, tail: Element...) {
    self.init(head: head, tail: tail)
  }
}

//extension NonEmpty where Collection: MutableCollection {
//
//}
