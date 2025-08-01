# ♾️ Eternum Sigil Signing System

### 🔐 Purpose

This is the **Eternum Sigil Sealing System** — a cryptographic way to **seal any JSON-based message or signature** with an unbreakable SHA-256 hash. It ensures that a message’s contents have not been changed since it was signed. Think of it like an unforgeable digital wax seal for Eternum’s proofs, logs, or rituals.

---

### 💡 How it works (in plain terms)

1. **Start with a message** — a simple `sigil-plain.json` file that holds info like:
   - Who created it  
   - What it means  
   - When it was made  
   - A special symbolic message  

2. **Seal the sigil** using the `sigil_sign.sh` script:
   - It **removes any old hash**
   - **Sorts the keys alphabetically**
   - **Strips out any extra spaces or formatting**
   - Creates a **clean and predictable string** of data
   - **Generates a SHA-256 hash**
   - Adds that hash back into the sigil file as proof of authenticity

3. **Verify** the hash later (in Swift, Rust, Python, etc.) by repeating those exact same steps. If even one character changed in the sigil, the hash will no longer match.

---

### 🧠 Why this matters

- Most people think JSON is "just text", but in computers:
  - `"a":1, "b":2` is *not* the same as `"b":2, "a":1`
- That's why we sort keys and compact the output — so the hash stays the same every time.
- This makes the Eternum project’s logs, messages, rituals, and contracts **tamper-proof**, cryptographically sealed, and readable by any smart system.

---

### ✅ Example

Input file: `eternum/sigil-plain.json`

```json
{
  "project": "Eternum CLI Wallet",
  "author": "Quantum-Cipher",
  "sigil": "♾️",
  "signed": "2025-08-01T04:46:03Z",
  "origin": "macOS / Xcode",
  "message": "Only code what the system already knows."
}
