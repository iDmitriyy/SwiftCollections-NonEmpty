//
//  NonEmptyOrderedSet.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

@_spi(NonEmptyExternallyExtendable) private import NonEmpty

//extension NonEmpty where Collection == OrderedSet<> {
extension NonEmptyOrderedSet where Collection.Element: Hashable {
  // public init(_ head: Collection.Element, _ tail: Collection.Element...) {
  public init(_ head: Collection.Element, _ tail: Collection.Element...) {
    self.init(head: head, tail: tail)
  }
  
  private init(head: Collection.Element, tail: [Collection.Element])  {
    self.init(_nonEmptyRawValueBuilder: {
      var rawValue = OrderedSet<Element>()
      rawValue.append(head)
      rawValue.append(contentsOf: tail)
      return rawValue as! Collection
    })
  }
}

//extension NonEmpty where Collection: MutableCollection {
//
//}
