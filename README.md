# DRM3 Releases

Official binaries, installers, and Homebrew formulae for the DRM3 ecosystem.

## Packages

| Package | Status | What |
|---------|--------|------|
| **[MOR](#mor-staked-inference-sdk)** | **v0.2.6** | Local AI gateway for Morpheus staked inference |
| Venice Flux | roadmap | Venice AI SDK (chat, images, TTS, video) |
| Inference Bus | roadmap | Multi-provider AI router |

---

## MOR Staked Inference SDK

Rust-native local AI gateway. Connects your wallet to decentralized AI providers on the Morpheus network. One binary, all platforms. No middleman.

### Install (macOS — recommended)

```bash
brew tap drm3labs/drm3 && brew install --cask mor
```

One command. Installs the desktop app + `mor` CLI. No Gatekeeper warnings.

### CLI Only (all platforms)

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
| Mac (Desktop + CLI) | `brew tap drm3labs/drm3 && brew install --cask mor` |
| Mac (CLI only) | `brew tap drm3labs/drm3 && brew install mor` |
| Linux x86_64 | `brew install mor` or curl command above |
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

> **Install via Homebrew to avoid Gatekeeper warnings.** Homebrew automatically removes macOS quarantine. For direct binary downloads, run:
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

### Capacity & Access Passes

Every wallet gets **20 MOR** stake capacity free. NFT passes add more:

| | Adds | Total | Cost |
|--|------|-------|------|
| Free tier | — | 20 MOR | Free (every wallet) |
| Bronze NFT | +100 | 120 MOR | 8 MOR |
| Silver NFT | +500 | 520 MOR | 30 MOR |
| Gold NFT | +5,000 | 5,020 MOR | 200 MOR |
| Diamond NFT | +25,000 | 25,020 MOR | 1,000 MOR |

Bigger stake = longer sessions = less ETH gas. NFTs save money.

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
