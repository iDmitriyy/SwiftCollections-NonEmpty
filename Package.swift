// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftCollections+NonEmpty",
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "SwiftCollections+NonEmpty",
      targets: ["SwiftCollections+NonEmpty"],
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-collections.git", .upToNextMajor(from: "1.2.1")),
    .package(url: "https://github.com/iDmitriyy/swift-nonempty.git", .upToNextMajor(from: "0.5.0")),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(name: "SwiftCollections+NonEmpty", dependencies: [
      .product(name: "Collections", package: "swift-collections"),
      .product(name: "NonEmpty", package: "swift-nonempty")
    ]),
    .testTarget(
      name: "SwiftCollections+NonEmptyTests",
      dependencies: ["SwiftCollections+NonEmpty"],
    ),
  ],
  swiftLanguageModes: [.v6]
)

for target: PackageDescription.Target in package.targets {
  {
    var settings: [PackageDescription.SwiftSetting] = $0 ?? []
    settings.append(.enableUpcomingFeature("ExistentialAny"))
    settings.append(.enableUpcomingFeature("InternalImportsByDefault"))
    settings.append(.enableUpcomingFeature("MemberImportVisibility"))
    $0 = settings
  }(&target.swiftSettings)
}
