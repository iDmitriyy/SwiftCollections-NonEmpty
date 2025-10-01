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
extension RangeSet: SubtractiveResultSetAgebraWithSelf where Bound: Hashable {}

@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
extension RangeSet: SelfSubtractiveSetAlgebraWithSelf where Bound: Hashable {}


//@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
//extension RangeSet where Bound: Hashable & Comparable & Strideable, Bound.Stride: SignedInteger { // : AdditiveSetAlgebraWithAllSequences
//  /// !!! Perfomance
//  public func union(_ other: some Sequence<Element>) -> RangeSet<Bound> {
//    var result = self
//    for range in Self._makeOrderedDisjointRangesFromSequence(other) {
//      result.formUnion(Self.init(range))
//    }
//    return result
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
//    // self._customContainsEquatableElement(self.ranges.first!.first!)
//  }
//  
//  public func isDisjoint(with other: some Sequence<Element>) -> Bool {
//    guard !self.isEmpty else { return true }
//    for element in other {
//      if self.contains(element) {
//        return false
//      }
//    }
//    return true
//  }
//  
//  public func isSuperset(of possibleSubset: some Sequence<Element>) -> Bool {
//    for subsetElement in possibleSubset {
//      guard self.contains(subsetElement) else { return false }
//    }
//    return true
//  }
//  
//  public func isStrictSuperset(of possibleStrictSubset: some Sequence<Element>) -> Bool {
//    var subsetCount: Int = 0
//    for subsetElement in possibleStrictSubset {
//      guard self.contains(subsetElement) else { return false }
//      subsetCount += 1
//    }
//    let selfCount = _selfCount()
//    return selfCount > subsetCount
//  }
//  
//  private func _makeIterator() -> some IteratorProtocol<Bound> {
//    var rangesIterator = ranges.makeIterator()
//    guard var firstRange = rangesIterator.next() else { return AnyIterator { nil } }
//    var elementsIterator = firstRange.makeIterator()
//    
//    return AnyIterator {
//      if let element = elementsIterator.next() {
//        return element
//      } else if let nextRange = rangesIterator.next() {
//        var eIterator = nextRange.makeIterator()
//        var firstElementInRange = eIterator.next()
//        elementsIterator = eIterator
//        return firstElementInRange
//      } else {
//        return nil
//      }
//    }
//  }
//  
//  // _customContainsEquatableElement
//  
//  private func _selfCount() -> Int {
//    ranges.reduce(into: Int(0)) { count, range in
//      // let rangeCount = range.lowerBound.distance(to: range.upperBound)
//      // range.count – Bound.Stride: SignedInteger
//      count += range.count // Int(rangeCount)
//    }
//  }
//  
//  private static func _makeOrderedDisjointRangesFromSequence(_ sequence: some Sequence<Element>) -> [Range<Bound>] {
//    let sorted = sequence.sorted()
//    guard var lower = sorted.first else { return [] }
//    var upper = lower
//    
//    var ranges: [Range<Bound>] = []
//    for current in sorted.dropFirst() {
//      if upper.distance(to: current) > 1 {
//        ranges.append(lower..<(upper.advanced(by: 1)))
//        lower = current
//        upper = current
//      } else {
//        upper = current
//      }
//    }
//    
//    ranges.append(lower..<(upper.advanced(by: 1)))
//    
//    return ranges
//  }
//}
//
//@available(macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
//extension RangeSet<Int> {
//  mutating func add(index: Bound) {
//    self.insert(contentsOf: 1..<1)
//    intersection(self)
//    symmetricDifference(self)
//    subtracting(self)
//    contains(index)
//  }
//}
