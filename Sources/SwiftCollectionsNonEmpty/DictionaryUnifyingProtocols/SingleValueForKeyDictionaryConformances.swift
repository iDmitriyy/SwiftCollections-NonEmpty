//
//  SingleValueForKeyDictionaryConformances.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 23/09/2025.
//

// MARK: - Conformances

extension Dictionary: SingleValueForKeyDictionary {}

extension OrderedDictionary: SingleValueForKeyDictionary {}

extension TreeDictionary: SingleValueForKeyDictionary {}
