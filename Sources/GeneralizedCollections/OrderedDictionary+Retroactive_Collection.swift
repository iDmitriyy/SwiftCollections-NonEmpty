//
//  OrderedDictionary+Collection.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

extension OrderedDictionary: @retroactive Collection {
  public var startIndex: Int { elements.startIndex }
  
  public var endIndex: Int { elements.endIndex }
  
  public func index(after i: Int) -> Int { elements.index(after: i) }
  
  public subscript(position: Int) -> (key: Key, value: Value) { elements[position] }
}
