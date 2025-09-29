//
//  RangeSet+SetAlgebra.swift
//  swiftCollections-nonEmpty
//
//  Created by Dmitriy Ignatyev on 29/09/2025.
//

@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
extension RangeSet: SetCollection where Bound: Hashable {}

@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
extension RangeSet: AdditiveSetAlgebraWithSelf where Bound: Hashable {
  public func isDisjoint(with other: RangeSet<Bound>) -> Bool {
    self.isDisjoint(other)
  }
}

@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
extension RangeSet where Bound: Hashable & Comparable & Strideable, Bound.Stride: BinaryInteger { // : AdditiveSetAlgebraWithAllSequences
//  public func union(_ other: some Sequence<Element>) -> RangeSet<Bound> {
//    
//  }
//  
//  public mutating func formUnion(_ other: some Sequence<Element>) {
//    
//  }
//  
//  public func isSubset(of possibleSuperset: some Sequence<Element>) -> Bool {
//    
//  }
//  
//  public func isStrictSubset(of possibleStrictSuperset: some Sequence<Element>) -> Bool {
//    
//  }
//  
//  public func isDisjoint(with other: some Sequence<Element>) -> Bool {
//    
//  }
//  
//  public func isSuperset(of possibleSubset: some Sequence<Element>) -> Bool {
//    
//  }
//  
//  public func isStrictSuperset(of possibleStrictSubset: some Sequence<Element>) -> Bool {
//    
//  }
  
  private func makeRangesFromSequence(_ sequence: some Sequence<Element>) -> [Range<Bound>] {
    let sorted = sequence.sorted()
    guard var lower = sorted.first else { return [] }
    var upper = lower
    
    var ranges: [Range<Bound>] = []
    for current in sorted.dropFirst() {
      if lower.distance(to: current) > 1 {
        let range = lower..<(upper.advanced(by: 1))
        ranges.append(range)
        lower = current
        upper = current
      } else {
        upper = current
      }
    }
  }
}



@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
extension RangeSet<Int> {
  mutating func add(index: Bound) {
    self.insert(contentsOf: 1..<1)
    intersection(self)
    symmetricDifference(self)
    subtracting(self)
    contains(index)
    
  }
}
