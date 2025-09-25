//
//  SetCollection.swift
//  swiftCollections-nonEmpty
//
//  Created by tmp on 25/09/2025.
//

public protocol SetCollection<Element>: Collection {
  // MARK: Union

  func union<S>(_ other: S) -> Self where Element == S.Element, S: Sequence
  
  mutating func formUnion<S>(_ other: S) where Element == S.Element, S: Sequence
  
  // MARK: Subtracting
  
  func subtracting<S>(_ other: S) -> Self where Element == S.Element, S: Sequence
  
  func subtracting(_ other: Self) -> Self
  
  mutating func subtract<S>(_ other: S) where Element == S.Element, S: Sequence
  
  // MARK: Intersection
  
  func intersection<S>(_ other: S) -> Self where Element == S.Element, S: Sequence
  
  func intersection(_ other: Self) -> Self
  
  mutating func formIntersection<S>(_ other: S) where Element == S.Element, S: Sequence
  
  // MARK: Symmetric Difference
  
  func symmetricDifference<S>(_ other: S) -> Self where Element == S.Element, S: Sequence
  
  mutating func formSymmetricDifference<S>(_ other: S) where Element == S.Element, S: Sequence
  
  // MARK: Is Subset
  
  func isSubset<S>(of possibleSuperset: S) -> Bool where Element == S.Element, S: Sequence
  
  func isStrictSubset<S>(of possibleStrictSuperset: S) -> Bool where Element == S.Element, S: Sequence
  
  // MARK: Is Superset
  
  func isSuperset<S>(of possibleSubset: S) -> Bool where Element == S.Element, S: Sequence
  
  func isStrictSuperset<S>(of possibleStrictSubset: S) -> Bool where Element == S.Element, S: Sequence
  
  // MARK: Is Disjoint
  
  func isDisjoint<S>(with other: S) -> Bool where Element == S.Element, S: Sequence
}

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
