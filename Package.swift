// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "misc",
  products: [
    .library(name: "Misc", targets: ["Misc"]),
    .library(name: "WildmatchC", targets: ["WildmatchC"]),
    .library(name: "FzyC", targets: ["FzyC"]),
  ],
  dependencies: [
    .package(url: "https://github.com/Quick/Nimble", .upToNextMajor(from: "13.7.1")),
  ],
  targets: [
    .target(name: "Misc", dependencies: ["WildmatchC", "FzyC"]),
    .target(name: "WildmatchC", dependencies: []),
    .target(name: "FzyC", dependencies: []),

    .testTarget(name: "MiscTests", dependencies: ["Misc", "Nimble"]),
  ]
)
