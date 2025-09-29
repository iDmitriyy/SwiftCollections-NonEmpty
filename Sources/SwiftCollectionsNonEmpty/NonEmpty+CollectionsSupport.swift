//
//  NonEmpty+CollectionsSupport.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 26/09/2025.
//

// MARK: - Set Types Compatible with NonEmpty  

extension Set: @retroactive NonEmptyCompatibleCollection {}

extension OrderedSet: @retroactive NonEmptyCompatibleCollection {}

extension TreeSet: @retroactive NonEmptyCompatibleCollection {}

extension BitSet: @retroactive NonEmptyCompatibleCollection {}

/// Marker protocol for Set-Types allowing to make default initializers for NonEmpty like:
/// `init(element: Element)`
/// `init(elements first: Element, _ other: Element...) `
public protocol NonEmptyConvenienceInitOutOfBoxSet: NonEmptyCompatibleCollection, InitializableWithSequenceSet,
  AdditiveSetAlgebraWithAllSequences {}

extension Set: NonEmptyConvenienceInitOutOfBoxSet {}

extension OrderedSet: NonEmptyConvenienceInitOutOfBoxSet {}

extension TreeSet: NonEmptyConvenienceInitOutOfBoxSet {}

extension BitSet: NonEmptyConvenienceInitOutOfBoxSet {}
