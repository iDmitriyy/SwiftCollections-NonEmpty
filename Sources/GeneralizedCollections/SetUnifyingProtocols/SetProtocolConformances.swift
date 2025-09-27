//
//  SetProtocolConformances.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 25/09/2025.
//

// MARK: Set Protocol

extension Set: SetProtocol {}

extension TreeSet: SetProtocol {}

extension BitSet: SetProtocol {}

extension OrderedSet: SetProtocol {}

//#if canImport(Foundation)
//  public import struct Foundation.IndexSet
//
//  extension IndexSet {}
//  // The range of valid integer values is 0..<INT_MAX-1.
//  // Questions:
//  // Is it generalizable with other Set types
//  // How can NonEmptyness be done
//#endif

// MARK: UnorderedInsert UndestructiveNonEmptyness Set

extension Set: UnorderedInsertSetProtocol {}

extension TreeSet: UnorderedInsertSetProtocol {}

//@available(*, unavailable, message: "OrderedSet is incompatible with `UnorderedInsertAdditiveMutableSetAlgebra`")
//extension OrderedSet: UnorderedInsertSetProtocol {} | insertion are at index

extension BitSet: UnorderedInsertSetProtocol {}

// MARK: EmptyInitializable WithCapacity Set

extension Set: EmptyInitializableWithCapacitySet {}

extension OrderedSet: EmptyInitializableWithCapacitySet {}

// extension TreeSet: EmptyInitializableWithCapacitySet {} // no functions to reserveCapacity

extension BitSet: EmptyInitializableWithCapacitySet {}

