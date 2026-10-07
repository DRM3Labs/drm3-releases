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
  echo "  pistachio    - P2P inference client for Morpheus"
  echo ""
  echo "Or install directly:"
  echo "  curl -fsSL ${BASE}/pistachio/install.sh | sh"
  exit 1
fi

# Fetch the product installer to a file first so a failed download stops here
# instead of piping an empty body into sh.
run_installer() {
  SCRIPT=$(mktemp)
  trap 'rm -f "$SCRIPT"' EXIT
  if ! curl -fsSL "${BASE}/$1/install.sh" -o "$SCRIPT" || [ ! -s "$SCRIPT" ]; then
    echo "Could not download the $1 installer from ${BASE}/$1/install.sh. Install stopped."
    exit 1
  fi
  sh "$SCRIPT"
}

case "$PRODUCT" in
  pistachio)
    run_installer pistachio
    ;;
  *)
    echo "Unknown product: $PRODUCT"
    echo ""
    echo "Available products: pistachio"
    echo ""
    echo "Usage: curl -fsSL https://drm3.network/install.sh | sh -s <product>"
    exit 1
    ;;
esac
