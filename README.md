# DRM3 Releases

Software from [DRM3](https://drm3.network). Binaries, installers, and documentation.

---

### MOR — Local AI Inference

Rust-native local AI gateway. Connects your wallet to decentralized AI providers on the Morpheus network. One binary, all platforms.

- **macOS:** `brew tap drm3labs/drm3 && brew install mor` · [Homebrew tap](https://github.com/drm3labs/homebrew-drm3)
- **Linux / Ubuntu / Chromebook:** `curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh | sh`
- **Direct download:** [v0.1.0 binaries](https://github.com/drm3labs/drm3-releases/releases/tag/mor-v0.1.0)
- Requires: wallet with MOR on Base, API key from [drm3.network/login](https://drm3.network/login)

### MOR DIEM SDK + Lumerin Node

TypeScript proxy and Go consumer node for Morpheus staked inference. The original open-source SDK stack — MOR DIEM handles session pooling and OpenAI-compatible routing, Lumerin Node handles blockchain comms.

- [mor-diem-sdk](https://github.com/anthropics/mor-diem-sdk) · [Morpheus-Lumerin-Node](https://github.com/MorpheusAIs/Morpheus-Lumerin-Node) (upstream) · [fork](https://github.com/robertjchristian/Morpheus-Lumerin-Node) (PR pending)

### Cashew — Morpheus Network Explorer

Live blockchain explorer for the Morpheus AI network. Real-time sync, provider rankings, session analytics, MOR price.

- [cashew.drm3.network](https://cashew.drm3.network) — free alpha, API key access, rate limits coming later

---

*More products coming. Watch this repo for releases.*
