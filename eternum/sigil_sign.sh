#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
# Treat unset variables as an error.
set -euo pipefail

# --- Configuration ---
# Get the directory where the script is located. This makes it runnable from anywhere.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define file paths relative to the script's directory.
PLAIN_SIGIL_PATH="$SCRIPT_DIR/eternum/sigil-plain.json"
SEALED_SIGIL_PATH="$SCRIPT_DIR/eternum/sigil.sealed.json"

# --- Pre-flight Checks ---
echo "🔎 Verifying input file exists at: $PLAIN_SIGIL_PATH"
if [ ! -f "$PLAIN_SIGIL_PATH" ]; then
  echo "❌ Error: Missing plain sigil file."
  echo "   Please ensure the file exists at: $PLAIN_SIGIL_PATH"
  exit 1
fi

# --- Main Logic ---
echo "⚙️  Canonicalizing JSON..."
CANONICAL_JSON_TO_HASH=$(jq -Sc 'del(.hash?)' "$PLAIN_SIGIL_PATH")

echo "🔐 Computing SHA-256 hash..."
HASH=$(printf "%s" "$CANONICAL_JSON_TO_HASH" | shasum -a 256 | awk '{print $1}')
HASH_WITH_PREFIX="sha256:$HASH"

echo "🖋️  Injecting hash and creating sealed file..."
jq -S --arg hash "$HASH_WITH_PREFIX" 'del(.hash?) | . + {hash: $hash}' "$PLAIN_SIGIL_PATH" > "$SEALED_SIGIL_PATH"

# --- Completion ---
echo ""
echo "✅ Success! Sigil sealed."
echo "   - Output: $SEALED_SIGIL_PATH"
echo "   - Hash:   $HASH_WITH_PREFIX"


