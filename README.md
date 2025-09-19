# SigilVault 🧿 - Eternum’s Terminal of Truth

A local-first, Swift-based CLI wallet and sigil sealing engine for Web3.

---

## The Problem: The Crisis of Trust in Wallets

The current Web3 wallet experience creates anxiety. Onboarding is intimidating, transactions are opaque, and security is often a browser-based afterthought. We are asking users to become sovereign, but giving them tools that inspire doubt.

## The Solution: SigilVault 🔐

SigilVault is a command-line interface (CLI) that solves these problems by returning power, clarity, and truth to the user. It is built for sovereignty.

* **✅ Local-First Security:** Creates and manages Ethereum-compatible wallets entirely on your machine. No web exposure. No Metamask. Your keys remain verifiably yours.

* **🧿 Intentional Signing:** Canonically signs human-readable JSON data ("sigils") with your private key. You sign clear intentions, not confusing hexadecimal strings.

* **📁 Immutable Proofs:** Seals your signed sigils into immutable cryptographic proofs using Apple's robust CryptoKit framework, creating a verifiable audit trail.

* **♾️ Verifiable Truth:** All operations are transparently verified through command-line hash checks and human-readable "spellbook" logs.

## The Vision: Beyond a Wallet

SigilVault is a core component of **Eternum**, a regenerative intelligence protocol. It is the tool that allows users to interact with the ecosystem with absolute confidence, ensuring every action is intentional, sovereign, and true.

# Eternum Sigil Seal

**A simple command-line tool for creating and verifying digital signatures on files using Ethereum cryptographic keys.**

This project allows you to use your Ethereum private key to generate a unique, verifiable digital signature for any file, proving its authenticity and integrity.

---

## How It Works

The tool generates a SHA-256 hash of the target file and then uses the `ethers.js` library to sign that hash with a provided Ethereum private key. The resulting signature can be verified by anyone who has the signature, the original file, and the corresponding public Ethereum address.

## Installation

1.  Clone the repository:
    ```bash
    git clone [https://github.com/Quantum-Cipher/eternum-sigil-seal.git](https://github.com/Quantum-Cipher/eternum-sigil-seal.git)
    ```
2.  Navigate into the project directory:
    ```bash
    cd eternum-sigil-seal
    ```
3.  Install the necessary dependencies:
    ```bash
    npm install
    ```

## Configuration

Before you can use the tool, you must create a `.env` file to store your private key.

1.  Make a copy of the example file:
    ```bash
    cp .env.example .env
    ```
2.  Open the new `.env` file in a text editor and replace `YOUR_PRIVATE_KEY_HERE` with your actual Ethereum private key.

    **NOTE:** This file is included in `.gitignore` and will never be committed to the repository.

## Usage

### To Sign a File

Run the `seal.js` script with the path to the file you want to sign:

```bash
node src/seal.js ./path/to/your/file.txt

## Next Steps

* [Explore the Main Eternum White Paper](https://github.com/Quantum-Cipher/Eternum-Public-Whitepaper)
* [Visit the Eternum Website](https://eternum369.com)

