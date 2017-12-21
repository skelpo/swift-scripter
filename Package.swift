// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Scripter",
    dependencies: [
        .package(url: "https://github.com/vapor/mysql.git", .upToNextMajor(from: "2.0.3")),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/IBM-Swift/Configuration.git", .upToNextMajor(from: "2.0.0"))
        ],
    targets: [
    .target(name: "Importer", dependencies: ["MySQL", "SwiftyJSON", "Configuration"], path: "Scripter"),
        ]
)

