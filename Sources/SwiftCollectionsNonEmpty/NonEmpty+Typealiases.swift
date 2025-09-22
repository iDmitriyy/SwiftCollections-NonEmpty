//
//  Typealiases.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

// MARK: swift-collections

/*
 Collection protocols of underlying wrapped Type are listed for each typealias in comments in format:
 typealias Name
 `protocols for init` | `protocols with specific operations`
 
 1. `protocols for init` allows to implement generic initializers in extension to NonEmpty.
 2. `protocols with specific operations` helps to have a quick look on what methods ara available for a type and understand
 what operations are allowed without invariants violation.
 */

public typealias NonEmptyDeque<T: Hashable> = NonEmpty<Deque<T>>
// RangeReplaceable Mutable | RandomAccess Bidirectional ExpressibleByArrayLiteral

public typealias NonEmptyOrderedSet<T: Hashable> = NonEmpty<OrderedSet<T>>
// none | RandomAccess Bidirectional _UniqueCollection ExpressibleByArrayLiteral

public typealias NonEmptyBitArray = NonEmpty<BitArray>
// RangeReplaceable Mutable | RandomAccess Bidirectional ExpressibleByArrayLiteral

public typealias NonEmptyBitSet = NonEmpty<BitSet>
// none | Bidirectional SetAlgebra _UniqueCollection _SortedCollection ExpressibleByArrayLiteral

public typealias NonEmptyOrderedDictionary<Key: Hashable, Value> = NonEmpty<OrderedDictionary<Key, Value>>
// none | @retroactive.Collection ExpressibleByDictionaryLiteral

public typealias NonEmptyTreeDictionary<Key: Hashable, Value> = NonEmpty<TreeDictionary<Key, Value>>
// none | Collection ExpressibleByDictionaryLiteral

public typealias NonEmptyTreeSet<T: Hashable> = NonEmpty<TreeSet<T>>
// none | Collection SetAlgebra _UniqueCollection ExpressibleByArrayLiteral

@available(macOS 13.3, iOS 16.4, watchOS 9.4, tvOS 16.4, *)
public typealias NonEmptyBigString = NonEmpty<BigString>
// RangeReplaceable | Bidirectional
// ps: ExpressibleByUnicodeScalarLiteral & ExpressibleByExtendedGraphemeClusterLiteral are safe to use with NonEmpty as they are checked
// by compiler to be not empty literal.
// ExpressibleByStringLiteral is Not safe to use as there are no compile time checks.

@available(macOS 13.3, iOS 16.4, watchOS 9.4, tvOS 16.4, *)
public typealias NonEmptyBigSubstring = NonEmpty<BigSubstring>
// RangeReplaceable | Bidirectional
// ps: ExpressibleByUnicodeScalarLiteral & ExpressibleByExtendedGraphemeClusterLiteral are safe to use with NonEmpty as they are checked
// by compiler to be not empty literal.
// ExpressibleByStringLiteral is Not safe to use as there are no compile time checks.

// MARK: - Standard Library Collections

// public typealias NonEmptyString<T> = NonEmpty<String> | declared in NonEmpty library
// RangeReplaceable | Bidirectional StringProtocol
// ps: ExpressibleByUnicodeScalarLiteral & ExpressibleByExtendedGraphemeClusterLiteral are safe to use with NonEmpty as they are checked
// by compiler to be not empty literal.
// ExpressibleByStringLiteral & ExpressibleByStringInterpolation are Not safe to use as there are no compile time checks.

public typealias NonEmptySubstring = NonEmpty<Substring>
// RangeReplaceable | Bidirectional StringProtocol
// ps: ExpressibleByUnicodeScalarLiteral & ExpressibleByExtendedGraphemeClusterLiteral are safe to use with NonEmpty as they are checked
// by compiler to be not empty literal.
// ExpressibleByStringLiteral & ExpressibleByStringInterpolation are Not safe to use as there are no compile time checks.

// public typealias NonEmptyArray<T> = NonEmpty<Array<T>> | declared in NonEmpty library
// RangeReplaceable Mutable | RandomAccess Bidirectional ExpressibleByArrayLiteral

// public typealias NonEmptySet<T> = NonEmpty<Set<T>> | declared in NonEmpty library
// none | Collection SetAlgebra ExpressibleByArrayLiteral

// public typealias NonEmptyDictionary<T> = NonEmpty<Dictionary<T>> | declared in NonEmpty library
// none | Collection ExpressibleByDictionaryLiteral

public typealias NonEmptyContiguousArray<T> = NonEmpty<ContiguousArray<T>>
// RangeReplaceable Mutable | RandomAccess Bidirectional ExpressibleByArrayLiteral

public typealias NonEmptyCollectionOfOne<T> = NonEmpty<CollectionOfOne<T>>
// Mutable | RandomAccess Bidirectional

// public typealias NonEmptyRange<T: Comparable & Strideable> = NonEmpty<Range<T>> where T.Stride: SignedInteger
// none | RandomAccess Bidirectional RangeExpression

// public typealias NonEmptyClosedRange<T: Comparable & Strideable> = NonEmpty<ClosedRange<T>> where T.Stride: SignedInteger
// none | RandomAccess Bidirectional RangeExpression

// public typealias NonEmptyRangeSet<Bound: Comparable> = NonEmpty<RangeSet<Bound>>
// none | 'RangeSet' does not conform to protocol 'Collection'

// MARK: - Foundation

#if canImport(Foundation)
  public import struct Foundation.IndexSet

  // public import struct Foundation.CharacterSet

public typealias NonEmptyIndexSet = NonEmpty<IndexSet>
  // none | Bidirectional SetAlgebra ExpressibleByArrayLiteral

// public typealias NonEmptyCharacterSet = NonEmpty<CharacterSet>
  // none | 'CharacterSet' does not conform to protocol 'Collection'

#endif
