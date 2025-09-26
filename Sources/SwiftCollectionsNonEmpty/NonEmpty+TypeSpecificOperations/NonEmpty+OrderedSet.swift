//
//  NonEmptyOrderedSet.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

@_spi(NonEmptyExternallyExtendable) private import NonEmpty

extension NonEmpty: OrderedSetTypeSpecificUndestructiveNonEmptiness
  where Base: OrderedSetTypeSpecificUndestructiveNonEmptiness {
  @discardableResult
  public mutating func insert(_ item: Base.Element, at index: Int) -> (inserted: Bool, index: Int) {
    _baseReadModify.insert(item, at: index)
  }
  
  @discardableResult
  public mutating func updateOrAppend(_ item: Base.Element) -> Base.Element? {
    _baseReadModify.updateOrAppend(item)
  }
  
  @discardableResult
  public mutating func updateOrInsert(_ item: Base.Element,
                                      at index: Int) -> (originalMember: Base.Element?, index: Int) {
    _baseReadModify.updateOrInsert(item, at: index)
  }
  
  @discardableResult
  public mutating func update(_ item: Base.Element, at index: Int) -> Base.Element {
    _baseReadModify.update(item, at: index)
  }
  
  @discardableResult
  public mutating func append(_ item: Base.Element) -> (inserted: Bool, index: Int) {
    _baseReadModify.append(item)
  }
}

extension OrderedSet: OrderedSetTypeSpecificUndestructiveNonEmptiness {}

/// Needed to extend NonEmpty with OrderedSet specific operations, as extension to NonEmptyOrderedSet typealias doesn't allow to do it.
/// It also make a generalization of OrderedSet & NonEmptyOrderedSet in generic context.
public protocol OrderedSetTypeSpecificUndestructiveNonEmptiness: Collection {
  // Should only contain methods that OrderedSet already has
  
  @discardableResult mutating func insert(_ item: Element, at index: Int) -> (inserted: Bool, index: Int)
  
  @discardableResult mutating func updateOrAppend(_ item: Element) -> Element?
  
  @discardableResult mutating func updateOrInsert(_ item: Element, at index: Int) -> (originalMember: Element?, index: Int)
  
  @discardableResult mutating func update(_ item: Element, at index: Int) -> Element
  
  @discardableResult mutating func append(_ item: Element) -> (inserted: Bool, index: Int)
}
