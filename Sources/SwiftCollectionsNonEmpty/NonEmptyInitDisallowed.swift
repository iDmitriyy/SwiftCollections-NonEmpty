//
//  NonEmptyInitDisallowed.swift
//  swiftCollections-nonEmpty
//
//  Created by tmp on 22/09/2025.
//

// MARK: - RawValue Init Disallowed

/// Disallows `init?(rawValue: EmptyCollection<Int>)` initializer of `NonEmpty`
public protocol NonEmptyInitWithRawValueDisallowed: Collection {}

extension NonEmpty where Collection: NonEmptyInitWithRawValueDisallowed {
  @available(*, deprecated, message: "Can not be NonEmpty. This init call will cause crash")
  public init?(rawValue: EmptyCollection<Element>) {
    nil
  }
}

// MARK: - Head-Tail Init Disallowed

/// Disallows `init(_ head: Element, _ tail: Element...)` initializer of `NonEmpty`
public protocol NonEmptyHeadTailInitDisallowed: Collection {}

extension NonEmpty where Collection: NonEmptyHeadTailInitDisallowed {
  @available(*, unavailable, message: "Can not be NonEmpty. This init call will cause crash")
  public init(_ head: Element, _ tail: Element...) {
    fatalError("Can not be NonEmpty")
  }
}
