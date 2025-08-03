import Foundation
import CryptoKit

let privateKeyData = Data((0..<32).map { _ in UInt8.random(in: 0...255) })
let hexPrivateKey = privateKeyData.map { String(format: "%02x", $0) }.joined()

let hash = SHA256.hash(data: privateKeyData)
let addressData = hash.suffix(20)
let address = "0x" + addressData.map { String(format: "%02x", $0) }.joined()

print("🔐 Eternum CLI Wallet Created")
print("🧬 Private Key: \(hexPrivateKey)")
print("🪪 Ethereum Address: \(address)")
