#!/bin/sh
# DRM3 Product Installer
# Routes to the correct product installer based on argument or default.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh | sh
#   curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh | sh -s pistachio
#
# Each product has its own installer at: products/<name>/install.sh

set -e

PRODUCT="${1:-}"
BASE="https://raw.githubusercontent.com/drm3labs/drm3-releases/main/products"

if [ -z "$PRODUCT" ]; then
  echo "DRM3 Product Installer"
  echo ""
  echo "Usage: curl -fsSL https://drm3.network/install.sh | sh -s <product>"
  echo ""
  echo "Available products:"
  echo "  pistachio    — P2P inference client for Morpheus"
  echo "  signalforge  — Content intelligence platform"
  echo ""
  echo "Or install directly:"
  echo "  curl -fsSL ${BASE}/pistachio/install.sh | sh"
  echo "  curl -fsSL ${BASE}/signalforge/install.sh | sh"
  exit 1
fi

case "$PRODUCT" in
  pistachio)
    exec curl -fsSL "${BASE}/pistachio/install.sh" | sh
    ;;
  signalforge)
    exec curl -fsSL "${BASE}/signalforge/install.sh" | sh
    ;;
  *)
    echo "Unknown product: $PRODUCT"
    echo ""
    echo "Available products: pistachio, signalforge"
    echo ""
    echo "Usage: curl -fsSL https://drm3.network/install.sh | sh -s <product>"
    exit 1
    ;;
esac
