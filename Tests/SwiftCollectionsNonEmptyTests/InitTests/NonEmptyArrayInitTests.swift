//
//  NonEmptyArrayInitTests.swift
//  swiftCollections-nonEmpty
//
//  Created by tmp on 22/09/2025.
//

import Testing
@testable import SwiftCollectionsNonEmpty

struct NonEmptyArrayInitTests {
  @Test func `rangeReplaceable based init`() throws {
    // TODO: pass generic arg T in tests
    #expect(NonEmptyArray(elements: 1, 2).rawValue == [1, 2])
    #expect(NonEmptyArray(elements: 1).rawValue == [1])
    #expect(NonEmptyArray(element: 1).rawValue == [1])
  }
}
