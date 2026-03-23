# Homebrew formula for Pistachio CLI
# Install: brew tap drm3labs/drm3 && brew install pistachio

class Pistachio < Formula
  desc "Pistachio — DRM3's Morpheus-compatible P2P inference client"
  homepage "https://drm3.network"
  version "0.3.3"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-arm64"
      sha256 "6ea7b0ac5098a7e1acf206218bf6dbaac136cb51771744feec4be8a6994c80f0"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-darwin-amd64"
      sha256 "e353ec0e2410520dfc3d2384bbd87857424b3bc048009144eeddfaf42e6c762d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-arm64"
      sha256 "db2ef808d0a51232aca402da2b354537d607dc8dcc86ebb45452fce6120a15e3"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-v#{version}/pistachio-linux-amd64"
      sha256 "d2cb77221dadacc76638e6e5449ddc4756ef001f19969b4943bd4d74ae1c58ea"
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
