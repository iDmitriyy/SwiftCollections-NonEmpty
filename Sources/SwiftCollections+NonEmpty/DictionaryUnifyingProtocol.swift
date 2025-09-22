//
//  DictionaryUnifyingProtocol.swift
//  SwiftCollections+NonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

public protocol DictionaryRootProtocol<Key, Value>: Swift.Sequence where Element == (key: Key, value: Value) {
  associatedtype Key: Hashable
  associatedtype Value
}
