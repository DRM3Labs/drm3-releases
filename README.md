# DRM3 Releases

Official binaries, installers, and Homebrew formulae for the DRM3 ecosystem.

## Packages

| Package | Status | What |
|---------|--------|------|
| **[mor](#mor-local-ai-inference)** | **v0.1.0** | Local AI gateway for Morpheus staked inference |
| venice | roadmap | Venice AI SDK (chat, images, TTS, video) |
| inference-bus | roadmap | Multi-provider AI router |

---

## MOR: Local AI Inference

The first DRM3-distributed binary. Rust-native gateway to decentralized AI. Connects your wallet to providers on the Morpheus network. One binary, all platforms.

```bash
brew tap drm3labs/drm3 && brew install mor
```

or

```bash
curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh | sh
```

Then get your API key at **[drm3.network](https://drm3.network)** to unlock inference.

### Install

| Platform | Command |
|----------|---------|
| Mac (Homebrew) | `brew tap drm3labs/drm3 && brew install mor` |
| Mac (Desktop) | [Download .dmg](https://github.com/drm3labs/drm3-releases/releases/tag/mor-v0.1.0) |
| Linux / Ubuntu | `curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh \| sh` |
| Chromebook | Enable Linux, open Terminal, curl command above |

### Direct Downloads (v0.1.0)

| Platform | Binary |
|----------|--------|
| Mac Apple Silicon | [mor-darwin-arm64](https://github.com/drm3labs/drm3-releases/releases/download/mor-v0.1.0/mor-darwin-arm64) |
| Mac Intel | [mor-darwin-amd64](https://github.com/drm3labs/drm3-releases/releases/download/mor-v0.1.0/mor-darwin-amd64) |
| Linux x86_64 | [mor-linux-amd64](https://github.com/drm3labs/drm3-releases/releases/download/mor-v0.1.0/mor-linux-amd64) |

### Get Started

```bash
mor config set private-key   # Connect wallet
mor config set api-key       # Get key at drm3.network
mor serve                    # Dashboard at localhost:19377
```

Requires MOR tokens + ETH for gas on Base.

---

## Cashew: Network Explorer

Live explorer for Morpheus AI network. Providers, sessions, analytics, MOR price.

**[cashew.drm3.network](https://cashew.drm3.network)**

---

## Release Structure

```
releases/
  mor/
    v0.1.0/
  venice/
    v0.x.x/
  inference-bus/
    v0.x.x/
```

---

*[drm3.network](https://drm3.network)*
