//
//  _Wip.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 23/09/2025.
//

// Improvement:
// used instead of TODO for not making lint warnings & qick search in codebase

/*
 + remove RawRepresentable conformance, rename NonEmpty generic parameter `Collection` to `Base`
 + deprecate init(rawValue:) initializer and rawValue property in NonEmpty library sources
 + move generalized collections to separate module
 - remove in NonEmpty library sources conditional conformances to ExpressibleByStringLiteral, ExpressibleByStringInterpolation,
   ExpressibleByArrayLiteral, ExpressibleByDictionaryLiteral
 */
