# DRM3 Releases

Official binaries, installers, and Homebrew formulae for the DRM3 ecosystem.

## Packages

| Package | Status | What |
|---------|--------|------|
| **[Pistachio](#pistachio)** | **v0.3.2** | DRM3's Morpheus-compatible P2P inference client |
| Venice Flux | roadmap | Venice AI SDK (chat, images, TTS, video) |
| Inference Bus | roadmap | Multi-provider AI router |

---

## Pistachio

Rust-native P2P inference client. Connects your wallet to decentralized AI providers on the Morpheus network. One binary, all platforms. No middleman.

### Install (macOS — recommended)

```bash
brew tap drm3labs/drm3 && brew install --cask pistachio
```

One command. Installs the desktop app + `pistachio` CLI. No Gatekeeper warnings.

### CLI Only (all platforms)

```bash
brew tap drm3labs/drm3 && brew install pistachio
```

or

```bash
curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh | sh
```

### Platforms

| Platform | Command |
|----------|---------|
| Mac (Desktop + CLI) | `brew tap drm3labs/drm3 && brew install --cask pistachio` |
| Mac (CLI only) | `brew tap drm3labs/drm3 && brew install pistachio` |
| Linux x86_64 | `brew install pistachio` or curl command above |
| Linux ARM64 | Same curl command (auto-detects architecture) |
| Windows | Install WSL2 first (see below), then curl command above |
| Chromebook | Enable Linux → open Terminal → curl command above |

### Windows Install (via WSL2)

Pistachio runs on Windows through WSL2 (Windows Subsystem for Linux). WSL2 runs a real Linux kernel — same binary, full performance.

```powershell
# Step 1: Install WSL2 (one time, from PowerShell as admin)
wsl --install

# Step 2: Restart your computer, open Ubuntu from Start menu

# Step 3: Install Pistachio (inside Ubuntu terminal)
curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh | sh
pistachio config set private-key
pistachio serve
```

Open `http://localhost:19377` in your Windows browser — WSL2 forwards ports automatically.

### macOS Note

> **Install via Homebrew to avoid Gatekeeper warnings.** Homebrew automatically removes macOS quarantine. For direct binary downloads, run:
> ```bash
> xattr -d com.apple.quarantine /usr/local/bin/pistachio
> ```

### Get Started

```bash
pistachio config set private-key   # Enter your wallet private key
pistachio serve                    # Dashboard at localhost:19377
```

That's it. Two commands. Your wallet is your identity, your NFT pass controls your stake capacity.

Requires MOR tokens + ETH for gas on Base chain.

### Capacity & Access Passes

Every wallet gets **20 MOR** stake capacity free. NFT passes add more:

| | Adds | Total | Cost |
|--|------|-------|------|
| Free tier | — | 20 MOR | Free (every wallet) |
| Bronze NFT | +200 | 220 MOR | 5 MOR |
| Silver NFT | +1,000 | 1,020 MOR | 20 MOR |
| Gold NFT | +5,000 | 5,020 MOR | 80 MOR |
| Diamond NFT | +20,000 | 20,020 MOR | 250 MOR |

Bigger stake = longer sessions = less ETH gas. NFTs save money.

Contract: [`0x0383d62447B806C385f78B4bF154157c8E821BFe`](https://basescan.org/address/0x0383d62447B806C385f78B4bF154157c8E821BFe) on Base mainnet.

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
| Live Demo | [pistachio.drm3.network](https://pistachio.drm3.network) |
| Explorer | [cashew.drm3.network](https://cashew.drm3.network) |

---

*[drm3.network](https://drm3.network) — DRM3 Labs Corp.*
