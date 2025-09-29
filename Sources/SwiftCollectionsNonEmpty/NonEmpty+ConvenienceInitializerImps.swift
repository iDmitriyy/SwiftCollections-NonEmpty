//
//  NonEmpty+Init.swift
//  swiftCollections-nonEmpty
//
//  Created by Dmitriy Ignatyev on 22/09/2025.
//

@_spi(NonEmptyExternallyExtendable) private import NonEmpty

// MARK: - RangeReplaceable Types initializers for NonEmpty

extension NonEmpty where Base: RangeReplaceableCollection {
  public init(element: Element) {
    var coll = Base()
    coll.append(element)
    self.init(_unsafeAssumedNonEmpty: coll)
  }
  
  public init(elements first: Element, _ other: Element...) {
    var coll = Base()
    coll.append(first)
    coll.append(contentsOf: other)
    self.init(_unsafeAssumedNonEmpty: coll)
  }
}

// MARK: - Set Types initializers for NonEmpty

extension NonEmpty where Base: NonEmptyConvenienceInitOutOfBoxSet {
  public init(element: Element) {
    let backingInstance = Base(CollectionOfOne(element))
    self.init(_unsafeAssumedNonEmpty: backingInstance)
  }
  
  public init(elements first: Element, _ other: Element...) {
    var backingInstance = Base(CollectionOfOne(first))
    backingInstance.formUnion(other)
    self.init(_unsafeAssumedNonEmpty: backingInstance)
  }
}

extension NonEmpty where Base: InitializableWithSequenceSet {
  public init?(_ sequence: some Sequence<Element>) {
    let canBeEmptyBase = Base(sequence)
    self.init(base: canBeEmptyBase)
  }
}

// MARK: - Dictionary Types initializers for NonEmpty

extension NonEmpty where Base: DictionaryProtocol {
  public init(element: Element) {
    var backingInstance = Base()
    backingInstance.updateValue(element.value, forKey: element.key)
    self.init(_unsafeAssumedNonEmpty: backingInstance)
  }
  
  public init(elements first: Element, _ other: Element...) {
    var backingInstance = Base()
    backingInstance.updateValue(first.value, forKey: first.key)
    for (key, value) in other {
      backingInstance.updateValue(value, forKey: key)
    }
    self.init(_unsafeAssumedNonEmpty: backingInstance)
  }
}
