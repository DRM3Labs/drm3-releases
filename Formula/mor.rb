# Homebrew formula for MOR CLI
# Install: brew tap drm3labs/drm3 && brew install mor

class Mor < Formula
  desc "Local AI gateway for Morpheus decentralized inference"
  homepage "https://drm3.network"
  version "0.2.0"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-arm64"
      sha256 "da2a6ed9b851aac7e4241d74289d1516a4b943422136eb58ccf7de314ff8cbe1"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-amd64"
      sha256 "904c6aaf81e51e575f4c0fbc17f2c6ca656d862bb60e10ae4fc2229421073cef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-arm64"
      sha256 "db2ef808d0a51232aca402da2b354537d607dc8dcc86ebb45452fce6120a15e3"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-amd64"
      sha256 "45ad885ad975bc6d38fbcdc2faa0840d76857583f2bdb204d7fc52118021dbd9"
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
