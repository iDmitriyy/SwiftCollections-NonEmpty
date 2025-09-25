//
//  SetProtocolConformances.swift
//  swiftCollections-nonEmpty
//
//  Created by tmp on 25/09/2025.
//

extension Set: SetProtocol {}

extension OrderedSet: SetProtocol {}

extension TreeSet: SetProtocol {}

// MARK: EmptyInitializable WithCapacity Set

extension Set: EmptyInitializableWithCapacitySet {}

extension OrderedSet: EmptyInitializableWithCapacitySet {}

// extension TreeSet: EmptyInitializableWithCapacitySet {} // no functions to reserveCapacity
