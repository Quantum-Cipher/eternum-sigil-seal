// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "CLIWallet",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "CLIWallet",
            targets: ["CLIWallet"]
        )
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "CLIWallet",
            dependencies: []
        )
    ]
)
