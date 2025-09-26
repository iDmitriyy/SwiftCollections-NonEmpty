//
//  NonEmpty+CollectionsSupport.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 26/09/2025.
//

// MARK: - NonEmpty Compatible Set Types

extension Set: @retroactive NonEmptyCompatibleCollection {}

extension OrderedSet: @retroactive NonEmptyCompatibleCollection {}

extension TreeSet: @retroactive NonEmptyCompatibleCollection {}

extension BitSet: @retroactive NonEmptyCompatibleCollection {}

/// Marker protocol for Set-Types allowing to make default initializers for NonEmpty like:
/// `init(element: Element)`
/// `init(elements first: Element, _ other: Element...) `
public protocol NonEmptyConvenienceInitAvailableOutOfBoxSet: NonEmptyCompatibleCollection, InitializableWithSequenceSet,
  CommonSetAlgebraWithAllSequencesCollection {}

extension Set: NonEmptyConvenienceInitAvailableOutOfBoxSet {}

extension OrderedSet: NonEmptyConvenienceInitAvailableOutOfBoxSet {}

extension TreeSet: NonEmptyConvenienceInitAvailableOutOfBoxSet {}

extension BitSet: NonEmptyConvenienceInitAvailableOutOfBoxSet {}
