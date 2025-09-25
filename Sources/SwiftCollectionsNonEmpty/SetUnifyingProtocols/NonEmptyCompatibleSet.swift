//
//  NonEmptyCompatibleSet.swift
//  swiftCollections-nonEmpty
//
//  Created by tmp on 25/09/2025.
//

/// Marker protocol for Set-Types that can be used with `NonEmpty`
public protocol NonEmptyCompatibleSetCollection: NonEmptyCompatibleCollection, SetCollection, InitializableWithSequenceSet {}
