#!/bin/sh
# Install Pistachio — DRM3's Morpheus-compatible P2P inference client
# Works on: macOS (ARM/Intel), Linux (x86_64), Chromebook (via Linux/Crostini)
#
# Usage: curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/products/pistachio/install.sh | sh

set -e

# Auto-detect latest version from GitHub, or override with PISTACHIO_VERSION env var
if [ -n "${PISTACHIO_VERSION:-}" ]; then
  VERSION="$PISTACHIO_VERSION"
else
  # Find latest pistachio-v* release (not provenance or other products)
  VERSION=$(curl -s https://api.github.com/repos/drm3labs/drm3-releases/releases 2>/dev/null \
    | grep '"tag_name"' | grep 'pistachio-v' | head -1 \
    | sed 's/.*"pistachio-v\([^"]*\)".*/\1/')
  if [ -z "$VERSION" ]; then
    echo "Could not detect latest version. Set PISTACHIO_VERSION manually."
    exit 1
  fi
fi
REPO="https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v${VERSION}"
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

  # Linux ARM64 supported since v0.1.3

  BINARY="pistachio-${OS}-${ARCH}"
}

main() {
  detect_platform

  echo "Installing Pistachio v${VERSION} (${OS}/${ARCH})..."

  TMPDIR=$(mktemp -d)
  trap 'rm -rf "$TMPDIR"' EXIT

  echo "Downloading ${BINARY}..."
  curl -fsSL "${REPO}/${BINARY}" -o "${TMPDIR}/pistachio"
  chmod +x "${TMPDIR}/pistachio"

  # Install (may need sudo on Linux)
  if [ -w "$INSTALL_DIR" ]; then
    mv "${TMPDIR}/pistachio" "${INSTALL_DIR}/pistachio"
  else
    echo "Installing to ${INSTALL_DIR} (requires sudo)..."
    sudo mv "${TMPDIR}/pistachio" "${INSTALL_DIR}/pistachio"
  fi

  echo ""
  echo "Pistachio installed to ${INSTALL_DIR}/pistachio"
  echo ""
  echo "Get started:"
  echo "  pistachio config set private-key  # Connect your wallet"
  echo "  pistachio serve                   # Dashboard at http://localhost:19377"
  echo ""
  echo "SDK key is auto-provisioned from your wallet — no manual setup needed."
  echo ""
}

main
