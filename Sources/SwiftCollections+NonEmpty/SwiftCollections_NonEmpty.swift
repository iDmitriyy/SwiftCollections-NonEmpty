// The Swift Programming Language
// https://docs.swift.org/swift-book

public typealias NonEmptyOrderedSet<T: Hashable> = NonEmpty<OrderedSet<T>>

public typealias NonEmptyDeque<T: Hashable> = NonEmpty<Deque<T>>

public typealias NonEmptyBitArray = NonEmpty<BitArray>

public typealias NonEmptyBitSet = NonEmpty<BitSet>

public typealias NonEmptyTreeDictionary<Key: Hashable, Value> = NonEmpty<TreeDictionary<Key, Value>>

public typealias NonEmptyTreeSet<T: Hashable> = NonEmpty<TreeSet<T>>

// public typealias NonEmptyOrderedDictionary<Key: Hashable, Value> = NonEmpty<OrderedDictionary<Key, Value>>
