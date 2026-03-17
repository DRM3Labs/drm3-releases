# DRM3 Homebrew Tap

Homebrew formulae for DRM3 tools.

## Install

```bash
brew tap robertjchristian/drm3-homebrew-tap
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
