// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "cli_wallet",
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "cli_wallet"),
    ]
)
import Foundation

// MARK: - Run shell command
@discardableResult
func run(_ cmd: String) -> String {
    let task = Process()
    task.executableURL = URL(fileURLWithPath: "/bin/bash")
    task.arguments = ["-c", cmd]

    let pipe = Pipe()
    task.standardOutput = pipe
    task.standardError = pipe

    do {
        try task.run()
    } catch {
        return "❌ Failed to run command: \(error)"
    }

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    return String(data: data, encoding: .utf8) ?? "❌ Output unreadable"
}

// MARK: - Config
let rpcURL = "https://rpc.zora.energy"

// MARK: - Menu
func printMenu() {
    print(
        """
        ♾️ Eternum CLI Wallet
        ----------------------
        1. Generate Wallet
        2. Check Balance
        3. Exit
        """
    )
}

func generateWallet() {
    print("🔐 Generating wallet...\n")
    let result = run("cast wallet new")
    print(result)
}

func checkBalance() {
    print("💳 Enter wallet address:")
    guard let addr = readLine(), addr.starts(with: "0x") else {
        print("⚠️ Invalid address format.")
        return
    }

    let balanceCmd = "cast balance \(addr) --rpc-url \(rpcURL)"
    let result = run(balanceCmd)
    print("🧾 Balance: \(result)")
}

// MARK: - Entry Point
while true {
    printMenu()
    guard let choice = readLine() else { continue }

    switch choice {
    case "1":
        generateWallet()
    case "2":
        checkBalance()
    case "3":
        print("👋 Exiting. Until the next deploy...")
        exit(0)
    default:
        print("❓ Unknown choice: \(choice)")
    }

    print("\n─────────────────────────────\n")
}
