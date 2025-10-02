//
//  SetCollection.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 25/09/2025.
//

// Collection inheritance moved to SetProtocol and UnorderedInsertSetProtocol
// for types without conformance to Collection like
public protocol SetCollection<Element>: ~Copyable {
  associatedtype Element: ~Copyable
  
  func contains(_ member: borrowing Element) -> Bool // from Swift.SetAlgebra
}

// MARK: - Additive SetAlgebra

public protocol AdditiveSetAlgebraWithAllSequences: SetCollection, ~Copyable {
  // Union

  consuming func union(_ other: some Sequence<Element>) -> Self
  
  mutating func formUnion(_ other: some Sequence<Element>)
  
  // Is Subset & Strict
  
  func isSubset(of possibleSuperset: some Sequence<Element>) -> Bool
  
  func isStrictSubset(of possibleStrictSuperset: some Sequence<Element>) -> Bool
  
  // Is Disjoint
  
  func isDisjoint(with other: some Sequence<Element>) -> Bool
  
  // Is Superset & Strict
  
  func isSuperset(of possibleSubset: some Sequence<Element>) -> Bool
  
  func isStrictSuperset(of possibleStrictSubset: some Sequence<Element>) -> Bool
}

public protocol AdditiveSetAlgebraWithSelf: SetCollection, ~Copyable {
  // Union
  
  consuming func union(_ other: consuming Self) -> Self
  
  mutating func formUnion(_ other: consuming Self)
  
  // Is Subset & Strict
  
  func isSubset(of other: borrowing Self) -> Bool
  
  func isStrictSubset(of other: borrowing Self) -> Bool
  
  // Is Disjoint
  
  func isDisjoint(with other: borrowing Self) -> Bool
  
  // Is Superset & Strict
  
  func isSuperset(of other: borrowing Self) -> Bool
  
  func isStrictSuperset(of other: borrowing Self) -> Bool
}

// MARK: - Subtractive Result SetAgebra

public protocol SubtractiveResultSetAgebraWithAllSequences: AdditiveSetAlgebraWithAllSequences {
  associatedtype CanBeEmptySetType: SubtractiveResultSetAgebraWithAllSequences
  
  func intersection(_ other: some Sequence<Element>) -> CanBeEmptySetType
  
  func symmetricDifference(_ other: some Sequence<Element>) -> CanBeEmptySetType
  
  func subtracting(_ other: some Sequence<Element>) -> CanBeEmptySetType
}

public protocol SubtractiveResultSetAgebraWithSelf: AdditiveSetAlgebraWithSelf, ~Copyable {
  associatedtype CanBeEmptySetType: SubtractiveResultSetAgebraWithSelf, ~Copyable
  
  borrowing func intersection(_ other: consuming Self) -> CanBeEmptySetType
  
  consuming func symmetricDifference(_ other: consuming Self) -> CanBeEmptySetType
  
  consuming func subtracting(_ other: borrowing Self) -> CanBeEmptySetType
}

// MARK: - SelfSubtractive SetAlgebra

public protocol SelfSubtractiveSetAlgebraWithAllSequences: SubtractiveResultSetAgebraWithAllSequences where CanBeEmptySetType == Self {
  mutating func formIntersection(_ other: some Sequence<Element>)

  mutating func formSymmetricDifference(_ other: some Sequence<Element>)
  
  mutating func subtract(_ other: some Sequence<Element>)
}

public protocol SelfSubtractiveSetAlgebraWithSelf: SubtractiveResultSetAgebraWithSelf, ~Copyable where CanBeEmptySetType == Self {
  mutating func formIntersection(_ other: borrowing Self)
  
  mutating func formSymmetricDifference(_ other: consuming Self)
  
  mutating func subtract(_ other: borrowing Self)
}

// MARK: - SelfSubtracting Element SetAlgebra

public protocol SelfSubtractingElementSetAlgebra: SetCollection {
  @discardableResult
  mutating func remove(_ member: borrowing Element) -> Element?
}

// MARK: - UnorderedInsert Additive Mutable SetAlgebra

public protocol UnorderedInsertAdditiveMutableSetAlgebra: SetCollection { // SubtractiveResultSetAgebra
  // Operations not available for OrderedSet. Set, TreeSet, BitSet have them:
  
  @discardableResult
  mutating func insert(_ newMember: consuming Element) -> (inserted: Bool, memberAfterInsert: Element)
  
  @discardableResult
  mutating func update(with newMember: consuming Element) -> Element?
}

// -----------------------------------------------------------------------------------------------------------------------

// extension SetAlgebra { // default imps
//  @inlinable public init<S>(_ sequence: S) where S : Sequence, Self.Element == S.Element
//
//  @inlinable public mutating func subtract(_ other: Self)
//
//  @inlinable public func isSubset(of other: Self) -> Bool
//
//  @inlinable public func isSuperset(of other: Self) -> Bool
//
//  @inlinable public func isDisjoint(with other: Self) -> Bool
//
//  @inlinable public func subtracting(_ other: Self) -> Self
//
//  @inlinable public var isEmpty: Bool { get }
//
//  @inlinable public func isStrictSuperset(of other: Self) -> Bool
//
//  @inlinable public func isStrictSubset(of other: Self) -> Bool
// }

// extension SetAlgebra where Self.ArrayLiteralElement == Self.Element {
//  @inlinable public init(arrayLiteral: Self.Element...)
// }

// extension Set where Element : Sequence {
//  func joined() -> FlattenSequence<Set<Element>>
//
//  func joined<Separator>(separator: Separator) -> JoinedSequence<Set<Element>> where Separator : Sequence, Separator.Element == Element.Element
// }

// extension Set where Element : Comparable {
//  @warn_unqualified_access func min() -> Element?
//
//  @warn_unqualified_access func max() -> Element?
//
//  func lexicographicallyPrecedes<OtherSequence>(_ other: OtherSequence) -> Bool where OtherSequence : Sequence, Element == OtherSequence.Element
//
//  public func sorted() -> [Element] // ? make generic `Ordered` result?
// }

// extension Set where Element : StringProtocol {
//  func joined(separator: String = "") -> String
// }

// private import struct Foundation.IndexSet

// func `common / shared functions for NonEmptyCompatibleSetCollection protocol's design`() {
//  var set = Set<Int>()
//  var orderedSet = OrderedSet<Int>()
////  var indexSet = IndexSet()
//  var treeSet = TreeSet<Int>()
//  var bitSet = BitSet()
//
//  // set.formUnion()
//  // set.update(with: )
//  // set.insert()
//
//  // treeSet.formUnion()
//  // treeSet.update(with:)
//  // treeSet.insert()
//
//  // bitSet.formUnion()
//  // bitSet.update(with:)
//  // bitSet.insert()
//
//  // indexSet.formUnion()
//  // indexSet.update(with:)
//  // indexSet.insert()
//  
//  // orderedSet.remove()
//  // orderedSet.formUnion()
//  // orderedSet.update(, at:)
//  // orderedSet.insert(, at:)
//  // orderedSet.append()
//  // orderedSet.updateOrAppend()
//  // orderedSet.append(contentsOf)
// }
