# Homebrew formula for MOR CLI
# Install: brew tap drm3labs/drm3 && brew install mor

class Mor < Formula
  desc "Local AI gateway for Morpheus decentralized inference"
  homepage "https://drm3.network"
  version "0.1.6"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-arm64"
      sha256 "ddb63f5cf212b8b789c870c084e6661b24fd0e1cb48069d3761f4fae04cb5dbe"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-amd64"
      sha256 "6744af6cdf0fb97b223952b535aadebf45df92239eb7a0ca220a5e6f98c26759"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-amd64"
      sha256 "cad859e101da3c7b0dab1ea0f2ed4ed78db68fcc16d752c41eae5738369b1fff"
    end
  end

  def install
    binary_name = "mor-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    bin.install binary_name => "mor"
  end

  def post_install
    ohai "MOR installed! Get started:"
    ohai "  mor config set private-key  # Connect your wallet"
    ohai "  mor serve                   # Dashboard at localhost:19377"
    ohai ""
    ohai "SDK key is auto-provisioned from your wallet — no manual setup needed."
  end

  test do
    assert_match "MOR", shell_output("#{bin}/mor --version")
  end
end
