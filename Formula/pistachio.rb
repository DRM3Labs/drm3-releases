# Homebrew formula for Pistachio CLI
# Install: brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3's Morpheus-compatible P2P inference client (CLI only)"
  homepage "https://drm3.network"
  version "0.18.8"
  license "LicenseRef-Proprietary"

  # Mac users: prefer the cask (includes desktop app + CLI).
  # This formula is for Linux/headless or if you only want the bare CLI.
  conflicts_with cask: "pistachio"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64"
      sha256 "2b0c0f4fee489a8175d67e1a4f2171247ababd96f9b48d6e345f4ee6e679dc72"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64"
      sha256 "446b9256f7f611e188bb027558099a89e931cd4c74f0bb1d9aa2d42fa543f5ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64"
      sha256 "58d47d3233d7d68e34a791f8ff28bde0a1fdef985a0108b8338905413a3ade6f"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64"
      sha256 "34524b33b9d43cbca4d849aae5939bcecc3733a9e9cafc609db0095722912b1a"
    end
  end

  def install
    binary_name = "pistachio-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    bin.install binary_name => "pistachio"
  end

  def post_install
    if OS.mac?
      opoo "On macOS, the desktop app is recommended instead:"
      ohai "  brew uninstall pistachio && brew install --cask pistachio"
      ohai ""
    end
    ohai "Pistachio installed! Get started:"
    ohai "  pistachio config set private-key  # Connect your wallet"
    ohai "  pistachio serve                   # Dashboard at localhost:19377"
  end

  test do
    assert_match "Pistachio", shell_output("#{bin}/pistachio --version")
  end
end
