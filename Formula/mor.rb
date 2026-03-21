# Homebrew formula for MOR CLI
# Install: brew tap drm3labs/drm3 && brew install mor

class Mor < Formula
  desc "Local AI gateway for Morpheus decentralized inference"
  homepage "https://drm3.network"
  version "0.2.7"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-arm64"
      sha256 "2eb9ccf9167a9bc6683378a90115fca26a20a2a5d8888b8302d3f9cc9888cf38"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-darwin-amd64"
      sha256 "cb390433dbccf8e85a42f01951e5a705321126906cd9a04aca94aaf480bdfd3f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-arm64"
      sha256 "db2ef808d0a51232aca402da2b354537d607dc8dcc86ebb45452fce6120a15e3"
    end
    on_intel do
      url "https://github.com/drm3labs/drm3-releases/releases/download/mor-v#{version}/mor-linux-amd64"
      sha256 "36a8a5a1418305b5cc62f288be1d26b749ea20c741656086108d7daf73a150b5"
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
