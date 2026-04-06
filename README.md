# DRM3 Releases

Official binaries, installers, and Homebrew formulae for the DRM3 ecosystem.

## Products

| Product | Version | What | Live |
|---------|---------|------|------|
| **[Pistachio](#pistachio)** | **v0.5.4** | P2P inference client — wallet + NFT identity, on-chain attestation | [pistachio.inference.drm3.network](https://pistachio.inference.drm3.network) |
| **[Cashew](#cashew-network-explorer)** | **v1.3.1** | Morpheus blockchain explorer — staking, sessions, analytics | [cashew.explorer.drm3.network](https://cashew.explorer.drm3.network) |
| **[Connor](#connor-internet-telemetry)** | **v0.9.8** | Internet telemetry index — 10,000+ domains, provenance-signed | [connor.dns.drm3.network](https://connor.dns.drm3.network) |
| **[Allen](#allen-infrastructure-fingerprinting)** | **v0.4.0** | Infrastructure fingerprinting — 80+ provider categories | [allen.dns.drm3.network](https://allen.dns.drm3.network) |
| **[3P Signals](#3p-signals)** | **v0.2.0** | Third-party data aggregator — 23 sources, provenance-signed | [signals.data.drm3.network](https://signals.data.drm3.network) |
| **DRM3 Office** | preview | AI-powered office suite with provenance-signed documents | Coming soon |
| **[Global Monitor](#global-monitor)** | live | Real-time product health dashboard | [status.drm3.network](https://status.drm3.network) |

---

## Pistachio

Rust-native P2P inference client. Connects your wallet to decentralized AI providers on the Morpheus network. Every session attested on-chain. One binary, all platforms. No middleman.

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
curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/products/pistachio/install.sh | sh
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
curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/products/pistachio/install.sh | sh
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

Requires MOR tokens + ETH for gas on Base chain. **[Full setup guide →](https://drm3.network/docs/pistachio-guide)** (wallet, MOR, passes, troubleshooting).

### Capacity & Access Passes

Claim your free **Starter** pass for **20 MOR** stake capacity. NFT passes add more:

| | Adds | Total | Cost |
|--|------|-------|------|
| Starter (free) | — | 20 MOR | Free (claim required) |
| Bronze NFT | +200 | 220 MOR | 5 MOR |
| Silver NFT | +1,000 | 1,020 MOR | 20 MOR |
| Gold NFT | +5,000 | 5,020 MOR | 80 MOR |
| Diamond NFT | +20,000 | 20,020 MOR | 250 MOR |

Bigger stake = longer sessions = less ETH gas. NFTs save money.

Contract: [`0xDba7705f4F5aA8250576EA9082de12840F730284`](https://basescan.org/address/0xDba7705f4F5aA8250576EA9082de12840F730284) on Base mainnet.

3% royalty on all transfers. Passes are splittable and mergeable.

---

## Cashew: Network Explorer

Live blockchain explorer for the Morpheus AI network. MOR staking, provider sessions, compute marketplace, price analytics. DRM3 Auth (wallet-signed EIP-712).

**[cashew.explorer.drm3.network](https://cashew.explorer.drm3.network)** | [API docs](https://cashew.explorer.drm3.network/llms.txt)

---

## Connor: Internet Telemetry

Continuous internet telemetry index. Scans 10,000+ domains across DNS, HTTPS, WHOIS, certificates, traceroute, DNSSEC. Every observation is provenance-signed with Ed25519. Multi-plane enrichment with per-plane receipts.

**[connor.dns.drm3.network](https://connor.dns.drm3.network)** | [API docs](https://connor.dns.drm3.network/llms.txt)

---

## Allen: Infrastructure Fingerprinting

Service fingerprinting and technology stack analysis. Consumes Connor's signal data to identify 80+ providers across DNS, email, hosting, CDN, and security categories. Migration detection and change alerts.

**[allen.dns.drm3.network](https://allen.dns.drm3.network)**

---

## 3P Signals

Third-party data aggregator. 23 external data sources (financial, government, environmental, social, search). Every fetch is provenance-signed with Ed25519 per-source signers. 30-day hot storage with fetch history drill-down.

**[signals.data.drm3.network](https://signals.data.drm3.network)** | [API docs](https://signals.data.drm3.network/llms.txt)

---

## DRM3 Office

AI-powered office suite with provenance-signed documents. Coming soon.

---

## Global Monitor

Real-time product health dashboard. Tracks status of all DRM3 products via the DRM3 Health Protocol.

**[status.drm3.network](https://status.drm3.network)** | [API docs](https://status.drm3.network/llms.txt)

---

## Provenance

All DRM3 data products sign their outputs with Ed25519 provenance receipts. Every scan, fetch, and observation has a cryptographic proof of when it was collected, by which scanner, and what the content hash was. Receipts are chained for audit trail.

Learn more: [drm3.network/llms.txt](https://drm3.network/llms.txt)

---

## Links

| | |
|--|--|
| Homepage | [drm3.network](https://drm3.network) |
| Products | [drm3.network/products](https://drm3.network/products) |
| NFT Passes | [drm3.xyz](https://drm3.xyz) |
| Claim Pass | [drm3.network/claim](https://drm3.network/claim) |
| Status | [status.drm3.network](https://status.drm3.network) |
| Explorer | [cashew.explorer.drm3.network](https://cashew.explorer.drm3.network) |
| Telemetry | [connor.dns.drm3.network](https://connor.dns.drm3.network) |
| Fingerprinting | [allen.dns.drm3.network](https://allen.dns.drm3.network) |
| Signals | [signals.data.drm3.network](https://signals.data.drm3.network) |
| Live Demo | [pistachio.inference.drm3.network](https://pistachio.inference.drm3.network) |

---

*[drm3.network](https://drm3.network) — DRM3 Labs Corp.*
