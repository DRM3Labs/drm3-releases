# Homebrew formula for Pistachio CLI
# Install: brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3's Morpheus-compatible P2P inference client"
  homepage "https://drm3.network"
  version "0.11.13"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64"
      sha256 "c1a0eb76ab3e7382e665fdfcc38eefbec565613a606cf591046cf04572449e7a"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64"
      sha256 "9aad9700ad7258fd6b7898c96291637555258e24c759cbbbaab7006e950b6ef9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64"
      sha256 "a0e615894b8404a9381b9092ea160f80fd630cd106e46aa27fae2fa9a4f55b8d"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64"
      sha256 "3df55735dce324d93ecd0f66e1a3dc32c3b8431224e072633eb199155c139d78"
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
