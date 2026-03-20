#!/bin/sh
# Install MOR — Morpheus Staked Inference CLI
# Works on: macOS (ARM/Intel), Linux (x86_64), Chromebook (via Linux/Crostini)
#
# Usage: curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh | sh

set -e

# Auto-detect latest version from GitHub, or override with MOR_VERSION env var
if [ -n "$MOR_VERSION" ]; then
  VERSION="$MOR_VERSION"
else
  VERSION=$(curl -sI https://github.com/drm3labs/drm3-releases/releases/latest 2>/dev/null | grep -i '^location:' | grep -oE '[^/]+$' | tr -d '\r' | sed 's/^mor-v//')
  if [ -z "$VERSION" ]; then
    echo "Could not detect latest version. Set MOR_VERSION manually."
    exit 1
  fi
fi
REPO="https://github.com/drm3labs/drm3-releases/releases/download/mor-v${VERSION}"
INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"

detect_platform() {
  OS=$(uname -s | tr '[:upper:]' '[:lower:]')
  ARCH=$(uname -m)

  case "$OS" in
    darwin) OS="darwin" ;;
    linux)  OS="linux" ;;
    *)      echo "Unsupported OS: $OS"; exit 1 ;;
  esac

  case "$ARCH" in
    x86_64|amd64)   ARCH="amd64" ;;
    aarch64|arm64)   ARCH="arm64" ;;
    *)               echo "Unsupported architecture: $ARCH"; exit 1 ;;
  esac

  BINARY="mor-${OS}-${ARCH}"
}

main() {
  detect_platform

  echo "Installing MOR v${VERSION} (${OS}/${ARCH})..."

  TMPDIR=$(mktemp -d)
  trap 'rm -rf "$TMPDIR"' EXIT

  echo "Downloading ${BINARY}..."
  curl -fsSL "${REPO}/${BINARY}" -o "${TMPDIR}/mor"
  chmod +x "${TMPDIR}/mor"

  # Install (may need sudo on Linux)
  if [ -w "$INSTALL_DIR" ]; then
    mv "${TMPDIR}/mor" "${INSTALL_DIR}/mor"
  else
    echo "Installing to ${INSTALL_DIR} (requires sudo)..."
    sudo mv "${TMPDIR}/mor" "${INSTALL_DIR}/mor"
  fi

  echo ""
  echo "MOR installed to ${INSTALL_DIR}/mor"
  echo ""
  echo "Get started:"
  echo "  mor config set private-key  # Connect your wallet"
  echo "  mor serve                   # Dashboard at http://localhost:19377"
  echo ""
}

main
