//
//  SetProtocolConformances.swift
//  swiftCollections-nonEmpty
//
//  Created by tmp on 25/09/2025.
//

extension Set: SetProtocol {}

extension OrderedSet: SetProtocol {}

extension TreeSet: SetProtocol {}

#if canImport(Foundation)
  public import struct Foundation.IndexSet

extension IndexSet { // SetProtocol
    public mutating func formUnion(_ other: some Sequence<Element>) {
      let selfTypeAdapter = Self(other)
      formUnion(selfTypeAdapter) // IndexSet has no generic formUnion()
    }
  }
#endif

// MARK: EmptyInitializable WithCapacity Set

extension Set: EmptyInitializableWithCapacitySet {}

extension OrderedSet: EmptyInitializableWithCapacitySet {}

// extension TreeSet: EmptyInitializableWithCapacitySet {} // no functions to reserveCapacity

// MARK: - NonEmpty Compatible SetCollection

extension Set: NonEmptyCompatibleSetCollection {}

extension OrderedSet: NonEmptyCompatibleSetCollection {}

extension TreeSet: NonEmptyCompatibleSetCollection {}
