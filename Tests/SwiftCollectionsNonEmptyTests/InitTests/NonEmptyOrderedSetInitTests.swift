//
//  NonEmptyOrderedSetInitTests.swift
//  swiftCollections-nonEmpty
//
//  Created Dmitriy Ignatyev on 23/09/2025.
//

import Testing
@testable import SwiftCollectionsNonEmpty

struct NonEmptyOrderedSetInitTests {
  @Test func `compatibleSetCollection based init`() throws {
    // TODO: also pass generic arg T in tests
    #expect(NonEmptyOrderedSet(elements: 1, 2).rawValue == [1, 2])
    #expect(NonEmptyOrderedSet(elements: 1).rawValue == [1])
    #expect(NonEmptyOrderedSet(element: 1).rawValue == [1])
  }
}
