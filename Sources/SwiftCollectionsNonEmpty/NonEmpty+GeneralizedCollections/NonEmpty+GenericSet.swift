//
//  NonEmptyGenericSet.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 26/09/2025.
//

@_spi(NonEmptyExternallyExtendable) private import NonEmpty

extension NonEmpty: SetCollection where Base: SetCollection {}

extension NonEmpty: CommonSetAlgebraWithAllSequencesUndestructiveNonEmptynessCollection
  where Base: CommonSetAlgebraWithAllSequencesUndestructiveNonEmptynessCollection {
  public func union(_ other: some Sequence<Element>) -> Self {
    Self(_unsafeAssumedNonEmpty: base.union(other))
  }
  
  public mutating func formUnion(_ other: some Sequence<Self.Element>) {
    _baseReadModify.formUnion(other)
  }
  
  public func isSubset(of possibleSuperset: some Sequence<Self.Element>) -> Bool {
    base.isSubset(of: possibleSuperset)
  }
  
  public func isStrictSubset(of possibleStrictSuperset: some Sequence<Self.Element>) -> Bool {
    base.isStrictSubset(of: possibleStrictSuperset)
  }
  
  public func isDisjoint(with other: some Sequence<Self.Element>) -> Bool {
    base.isDisjoint(with: other)
  }
  
  public func isSuperset(of possibleSubset: some Sequence<Self.Element>) -> Bool {
    base.isSuperset(of: possibleSubset)
  }
  
  public func isStrictSuperset(of possibleStrictSubset: some Sequence<Self.Element>) -> Bool {
    base.isStrictSuperset(of: possibleStrictSubset)
  }
}

//extension NonEmpty: CommonSetAlgebraUndestructiveNonEmptynessCollection
//where Base: CommonSetAlgebraUndestructiveNonEmptynessCollection {
//  public func contains(_ member: Base.Element) -> Bool {
//    
//  }
//  
//  // TODO: make generic instead of NonEmpty.NonEmpty<Base>
//  
//  public func union(_ other: NonEmpty.NonEmpty<Base>) -> Self {
//    
//  }
//  
//  public mutating func formUnion(_ other: NonEmpty.NonEmpty<Base>) {
//    
//  }
//  
//  public func isSubset(of other: NonEmpty.NonEmpty<Base>) -> Bool {
//    
//  }
//  
//  public func isStrictSubset(of other: NonEmpty.NonEmpty<Base>) -> Bool {
//    
//  }
//  
//  public func isDisjoint(with other: NonEmpty.NonEmpty<Base>) -> Bool {
//    
//  }
//  
//  public func isSuperset(of other: NonEmpty.NonEmpty<Base>) -> Bool {
//    
//  }
//  
//  public func isStrictSuperset(of other: NonEmpty.NonEmpty<Base>) -> Bool {
//    
//  }
//}
