# DRM3 Releases

Official release distribution for DRM3 products — signed binaries, installers, desktop auto-update manifests, and Homebrew formulae.

Platform home: **[drm3.network](https://drm3.network)** · Live status: **[status.drm3.network](https://status.drm3.network)**

---

## Downloadable products

Ship as signed binaries or WASM packages. Install locally.

| Product | Latest | Kind | Install | Docs |
|---------|--------|------|---------|------|
| [Pistachio CLI](products/pistachio/README.md) | `pistachio-v0.11.12` | Rust binary (macOS, Linux, WSL2) | `brew install pistachio` | [guide](products/pistachio/GUIDE.md) |
| [Pistachio Desktop](products/pistachio-desktop/README.md) | `pistachio-desktop-v0.11.12` | Tauri app (macOS) | `brew install --cask pistachio` | [guide](products/pistachio-desktop/README.md) |
| [DRM3 Provenance](products/provenance/README.md) | `provenance-v0.2.0` | WASM + Rust crate | Download tarball | [guide](products/provenance/GUIDE.md) |
| [AI Text Analyzer](products/ai-text-analyzer/README.md) | `ai-text-analyzer-v1.1.0` | npm package | `npm install @drm3/ai-text-analyzer` | [readme](products/ai-text-analyzer/README.md) |

## Hosted services

Web products. Nothing to install.

| Service | URL |
|---------|-----|
| Pistachio Demo | [pistachio.inference.drm3.network](https://pistachio.inference.drm3.network) |
| Cashew Explorer | [cashew.explorer.drm3.network](https://cashew.explorer.drm3.network) |
| Connor Telemetry | [connor.dns.drm3.network](https://connor.dns.drm3.network) |
| RunsWith Fingerprinting | [runswith.dns.drm3.network](https://runswith.dns.drm3.network) |
| Open Signals | [signals.data.drm3.network](https://signals.data.drm3.network) |
| Global Monitor | [status.drm3.network](https://status.drm3.network) |

---

## Verification

Every release artifact is signed with Ed25519 by the DRM3 release signer (`drm3/releases/signer`). Public keys are published at [status.drm3.network/.well-known/drm3-keys.json](https://status.drm3.network/.well-known/drm3-keys.json).

See [SIGNING.md](SIGNING.md) for the verification protocol.

---

## Links

| | |
|--|--|
| Homepage | [drm3.network](https://drm3.network) |
| Products | [drm3.network/products](https://drm3.network/products) |
| NFT Passes | [drm3.xyz](https://drm3.xyz) |
| Claim Pass | [drm3.network/claim](https://drm3.network/claim) |
| Status | [status.drm3.network](https://status.drm3.network) |

---

*[drm3.network](https://drm3.network) — DRM3 Labs Corp.*
