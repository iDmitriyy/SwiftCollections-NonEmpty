//
//  NonEmpty+CollectionsSupport.swift
//  swiftCollections-nonEmpty
//
//  Created by tmp on 26/09/2025.
//

// MARK: - NonEmpty Compatible SetCollection

extension Set: @retroactive NonEmptyCompatibleCollection {}

extension OrderedSet: @retroactive NonEmptyCompatibleCollection {}

extension TreeSet: @retroactive NonEmptyCompatibleCollection {}

/// Marker protocol for Set-Types allowing to make default initializers for NonEmpty like:
/// `init(element: Element)`
/// `init(elements first: Element, _ other: Element...) `
public protocol NonEmptyAvailableOutOfBoxConvenienceInitSet: NonEmptyCompatibleCollection, SetCollection, InitializableWithSequenceSet,
  CommonSetAlgebraWithAnySequenceCollection {}

extension Set: NonEmptyAvailableOutOfBoxConvenienceInitSet {}

extension OrderedSet: NonEmptyAvailableOutOfBoxConvenienceInitSet {}

extension TreeSet: NonEmptyAvailableOutOfBoxConvenienceInitSet {}
