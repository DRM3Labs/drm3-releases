# DRM3 Homebrew Tap

Homebrew formulae and binary releases for DRM3 tools.

## Install

```bash
brew tap drm3labs/drm3-homebrew-tap
brew install mor
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `mor` | Local AI gateway for Morpheus decentralized inference |

## Usage

```bash
# Configure
mor config set private-key    # Connect your wallet
mor config set api-key        # Unlock inference (drm3.network/login)

# Run
mor serve                     # Dashboard at http://localhost:19377

# Chat
mor chat "Hello" --model llama-3.3-70b
```

## Releases

Binary releases for all platforms are published to this repo's [Releases](https://github.com/drm3labs/drm3-homebrew-tap/releases) page.

| Platform | Binary |
|----------|--------|
| macOS Apple Silicon (M1+) | `mor-darwin-arm64` |
| macOS Intel | `mor-darwin-amd64` |
| Linux x86_64 | `mor-linux-amd64` |
| Linux ARM64 | `mor-linux-arm64` |
