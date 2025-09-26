//
//  SetProtocolConformances.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 25/09/2025.
//

extension Set: SetProtocol {}

extension OrderedSet: SetProtocol {}

extension TreeSet: SetProtocol {}

extension BitSet: SetProtocol {}

//#if canImport(Foundation)
//  public import struct Foundation.IndexSet
//
//  extension IndexSet {}
//  // The range of valid integer values is 0..<INT_MAX-1.
//  // Questions:
//  // Is it generalizable with other Set types
//  // How can NonEmptyness be done
//#endif

// MARK: UnorderedSetAlgebraCollection

extension Set: UnorderedSetAlgebraCollection {}

extension TreeSet: UnorderedSetAlgebraCollection {}

//@available(*, unavailable, message: "OrderedSet is incompatible with UnorderedSetAlgebraCollection")
//extension OrderedSet: UnorderedSetAlgebraCollection {}

extension BitSet: UnorderedSetAlgebraCollection {}

// MARK: EmptyInitializable Set

extension TreeSet: EmptyInitializableSet {}

// MARK: EmptyInitializable WithCapacity Set

extension Set: EmptyInitializableWithCapacitySet {}

extension OrderedSet: EmptyInitializableWithCapacitySet {}

// extension TreeSet: EmptyInitializableWithCapacitySet {} // no functions to reserveCapacity

extension BitSet: EmptyInitializableWithCapacitySet {}

