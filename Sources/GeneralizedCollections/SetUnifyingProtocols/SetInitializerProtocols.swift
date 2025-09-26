//
//  SetInitializerProtocols.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 25/09/2025.
//

// MARK: - Empty Initializable

public protocol EmptyInitializableSet<Element>: SetCollection {
  init()
}

// MARK: - Capacity Reservable

public protocol CapacityReservableSet<Element>: SetCollection {
  mutating func reserveCapacity(_ minimumCapacity: Int)
}

// MARK: - Empty Initializable With Capacity Set

public protocol EmptyInitializableWithCapacitySet<Element>: EmptyInitializableSet, CapacityReservableSet {}

// MARK: - Initializable With Sequence Set

public protocol InitializableWithSequenceSet<Element>: SetCollection {
  /// From Swift.SetAlgebra protocol
  init(_ sequence: some Sequence<Element>)
}
