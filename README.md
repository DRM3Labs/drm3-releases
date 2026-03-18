# DRM3 Releases

Official distribution registry for the DRM3 ecosystem. Versioned binaries, install scripts, and Homebrew formulae.

This is the canonical source for installing and upgrading DRM3 components. Source code lives in separate private repositories.

---

## MOR — Local AI Inference

Rust-native local AI gateway. Connects your wallet to decentralized AI providers on the Morpheus network. One binary, all platforms.

### Install

| Platform | Command |
|----------|---------|
| Mac (Homebrew) | `brew tap drm3labs/drm3 && brew install mor` |
| Mac (Desktop App) | [Download .dmg](https://github.com/drm3labs/drm3-releases/releases/tag/mor-v0.1.0) |
| Linux / Ubuntu | `curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh \| sh` |
| Chromebook | Settings → Enable Linux → Terminal → same curl command |

### Direct Downloads (v0.1.0)

| Platform | Binary |
|----------|--------|
| Mac (Apple Silicon — M1/M2/M3/M4) | [mor-darwin-arm64](https://github.com/drm3labs/drm3-releases/releases/download/mor-v0.1.0/mor-darwin-arm64) |
| Mac (Intel) | [mor-darwin-amd64](https://github.com/drm3labs/drm3-releases/releases/download/mor-v0.1.0/mor-darwin-amd64) |
| Linux x86_64 | [mor-linux-amd64](https://github.com/drm3labs/drm3-releases/releases/download/mor-v0.1.0/mor-linux-amd64) |

### Requirements

- Wallet with MOR tokens
- ETH for gas on Base chain

### Get Started

```bash
mor config set private-key   # Connect your wallet
mor config set api-key       # Get key at drm3.network/login
mor serve                    # Dashboard at http://localhost:19377
```

---

## Cashew — Morpheus Network Explorer

Live blockchain explorer for the Morpheus AI network. Real-time sync, provider rankings, session analytics, MOR price.

**[cashew.drm3.network](https://cashew.drm3.network)**

---

## Structure

```
/releases
  mor-v0.1.0/
    mor-darwin-arm64
    mor-darwin-amd64
    mor-linux-amd64
```

Releases are immutable once published.

---

*[drm3.network](https://drm3.network) — programmable access to decentralized inference*
