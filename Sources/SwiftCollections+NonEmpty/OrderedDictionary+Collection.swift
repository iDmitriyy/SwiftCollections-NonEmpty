//
//  OrderedDictionary+Collection.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

extension OrderedDictionary: @retroactive Collection {
  public var startIndex: Int { keys.startIndex }
  
  public var endIndex: Int { keys.endIndex }
  
  public func index(after i: Int) -> Int { keys.index(after: i) }
  
  @inlinable @inline(__always)
  public subscript(position: Int) -> (key: Key, value: Value) {
    get { (keys[position], values[position]) }
  }
}
