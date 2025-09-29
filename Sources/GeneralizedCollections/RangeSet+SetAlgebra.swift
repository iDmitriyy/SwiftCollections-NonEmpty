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
  /// !!! Perfomance
  public func union(_ other: some Sequence<Element>) -> RangeSet<Bound> {
    var result = self
    for range in Self.makeDisjointRangesFromSequence(other) {
      result.formUnion(Self.init(range))
    }
    return result
  }
  
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
  
  private static func makeDisjointRangesFromSequence(_ sequence: some Sequence<Element>) -> [Range<Bound>] {
    let sorted = sequence.sorted()
    guard var lower = sorted.first else { return [] }
    var upper = lower
    
    var ranges: [Range<Bound>] = []
    for current in sorted.dropFirst() {
      if upper.distance(to: current) > 1 {
        ranges.append(lower..<(upper.advanced(by: 1)))
        lower = current
        upper = current
      } else {
        upper = current
      }
    }
    
    ranges.append(lower..<(upper.advanced(by: 1)))
    
    return ranges
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
