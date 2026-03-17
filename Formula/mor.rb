# Homebrew formula for MOR CLI
# Install: brew tap drm3labs/drm3-homebrew-tap && brew install mor

class Mor < Formula
  desc "Local AI gateway for Morpheus decentralized inference"
  homepage "https://drm3.network"
  version "0.1.0"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-homebrew-tap/releases/download/mor-v#{version}/mor-darwin-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-homebrew-tap/releases/download/mor-v#{version}/mor-darwin-amd64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-homebrew-tap/releases/download/mor-v#{version}/mor-linux-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-homebrew-tap/releases/download/mor-v#{version}/mor-linux-amd64"
      sha256 "PLACEHOLDER"
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
