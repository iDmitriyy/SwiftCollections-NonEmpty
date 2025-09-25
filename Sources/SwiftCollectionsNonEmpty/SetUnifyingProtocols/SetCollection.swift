//
//  SetCollection.swift
//  swiftCollections-nonEmpty
//
//  Created by tmp on 25/09/2025.
//

public protocol SetCollection<Element>: Collection {}

// MARK: - Common SetAlgebra With Sequence

/// Common Set operations with all Sequence types
public protocol CommonSetAlgebraWithAnySequenceCollection: Collection {
  // MARK: Union

  func union<S>(_ other: S) -> Self where Element == S.Element, S: Sequence
  
  mutating func formUnion<S>(_ other: S) where Element == S.Element, S: Sequence
  
  // MARK: Intersection
  
  func intersection<S>(_ other: S) -> Self where Element == S.Element, S: Sequence
  
  mutating func formIntersection<S>(_ other: S) where Element == S.Element, S: Sequence
  
  // MARK: Symmetric Difference
  
  func symmetricDifference<S>(_ other: S) -> Self where Element == S.Element, S: Sequence
  
  mutating func formSymmetricDifference<S>(_ other: S) where Element == S.Element, S: Sequence
  
  // MARK: Subtracting
  
  func subtracting<S>(_ other: S) -> Self where Element == S.Element, S: Sequence
  
  mutating func subtract<S>(_ other: S) where Element == S.Element, S: Sequence
  
  // MARK: Is Subset & Strict
  
  func isSubset<S>(of possibleSuperset: S) -> Bool where Element == S.Element, S: Sequence
  
  func isStrictSubset<S>(of possibleStrictSuperset: S) -> Bool where Element == S.Element, S: Sequence
  
  // MARK: Is Disjoint
  
  func isDisjoint<S>(with other: S) -> Bool where Element == S.Element, S: Sequence
  
  // MARK: Is Superset & Strict
  
  func isSuperset<S>(of possibleSubset: S) -> Bool where Element == S.Element, S: Sequence
  
  func isStrictSuperset<S>(of possibleStrictSubset: S) -> Bool where Element == S.Element, S: Sequence
}

// MARK: - Common SetAlgebra With Self

/// Partial duplication of Swift.SetAlgebra
/// Common Set operations with all Self type
public protocol CommonSetAlgebraCollection: Collection {
  func contains(_ member: Self.Element) -> Bool
  
  // MARK: Union
  
  func union(_ other: Self) -> Self
  
  mutating func formUnion(_ other: Self)
  
  // MARK: Intersection
  
  func intersection(_ other: Self) -> Self
  
  mutating func formIntersection(_ other: Self)
  
  // MARK: Symmetric Difference
  
  func symmetricDifference(_ other: Self) -> Self
  
  mutating func formSymmetricDifference(_ other: Self)
  
  // MARK: Subtracting
  
  func subtracting(_ other: Self) -> Self
  
  mutating func subtract(_ other: Self)
  
  @discardableResult
  mutating func remove(_ member: Self.Element) -> Self.Element?
  
  // MARK: Is Subset & Strict
  
  func isSubset(of other: Self) -> Bool
  
  func isStrictSubset(of other: Self) -> Bool
  
  // MARK: Is Disjoint
  
  func isDisjoint(with other: Self) -> Bool
  
  // MARK: Is Superset & Strict
  
  func isSuperset(of other: Self) -> Bool
  
  func isStrictSuperset(of other: Self) -> Bool
}

public protocol UnorderedSetAlgebraCollection: Collection {
  // Operations unavailable for OrderedSet:
  
  @discardableResult
  mutating func insert(_ newMember: Self.Element) -> (inserted: Bool, memberAfterInsert: Self.Element)
  
  @discardableResult
  mutating func update(with newMember: Self.Element) -> Self.Element?
}

//extension SetAlgebra { // default imps
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
//}

//extension SetAlgebra where Self.ArrayLiteralElement == Self.Element {
//  @inlinable public init(arrayLiteral: Self.Element...)
//}

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

private import struct Foundation.IndexSet

func `common / shared functions for NonEmptyCompatibleSetCollection protocol's design`() {
  var set = Set<Int>()
  var orderedSet = OrderedSet<Int>()
  var indexSet = IndexSet()
  var treeSet = TreeSet<Int>()
  var bitSet = BitSet()
  
  // set.formUnion()
  // set.update(with: )
  // set.insert()

  // treeSet.formUnion()
  // treeSet.update(with:)
  // treeSet.insert()

  // bitSet.formUnion()
  // bitSet.update(with:)
  // bitSet.insert()

  // indexSet.formUnion()
  // indexSet.update(with:)
  // indexSet.insert()

  // orderedSet.formUnion()
  // orderedSet.update(, at:)
  // orderedSet.insert(, at:)
  // orderedSet.append()
  // orderedSet.updateOrAppend()
  // orderedSet.append(contentsOf)
 }
