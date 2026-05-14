# Homebrew formula for Pistachio CLI
# Install: brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3's Morpheus-compatible P2P inference client (CLI only)"
  homepage "https://drm3.network"
  version "0.18.7"
  license "LicenseRef-Proprietary"

  # Mac users: prefer the cask (includes desktop app + CLI).
  # This formula is for Linux/headless or if you only want the bare CLI.
  conflicts_with cask: "pistachio"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64"
      sha256 "9e7c66780d95fec869d046e2299b02bfefae9257b4e371946417d8472e0644ce"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64"
      sha256 "a47296234da900ce82eaefc440fce1783fb9c99df218c22818cee12e9e704d61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64"
      sha256 "50258cf8a0c21b0ae636958d0cedfd54798522a253a10b3bb9faf1f5a451b2ae"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64"
      sha256 "5f076bb9dcd0a3c2988c43fb14c63c6b64594d381e1b38ca2eeb8ab71f5303fa"
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
