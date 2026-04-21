# Homebrew formula for Pistachio CLI
# Install: brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3's Morpheus-compatible P2P inference client"
  homepage "https://drm3.network"
  version "0.11.12"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64"
      sha256 "062af902ab2f67abac3577d310e66224edcba566aa56c11653bd547cd9f36514"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64"
      sha256 "4a8f2825a9f89dc7bed9061972665b4bb4ebbd8d3af788bdc87e2399bcd3ed83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64"
      sha256 "06515bdc2c39c052c3a0eaf5bcf8f47a8f818ca480f5b894f00152df2189f6b2"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64"
      sha256 "4551e7f6406c9ee7f919be0c7ed1c48ff3a0a53155bb0d57e36c7db58b850c99"
    end
  end

  def install
    binary_name = "pistachio-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    bin.install binary_name => "pistachio"
  end

  def post_install
    ohai "Pistachio installed! Get started:"
    ohai "  pistachio config set private-key  # Connect your wallet"
    ohai "  pistachio serve                   # Dashboard at localhost:19377"
    ohai ""
    ohai "SDK key is auto-provisioned from your wallet — no manual setup needed."
  end

  test do
    assert_match "Pistachio", shell_output("#{bin}/pistachio --version")
  end
end
