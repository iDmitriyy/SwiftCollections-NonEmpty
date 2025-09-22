//
//  Typealiases.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

public import struct _RopeModule.BigString

// MARK: swift-collections

public typealias NonEmptyDeque<T: Hashable> = NonEmpty<Deque<T>>

public typealias NonEmptyOrderedSet<T: Hashable> = NonEmpty<OrderedSet<T>>

public typealias NonEmptyBitArray = NonEmpty<BitArray>

public typealias NonEmptyBitSet = NonEmpty<BitSet>

public typealias NonEmptyOrderedDictionary<Key: Hashable, Value> = NonEmpty<OrderedDictionary<Key, Value>>

public typealias NonEmptyTreeDictionary<Key: Hashable, Value> = NonEmpty<TreeDictionary<Key, Value>>

public typealias NonEmptyTreeSet<T: Hashable> = NonEmpty<TreeSet<T>>

@available(macOS 13.3, iOS 16.4, watchOS 9.4, tvOS 16.4, *)
public typealias NonEmptyBigString = NonEmpty<BigString>

// MARK: Standard Library Collections

public typealias NonEmptyContiguousArray<T> = NonEmpty<ContiguousArray<T>>

public typealias NonEmptyCollectionOfOne<T> = NonEmpty<CollectionOfOne<T>>

// public typealias NonEmptyRangeSet<Bound: Comparable> = NonEmpty<RangeSet<Bound>>

// public typealias NonEmptyRange<T: Comparable & Strideable> = NonEmpty<Range<T>> where T.Stride: SignedInteger

// MARK: Foundation

#if canImport(Foundation)
public import struct Foundation.IndexSet
//public import struct Foundation.CharacterSet

public typealias NonEmptyIndexSet = NonEmpty<IndexSet>

// 'CharacterSet' does not conform to protocol 'Collection'
// public typealias NonEmptyCharacterSet = NonEmpty<CharacterSet>

#endif
