//
//  _Playground.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

import Playgrounds

#Playground {
  // NonEmptyArray.init(head: 1, tail: [2]) // Ambiguous use of 'init(head:tail:)'
  let _ = NonEmptyArray.init(head: 1, tail: 2)
  
  let _ = NonEmptyContiguousArray.init(head: 1, tail: 2)
  
  // NonEmptyDeque.init(1, 2) as NonEmptyDeque<Int> // Ambiguous use of 'init(_:_:)'
  let _ = NonEmptyDeque.init(head: 1, tail: 2)
  
  let _ = NonEmptyOrderedSet.init(1, 2)
  // let _ = NonEmptyOrderedSet.init(head: 1, tail: 2)
  
  let _ = NonEmptyBitArray(head: true, tail: false)
  
  // let _ = NonEmptyBitSet(head: 1, tail: 2) // requires that 'BitSet' conform to 'RangeReplaceableCollection'
  
  // let _ = NonEmptyOrderedDictionary.init(head: (1, 1), tail: (2, 3)) // requires that 'OrderedDictionary<Int, Int>' conform to 'RangeReplaceableCollection'
  
  // let _ = NonEmptyTreeDictionary.init(head: (1, 1), tail: (2, 3)) // Error 'RangeReplaceableCollection'
  
  // let _ = NonEmptyTreeSet.init(head: 1, tail: 2) // Error 'RangeReplaceableCollection'
}
