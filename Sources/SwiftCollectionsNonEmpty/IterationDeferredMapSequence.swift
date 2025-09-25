//
//  IterationDeferredMapSequence.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 25/09/2025.
//

/// map elements while iteration. Needed to eliminate memory allocations.
@usableFromInline
internal struct IterationDeferredMapSequence<T, U>: Sequence {
  private var itarator: AnyIterator<T>
  private let transform: (T) -> U
  
  internal init(sequence: some Sequence<T>, transform: @escaping (T) -> U) {
    itarator = AnyIterator(sequence.makeIterator())
    self.transform = transform
  }
  
  @usableFromInline
  func makeIterator() -> some IteratorProtocol<U> {
    AnyIterator<U> {
      if let value = itarator.next() {
        transform(value)
      } else {
        nil
      }
    }
  }
}
