# Homebrew formula for MOR CLI
# Install: brew tap drm3labs/drm3-releases && brew install mor

class Mor < Formula
  desc "Local AI gateway for Morpheus decentralized inference"
  homepage "https://drm3.network"
  version "0.1.0"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-arm64"
      sha256 "c7ddad3532356b7bb79396e0015086046e9cf0dc639dbba7c8184a39d040eb77"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-amd64"
      sha256 "fcab66dd4a776cb392c80fc337c82df8a5509806532c665a77267d1fdadb12da"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-amd64"
      sha256 "1ea467ee17029e016fe9ee15a5b9a560b545ffa209e5d5e6257e00f2ea7e290c"
    end
  end

  def install
    binary_name = "mor-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    bin.install binary_name => "mor"
  end

  def post_install
    ohai "MOR installed! Get started:"
    ohai "  mor config set private-key  # Connect your wallet"
    ohai "  mor config set api-key      # Unlock inference (get key at drm3.network/login)"
    ohai "  mor serve                   # Start the dashboard at http://localhost:19377"
  end

  test do
    assert_match "MOR", shell_output("#{bin}/mor --version")
  end
end
