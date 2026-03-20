# DRM3 Releases

Official binaries, installers, and Homebrew formulae for the DRM3 ecosystem.

## Packages

| Package | Status | What |
|---------|--------|------|
| **[MOR](#mor-staked-inference-sdk)** | **v0.1.6** | Local AI gateway for Morpheus staked inference |
| Venice Flux | roadmap | Venice AI SDK (chat, images, TTS, video) |
| Inference Bus | roadmap | Multi-provider AI router |

---

## MOR Staked Inference SDK

Rust-native local AI gateway. Connects your wallet to decentralized AI providers on the Morpheus network. One binary, all platforms. No middleman.

### Install

```bash
brew tap drm3labs/drm3 && brew install mor
```

or

```bash
curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh | sh
```

### Platforms

| Platform | Command |
|----------|---------|
| Mac (Homebrew) | `brew tap drm3labs/drm3 && brew install mor` |
| Mac (Desktop) | [Download .dmg](https://github.com/drm3labs/drm3-releases/releases/latest) |
| Linux x86_64 | `curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh \| sh` |
| Linux ARM64 | Same curl command (auto-detects architecture) |
| Windows | Install WSL2 first (see below), then curl command above |
| Chromebook | Enable Linux → open Terminal → curl command above |

### Windows Install (via WSL2)

MOR runs on Windows through WSL2 (Windows Subsystem for Linux). WSL2 runs a real Linux kernel — same binary, full performance.

```powershell
# Step 1: Install WSL2 (one time, from PowerShell as admin)
wsl --install

# Step 2: Restart your computer, open Ubuntu from Start menu

# Step 3: Install MOR (inside Ubuntu terminal)
curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh | sh
mor config set private-key
mor serve
```

Open `http://localhost:19377` in your Windows browser — WSL2 forwards ports automatically.

### macOS Note

> **Apple Developer certification pending.** If macOS blocks the binary, Homebrew handles it automatically. For direct downloads, run:
> ```bash
> xattr -d com.apple.quarantine /usr/local/bin/mor
> ```

### Get Started

```bash
mor config set private-key   # Enter your wallet private key
mor serve                    # Dashboard at localhost:19377
```

That's it. Two commands. Your wallet is your identity, your NFT pass controls your stake capacity.

Requires MOR tokens + ETH for gas on Base chain.

### Access Passes (NFT)

Your stake capacity is controlled by an NFT access pass on Base mainnet.

| Tier | Stake Cap | Price |
|------|-----------|-------|
| Free | 20 MOR | Claim free (one per wallet) |
| Bronze | 50 MOR | 5 MOR |
| Silver | 100 MOR | 8 MOR |
| Gold | 500 MOR | 30 MOR |
| Platinum | 1,000 MOR | 50 MOR |
| Diamond | 50,000 MOR | 2,000 MOR |

Contract: [`0x019979cb44a1B8C938CcA5080F4664B29f17FEbE`](https://basescan.org/address/0x019979cb44a1B8C938CcA5080F4664B29f17FEbE) on Base mainnet.

3% royalty on all transfers. Passes are splittable and mergeable.

---

## Cashew: Network Explorer

Live blockchain explorer for the Morpheus AI network. Providers, sessions, analytics, MOR price.

**[cashew.drm3.network](https://cashew.drm3.network)**

---

## Links

| | |
|--|--|
| Products | [drm3.network/products](https://drm3.network/products) |
| Claim Pass | [drm3.network/claim](https://drm3.network/claim) |
| Live Demo | [inference.drm3.network](https://inference.drm3.network) |
| Explorer | [cashew.drm3.network](https://cashew.drm3.network) |

---

*[drm3.network](https://drm3.network) — DRM3 Labs Corp.*
