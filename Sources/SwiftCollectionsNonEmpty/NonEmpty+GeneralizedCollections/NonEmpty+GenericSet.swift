//
//  NonEmptyGenericSet.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 26/09/2025.
//

@_spi(NonEmptyExternallyExtendable) private import NonEmpty

extension NonEmpty: SetCollection where Base: SetCollection {
  public func contains(_ member: Base.Element) -> Bool {
    base.contains(member)
  }
}

extension NonEmpty: AdditiveSetAlgebraWithAllSequences
  where Base: AdditiveSetAlgebraWithAllSequences {
  
  public func union(_ other: some Sequence<Element>) -> Self {
    Self(_unsafeAssumedNonEmpty: base.union(other))
  }
  
  public mutating func formUnion(_ other: some Sequence<Element>) {
    _baseReadModify.formUnion(other)
  }
  
  public func isSubset(of possibleSuperset: some Sequence<Element>) -> Bool {
    base.isSubset(of: possibleSuperset)
  }
  
  public func isStrictSubset(of possibleStrictSuperset: some Sequence<Element>) -> Bool {
    base.isStrictSubset(of: possibleStrictSuperset)
  }
  
  public func isDisjoint(with other: some Sequence<Element>) -> Bool {
    base.isDisjoint(with: other)
  }
  
  public func isSuperset(of possibleSubset: some Sequence<Element>) -> Bool {
    base.isSuperset(of: possibleSubset)
  }
  
  public func isStrictSuperset(of possibleStrictSubset: some Sequence<Element>) -> Bool {
    base.isStrictSuperset(of: possibleStrictSubset)
  }
}

extension NonEmpty: AdditiveSetAlgebraWithSelf
  where Base: AdditiveSetAlgebraWithSelf {
  
  public func union(_ other: Self) -> Self {
    Self(_unsafeAssumedNonEmpty: base.union(other.base))
  }
  
  public mutating func formUnion(_ other: Self) {
    _baseReadModify.formUnion(other.base)
  }
  
  public func isSubset(of other: Self) -> Bool {
    base.isSubset(of: other.base)
  }
  
  public func isStrictSubset(of other: Self) -> Bool {
    base.isStrictSubset(of: other.base)
  }
  
  public func isDisjoint(with other: Self) -> Bool {
    base.isDisjoint(with: other.base)
  }
  
  public func isSuperset(of other: Self) -> Bool {
    base.isSuperset(of: other.base)
  }
  
  public func isStrictSuperset(of other: Self) -> Bool {
    base.isStrictSuperset(of: other.base)
  }
}

extension NonEmpty: SubtractiveResultSetAgebra
  where Base: SubtractiveResultSetAgebra,
  Base.CanBeEmptySetType == Base {
  
  public typealias CanBeEmptySetType = Base
  
  public func intersection(_ other: Self) -> Base {
    base.intersection(other.base)
  }
  
  public func intersection(_ other: some Sequence<Element>) -> Base {
    base.intersection(other)
  }
  
  public func symmetricDifference(_ other: Self) -> Base {
    base.symmetricDifference(other.base)
  }
  
  public func symmetricDifference(_ other: some Sequence<Element>) -> Base {
    base.symmetricDifference(other)
  }
  
  public func subtracting(_ other: Self) -> Base {
    base.subtracting(other.base)
  }
  
  public func subtracting(_ other: some Sequence<Element>) -> Base {
    base.subtracting(other)
  }
}

extension NonEmpty: UnorderedInsertAdditiveMutableSetAlgebra
  where Base: UnorderedInsertAdditiveMutableSetAlgebra,
  Base.CanBeEmptySetType == Base {
  
  public mutating func insert(_ newMember: Element) -> (inserted: Bool, memberAfterInsert: Element) {
    _baseReadModify.insert(newMember)
  }
  
  public mutating func update(with newMember: Element) -> Element? {
    _baseReadModify.update(with: newMember)
  }
}
