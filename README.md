# DRM3 Releases

Official release distribution for DRM3 products: binaries, installers, desktop auto-update manifests, and Homebrew formulae.

Platform home: **[drm3.network](https://drm3.network)** · Live status: **[status.drm3.network](https://status.drm3.network)**

---

## Downloadable products

Ship as binaries or WASM packages. Install locally.

| Product | Latest | Kind | Install | Docs |
|---------|--------|------|---------|------|
| [Pistachio Desktop](products/pistachio-desktop/README.md) | `pistachio-desktop-v0.30.0` | Tauri desktop app (macOS) | `brew install --cask pistachio-desktop` | [guide](products/pistachio/GUIDE.md) |
| [Pistachio CLI](products/pistachio/README.md) | `pistachio-v0.32.0` | Rust binary (macOS, Linux, WSL2) | `brew install pistachio` | [guide](products/pistachio/GUIDE.md) |
| [DRM3 Provenance](products/provenance/README.md) | `provenance-v0.4.1` | WASM + Rust crate | Download tarball | [guide](products/provenance/GUIDE.md) |
| [AI Text Analyzer](products/ai-text-analyzer/README.md) | `ai-text-analyzer-v1.2.0` | npm package | `npm install @drm3/ai-text-analyzer` | [readme](products/ai-text-analyzer/README.md) |
| [Health Contract](products/health-contract/README.md) | `health-contract-v0.3.1` | npm package (tarball) | `npm install <release-tarball-url>` | [readme](products/health-contract/README.md) |

Pistachio is a local install. It runs on your machine and talks to the Morpheus network directly; there is no hosted Pistachio to sign in to.

## Hosted services

Web products. Nothing to install.

| Service | URL |
|---------|-----|
| Cashew Explorer | [cashew.explorer.drm3.network](https://cashew.explorer.drm3.network) |
| Connor Telemetry | [connor.dns.drm3.network](https://connor.dns.drm3.network) |
| Open Signals (sign in) | [signals.data.drm3.network](https://signals.data.drm3.network) |
| Global Monitor | [status.drm3.network](https://status.drm3.network) |

---

## Verification

Every Pistachio CLI binary is published with a SHA256 checksum file beside it in the same release. The install script and the Homebrew formula check the downloaded binary against that checksum and stop on a missing or mismatched value. The desktop auto-updater verifies each update bundle against the signing key built into the app before installing it.

See [SIGNING.md](SIGNING.md) for exactly what is checked, and what is not.

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

*[drm3.network](https://drm3.network) · DRM3 Labs Corp.*
