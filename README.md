# DRM3 Releases

Software from [DRM3](https://drm3.network). Binaries, installers, and documentation.

---

### MOR — Local AI Inference

Rust-native local AI gateway. Connects your wallet to decentralized AI providers on the Morpheus network. One binary, all platforms.

**Install:**

| Platform | How |
|----------|-----|
| Mac (Homebrew) | `brew tap drm3labs/drm3 && brew install mor` |
| Mac (Desktop App) | [Download .dmg](https://github.com/drm3labs/drm3-releases/releases/tag/mor-v0.1.0) — drag to Applications, get dock icon + tray |
| Linux / Ubuntu | `curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh \| sh` |
| Chromebook | Settings → turn on Linux → open Terminal → same curl command as Linux |

**Direct downloads (v0.1.0):**

| Platform | Download |
|----------|----------|
| Mac (Apple Silicon — M1/M2/M3/M4) | [mor-darwin-arm64](https://github.com/drm3labs/drm3-releases/releases/download/mor-v0.1.0/mor-darwin-arm64) |
| Mac (Intel) | [mor-darwin-amd64](https://github.com/drm3labs/drm3-releases/releases/download/mor-v0.1.0/mor-darwin-amd64) |
| Linux / Ubuntu / Chromebook | [mor-linux-amd64](https://github.com/drm3labs/drm3-releases/releases/download/mor-v0.1.0/mor-linux-amd64) |

Requires a wallet with MOR tokens and ETH for gas on Base chain.

---

### MOR DIEM SDK + Lumerin Node

DRM3's TypeScript SDK that simplifies working with the Morpheus Lumerin Node. Handles session pooling, OpenAI-compatible routing, and wallet management.

- [Morpheus-Lumerin-Node](https://github.com/MorpheusAIs/Morpheus-Lumerin-Node) (upstream)

---

### Cashew — Morpheus Network Explorer

Live blockchain explorer for the Morpheus AI network. Real-time sync, provider rankings, session analytics, MOR price.

[cashew.drm3.network](https://cashew.drm3.network) — free alpha, rate limits coming later

---

*Watch this repo for releases.*
