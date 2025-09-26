//
//  IterationDeferredMapSequence.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 25/09/2025.
//

/// map elements while iteration. Needed to eliminate memory allocations.
@usableFromInline
package struct IterationDeferredMapSequence<T, U>: Sequence {
  @usableFromInline internal private(set) var itarator: AnyIterator<T>
  @usableFromInline internal let transform: (T) -> U
  
  @inlinable
  package init(sequence: some Sequence<T>, transform: @escaping (T) -> U) {
    itarator = AnyIterator(sequence.makeIterator())
    self.transform = transform
  }
  
  @inlinable
  package func makeIterator() -> some IteratorProtocol<U> {
    AnyIterator<U> {
      if let value = itarator.next() {
        transform(value)
      } else {
        nil
      }
    }
  }
}
