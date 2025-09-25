//
//  NonEmpty+BigSubString.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 22/09/2025.
//

@available(macOS 13.3, iOS 16.4, watchOS 9.4, tvOS 16.4, *)
extension BigSubstring: NonEmptyHeadTailInitDisallowed {}

extension NonEmpty: Equatable where Collection: Equatable {}
