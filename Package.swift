// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swiftCollections-nonEmpty",
  products: [
    .library(name: "SwiftCollectionsNonEmpty", targets: ["SwiftCollectionsNonEmpty"]),
    .library(name: "GeneralizedCollections", targets: ["GeneralizedCollections"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-collections.git", .upToNextMajor(from: "1.2.1")),
    .package(url: "https://github.com/iDmitriyy/swift-nonempty.git", branch: "SwiftCollectionsAdditions"), // "0.5.0"
  ],
  targets: [
    .target(name: "GeneralizedCollections", dependencies: [
      .product(name: "Collections", package: "swift-collections"),
    ]),
    .target(name: "SwiftCollectionsNonEmpty", dependencies: [
      .target(name: "GeneralizedCollections"),
      .product(name: "Collections", package: "swift-collections"),
      .product(name: "_RopeModule", package: "swift-collections"),
      .product(name: "NonEmpty", package: "swift-nonempty"),
    ]),
    .testTarget(name: "SwiftCollectionsNonEmptyTests", dependencies: [
      .target(name: "SwiftCollectionsNonEmpty"),
      .product(name: "Collections", package: "swift-collections"),
      .product(name: "_RopeModule", package: "swift-collections"),
      .product(name: "NonEmpty", package: "swift-nonempty"),
    ]),
  ],
  swiftLanguageModes: [.v6],
)

for target: PackageDescription.Target in package.targets {
  {
    var settings: [PackageDescription.SwiftSetting] = $0 ?? []
    settings.append(.enableUpcomingFeature("ExistentialAny"))
    settings.append(.enableUpcomingFeature("InternalImportsByDefault"))
    settings.append(.enableUpcomingFeature("MemberImportVisibility"))
    settings.append(.enableExperimentalFeature("SuppressedAssociatedTypes"))
    settings.append(.enableExperimentalFeature("MoveOnlyTuples"))
    $0 = settings
  }(&target.swiftSettings)
}
