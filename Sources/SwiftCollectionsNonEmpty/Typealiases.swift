//
//  Typealiases.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

public typealias NonEmptyContiguousArray<T> = NonEmpty<ContiguousArray<T>>

public typealias NonEmptyDeque<T: Hashable> = NonEmpty<Deque<T>>

public typealias NonEmptyOrderedSet<T: Hashable> = NonEmpty<OrderedSet<T>>

public typealias NonEmptyBitArray = NonEmpty<BitArray>

public typealias NonEmptyBitSet = NonEmpty<BitSet>

public typealias NonEmptyOrderedDictionary<Key: Hashable, Value> = NonEmpty<OrderedDictionary<Key, Value>>

public typealias NonEmptyTreeDictionary<Key: Hashable, Value> = NonEmpty<TreeDictionary<Key, Value>>

public typealias NonEmptyTreeSet<T: Hashable> = NonEmpty<TreeSet<T>>

