# DRM3 Software Distribution

Official binary releases and install scripts for DRM3 products.

Homepage: [drm3.network](https://drm3.network)

---

## MOR — Morpheus Local AI Inference

Local AI gateway for [Morpheus](https://mor.org) decentralized inference. One binary, no dependencies. Connects your wallet directly to AI providers on Base chain.

**Current release: v0.1.0**

### Download

| Platform | Download | Checksum |
|----------|----------|----------|
| macOS Apple Silicon (M1/M2/M3/M4) | [mor-darwin-arm64](https://github.com/drm3labs/drm3-homebrew-tap/releases/download/mor-v0.1.0/mor-darwin-arm64) | [sha256](https://github.com/drm3labs/drm3-homebrew-tap/releases/download/mor-v0.1.0/mor-darwin-arm64.sha256) |
| macOS Intel | [mor-darwin-amd64](https://github.com/drm3labs/drm3-homebrew-tap/releases/download/mor-v0.1.0/mor-darwin-amd64) | [sha256](https://github.com/drm3labs/drm3-homebrew-tap/releases/download/mor-v0.1.0/mor-darwin-amd64.sha256) |
| Linux x86_64 (Ubuntu, Debian, etc.) | [mor-linux-amd64](https://github.com/drm3labs/drm3-homebrew-tap/releases/download/mor-v0.1.0/mor-linux-amd64) | [sha256](https://github.com/drm3labs/drm3-homebrew-tap/releases/download/mor-v0.1.0/mor-linux-amd64.sha256) |
| macOS Desktop App (.dmg) | [MOR_0.1.0_aarch64.dmg](https://github.com/drm3labs/drm3-mor-app/releases) | — |

All releases: [github.com/drm3labs/drm3-homebrew-tap/releases](https://github.com/drm3labs/drm3-homebrew-tap/releases)

### Install

**macOS (Homebrew) — recommended:**

```bash
brew tap drm3labs/drm3-homebrew-tap
brew install mor
```

**macOS (Desktop App):**

Download the `.dmg` above, open it, drag MOR to Applications. Launches with a dock icon and menu bar tray.

**Linux / Ubuntu:**

```bash
curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-homebrew-tap/main/install.sh | sh
```

**Chromebook:**

1. Settings → Advanced → Developers → Turn on Linux
2. Open Terminal, then:

```bash
curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-homebrew-tap/main/install.sh | sh
```

**Manual install (any platform):**

```bash
# Download the binary for your platform (see table above)
chmod +x mor-*
sudo mv mor-* /usr/local/bin/mor
mor --version
```

### Getting Started

```bash
# 1. Set your wallet private key
mor config set private-key

# 2. Get an API key at https://drm3.network/login
mor config set api-key

# 3. Launch the dashboard
mor serve
# Open http://localhost:19377
```

Browse mode works without keys — explore models, providers, and pricing before committing.

### Full Documentation

See [INSTALL.md](https://drm3.network/docs/install) for detailed setup, CLI usage, environment variables, and troubleshooting.

---

*More products coming soon. This repo serves as the distribution hub for all DRM3 binaries and installers.*
