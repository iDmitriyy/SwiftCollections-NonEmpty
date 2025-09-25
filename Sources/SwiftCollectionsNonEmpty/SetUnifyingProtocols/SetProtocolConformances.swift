//
//  SetProtocolConformances.swift
//  swiftCollections-nonEmpty
//
//  Created by tmp on 25/09/2025.
//

extension Set: SetProtocol {}

extension OrderedSet: SetProtocol {}

extension TreeSet: SetProtocol {}

//#if canImport(Foundation)
//  public import struct Foundation.IndexSet
//
//  extension IndexSet {}
//  // The range of valid integer values is 0..<INT_MAX-1.
//  // Questions:
//  // Is it generalizable with other Set types
//  // How can NonEmptyness be done
//#endif

// MARK: EmptyInitializable WithCapacity Set

extension Set: EmptyInitializableWithCapacitySet {}

extension OrderedSet: EmptyInitializableWithCapacitySet {}

// extension TreeSet: EmptyInitializableWithCapacitySet {} // no functions to reserveCapacity
