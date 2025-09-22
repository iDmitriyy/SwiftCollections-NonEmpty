//
//  _PlaygroundInit.swift
//  swiftCollections-nonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

import Playgrounds

#Playground {
//  NonEmptyEmptyCollection<Int>.init(rawValue: EmptyCollection<Int>())
//  NonEmptyEmptyCollection<Int>.init(1, 2)
//  NonEmptyEmptyCollection<Int>.init(1)
  
  // MARK: RangeReplaceable based init
  
  // NonEmptyArray.init(head: 1, tail: [2]) // Ambiguous use of 'init(head:tail:)'
  
  
  let _ = NonEmptyContiguousArray.init(1, 2)
  
  // NonEmptyDeque.init(1, 2) as NonEmptyDeque<Int> // Ambiguous use of 'init(_:_:)'
  let _ = NonEmptyDeque.init(1, 2)
  
  let _ = NonEmptyBitArray(true, false)
  
//  let _ = NonEmptyOrderedSet.init(1, 2)
  // let _ = NonEmptyOrderedSet.init(head: 1, tail: 2)
  
  // let _ = NonEmptyBitSet(head: 1, tail: 2) // requires that 'BitSet' conform to 'RangeReplaceableCollection'
  
  // let _ = NonEmptyOrderedDictionary.init(head: (1, 1), tail: (2, 3)) // requires that 'OrderedDictionary<Int, Int>' conform to 'RangeReplaceableCollection'
  
  // let _ = NonEmptyTreeDictionary.init(head: (1, 1), tail: (2, 3)) // Error 'RangeReplaceableCollection'
  
  // let _ = NonEmptyTreeSet.init(head: 1, tail: 2) // Error 'RangeReplaceableCollection'
  
  var one = CollectionOfOne(1)
  one.first
}
