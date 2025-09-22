//
//  Typealiases.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

public import struct _RopeModule.BigString

// MARK: swift-collections

/*
 Collection protocols of underlying wrapped Type are listed for each typealias in comments in format:
 `protocols for init` | `protocols with specific operations`
 1. `protocols for init` allows to implement generic initializers in extension to NonEmpty.
 2. `protocols with specific operations` helps to have a quick look on what methods ara available for a type and understand
 what operations are allowed without invariants violation.
 */

// RangeReplaceableCollection MutableCollection | RandomAccessCollection BidirectionalCollection ExpressibleByArrayLiteral
public typealias NonEmptyDeque<T: Hashable> = NonEmpty<Deque<T>>

// none | RandomAccessCollection BidirectionalCollection _UniqueCollection ExpressibleByArrayLiteral
public typealias NonEmptyOrderedSet<T: Hashable> = NonEmpty<OrderedSet<T>>

// RangeReplaceableCollection MutableCollection | RandomAccessCollection BidirectionalCollection ExpressibleByArrayLiteral
public typealias NonEmptyBitArray = NonEmpty<BitArray>

// none | BidirectionalCollection SetAlgebra _UniqueCollection _SortedCollection ExpressibleByArrayLiteral
public typealias NonEmptyBitSet = NonEmpty<BitSet>

// none | @retroactive.Collection ExpressibleByDictionaryLiteral
public typealias NonEmptyOrderedDictionary<Key: Hashable, Value> = NonEmpty<OrderedDictionary<Key, Value>>

// none | Collection ExpressibleByDictionaryLiteral
public typealias NonEmptyTreeDictionary<Key: Hashable, Value> = NonEmpty<TreeDictionary<Key, Value>>

// none | Collection SetAlgebra _UniqueCollection ExpressibleByArrayLiteral
public typealias NonEmptyTreeSet<T: Hashable> = NonEmpty<TreeSet<T>>

// RangeReplaceableCollection | BidirectionalCollection
// ps: ExpressibleByUnicodeScalarLiteral & ExpressibleByExtendedGraphemeClusterLiteral are safe to use with NonEmpty as they are checked
// by compiler to be not empty literal.
// ExpressibleByStringLiteral is Not safe to use as there are no compile time checks.
@available(macOS 13.3, iOS 16.4, watchOS 9.4, tvOS 16.4, *)
public typealias NonEmptyBigString = NonEmpty<BigString>

// MARK: - Standard Library Collections

// RangeReplaceableCollection MutableCollection | RandomAccessCollection BidirectionalCollection ExpressibleByArrayLiteral
// public typealias NonEmptyArray<T> = NonEmpty<Array<T>> | declared in NonEmpty library

// none | Collection SetAlgebra ExpressibleByArrayLiteral
// public typealias NonEmptySet<T> = NonEmpty<Set<T>> | declared in NonEmpty library

// none | Collection ExpressibleByDictionaryLiteral
// public typealias NonEmptyDictionary<T> = NonEmpty<Dictionary<T>> | declared in NonEmpty library

// RangeReplaceableCollection MutableCollection | RandomAccessCollection BidirectionalCollection ExpressibleByArrayLiteral
public typealias NonEmptyContiguousArray<T> = NonEmpty<ContiguousArray<T>>

// MutableCollection | RandomAccessCollection BidirectionalCollection
public typealias NonEmptyCollectionOfOne<T> = NonEmpty<CollectionOfOne<T>>


// none | RandomAccessCollection BidirectionalCollection RangeExpression
// public typealias NonEmptyRange<T: Comparable & Strideable> = NonEmpty<Range<T>> where T.Stride: SignedInteger

// none | RandomAccessCollection BidirectionalCollection RangeExpression
// public typealias NonEmptyClosedRange<T: Comparable & Strideable> = NonEmpty<ClosedRange<T>> where T.Stride: SignedInteger

// none | 'RangeSet' does not conform to protocol 'Collection'
// public typealias NonEmptyRangeSet<Bound: Comparable> = NonEmpty<RangeSet<Bound>>

// MARK: - Foundation

#if canImport(Foundation)
  public import struct Foundation.IndexSet

  // public import struct Foundation.CharacterSet

  // none | BidirectionalCollection SetAlgebra ExpressibleByArrayLiteral
  public typealias NonEmptyIndexSet = NonEmpty<IndexSet>

  // none | 'CharacterSet' does not conform to protocol 'Collection'
  // public typealias NonEmptyCharacterSet = NonEmpty<CharacterSet>

#endif
