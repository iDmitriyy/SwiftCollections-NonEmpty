//
//  NonEmpty+EmptyCollection.swift
//  swiftCollections-nonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

@available(*, deprecated, message: "Can not be NonEmpty")
public typealias NonEmptyEmptyCollection<T> = NonEmpty<EmptyCollection<T>>

extension EmptyCollection: NonEmptyInitWithRawValueDisallowed {}

// head tail init is already unavailable as EmptyCollection does not conform to RangeReplaceableCollection
// extension EmptyCollection: NonEmptyHeadTailInitDisallowed {}
