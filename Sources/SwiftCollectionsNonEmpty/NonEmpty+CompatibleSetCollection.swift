//
//  NonEmpty+CompatibleSetCollection.swift
//  swiftCollections-nonEmpty
//
//  Created by tmp on 22/09/2025.
//

public protocol NonEmptyCompatibleSetCollection: Sequence {
  init<Source>(_ sequence: Source) where Element == Source.Element, Source: Sequence
  
  mutating func formUnion(_ other: some Sequence<Element>)
}

// MARK: - Conformances

extension Set: NonEmptyCompatibleSetCollection {}

extension OrderedSet: NonEmptyCompatibleSetCollection {}

extension TreeSet: NonEmptyCompatibleSetCollection {}

extension BitSet: NonEmptyCompatibleSetCollection {}

#if canImport(Foundation)
  public import struct Foundation.IndexSet

  extension IndexSet: NonEmptyCompatibleSetCollection {
    public mutating func formUnion(_ other: some Sequence<Element>) {
      let selfTypeAdapter = Self(other)
      formUnion(selfTypeAdapter) // IndexSet has no generic init from `Sequence<Element>`
    }
  }
#endif

// func `common / shared functions for NonEmptyCompatibleSetCollection protocol's design`() {
//  var set = Set<Int>()
//  var orderedSet = OrderedSet<Int>()
//  var indexSet = IndexSet()
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
//  // orderedSet.formUnion()
//  // orderedSet.update(, at:)
//  // orderedSet.insert(, at:)
//  // orderedSet.append()
//  // orderedSet.updateOrAppend()
//  // orderedSet.append(contentsOf)
// }
