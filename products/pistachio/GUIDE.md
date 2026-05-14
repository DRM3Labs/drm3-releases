# Pistachio Setup Guide

Everything you need to go from install to your first AI inference on the Morpheus network.

---

## 1. Install

### macOS

```bash
brew tap drm3labs/drm3 && brew install --cask pistachio
```

Installs the desktop app + `pistachio` CLI. No Gatekeeper warnings.

> **Do not install both the cask and the formula.** They both provide the `pistachio` binary and will conflict. If you previously ran `brew install pistachio` (without `--cask`), uninstall it first: `brew uninstall pistachio`

### Linux

```bash
curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/products/pistachio/install.sh | sh
```

Works on x86_64 and ARM64 (auto-detected).

### Windows (via WSL2)

```powershell
# PowerShell as admin — one time
wsl --install
```

Restart your computer, open Ubuntu from the Start menu, then run the Linux install command above.

WSL2 forwards ports automatically — open `http://localhost:19377` in your Windows browser.

### Chromebook

Enable Linux (Settings → Advanced → Developers → Linux), open Terminal, then run the Linux install command above.

### Verify

```bash
pistachio --version
```

---

## 2. Set Up Your Wallet

Pistachio uses your Ethereum wallet as your identity. Your private key never leaves your machine — it's stored locally with restricted file permissions and is used to sign requests.

### If you already have a wallet

```bash
pistachio config set private-key
```

Paste your private key when prompted (hex string starting with `0x`, 66 characters). It's saved to `~/.pistachio/config.toml` with `chmod 600`.

Or set it as an environment variable:

```bash
export PISTACHIO_PRIVATE_KEY=0x...
```

### If you need a wallet

The easiest way is [MetaMask](https://metamask.io/):

1. Install MetaMask browser extension
2. Create a new wallet (save your seed phrase somewhere safe)
3. Export your private key: Settings → Security → Export Private Key
4. Run `pistachio config set private-key` and paste it

Alternatively, if you have Foundry installed:

```bash
cast wallet new
```

**Important:** This wallet controls your MOR stake and your identity on the network. Back up your seed phrase. If you lose access to this wallet, you lose access to any staked MOR.

**Private key is CLI-only.** There is no way to enter it through the web dashboard — this is intentional for security. The dashboard will show a setup screen directing you to the CLI if no key is configured.

---

## 3. Set Up a Base RPC Key (Required)

Pistachio reads session and staking data from the Base blockchain. A dedicated RPC endpoint is required. Free public RPCs rate-limit too aggressively and will cause startup failures.

1. Go to [alchemy.com](https://www.alchemy.com/) and create a free account
2. Create an app, select **Base Mainnet**
3. Copy your API key and run:

```bash
pistachio config set rpc-url https://base-mainnet.g.alchemy.com/v2/YOUR_KEY
```

Verify with `pistachio info`. The free Alchemy tier gives you 300 million compute units per month. More than enough for personal use.

---

## 4. Get MOR Tokens

MOR is the native token of the Morpheus network. You need MOR to stake for inference sessions.

**MOR must be on the Base network** (not Ethereum mainnet, not Arbitrum).

### Buy MOR

The most common way is [Uniswap](https://app.uniswap.org/):

1. Connect your wallet to Uniswap
2. Switch to Base network
3. Swap ETH (or USDC) for MOR
4. Contract address on Base: `0x7431aDa8a591C955a994a21710752EF9b882b8e3`

Also available via MetaMask Swaps or Coinbase DEX (both on Base).

**How much do you need?** Start with 10-20 MOR. With the free Starter pass, you can stake up to 20 MOR. A 10 MOR stake gives you roughly 20-30 minutes of inference time on most models.

---

## 5. Get ETH on Base (for gas)

Every transaction on Base requires a small amount of ETH for gas fees. You'll need ETH for staking, opening sessions, and claiming your NFT pass.

**$5-10 worth of ETH on Base is more than enough** to get started. Gas fees on Base are fractions of a cent.

### How to get ETH on Base

- **Coinbase:** Buy ETH and withdraw directly to Base (cheapest)
- **Bridge from Ethereum mainnet:** Use the [Base Bridge](https://bridge.base.org/)
- **Exchange deposit:** Most exchanges support Base network withdrawals

---

## 6. Claim Your Pistachio Pass

The Pistachio Pass is a free NFT that gives you 20 MOR of staking capacity. You must claim it before you can open inference sessions.

### Claim via web

1. Go to [drm3.network/claim](https://drm3.network/claim)
2. Connect the same wallet you configured in Pistachio
3. Claim your free Starter pass (costs ~$0.01 in gas)

### Claim via CLI

```bash
pistachio claim-pass
```

Follow the prompts. Requires ETH on Base for gas.

### Upgrade passes

NFT passes are additive — each one increases your max stake capacity:

| Pass | Adds | Total Capacity | Cost |
|------|------|----------------|------|
| Starter (free) | — | 20 MOR | Free (claim required) |
| Bronze | +200 | 220 MOR | 5 MOR |
| Silver | +1,000 | 1,020 MOR | 20 MOR |
| Gold | +5,000 | 5,020 MOR | 80 MOR |
| Diamond | +20,000 | 20,020 MOR | 250 MOR |

Bigger stake = longer sessions = less ETH gas over time.

---

## 7. Start Pistachio

```bash
pistachio serve
```

Dashboard opens at [http://localhost:19377](http://localhost:19377).

The dashboard shows your wallet balance, available models, active sessions, and the compute marketplace. Inference API is available at the same address.

---

## 8. Your First Inference

### From the CLI

```bash
pistachio chat "Explain how proof of stake works" --model llama-3.3-70b
```

Pistachio will automatically stake MOR and open a session if needed.

### From the dashboard

Open [http://localhost:19377](http://localhost:19377) and use the chat interface.

### Via API (OpenAI-compatible)

```bash
curl http://localhost:19377/inference/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "llama-3.3-70b",
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

No API key required in local mode — your wallet is your identity.

---

## CLI Reference

### Configuration

```bash
pistachio config show              # Show current config
pistachio config set private-key   # Set wallet private key
pistachio config set port 8080     # Change server port
pistachio config path              # Show config file location
pistachio config reset             # Delete config file
```

### Wallet

```bash
pistachio wallet balance           # MOR and ETH balances on Base
pistachio wallet approve           # Approve MOR spending (required before staking)
```

### Sessions

```bash
pistachio session list             # Active sessions with expiry times
pistachio session open llama-3.3-70b --stake 5   # Stake 5 MOR on a model
pistachio session close --session 0x...           # Close session, reclaim MOR
pistachio session renew-all        # Renew expiring sessions
```

### Models

```bash
pistachio catalog list             # All available models
pistachio catalog refresh          # Sync models from chain
pistachio catalog probe            # Test model health
pistachio catalog filter --healthy --capacity     # Show healthy models with capacity
```

### Other

```bash
pistachio info                     # Version and config info
pistachio lanes                    # Session lane statistics
pistachio chat "prompt" --stream   # Stream a response
pistachio uninstall                # Remove Pistachio (--keep-keys to preserve config)
```

Run any command with `--help` for full details.

---

## Troubleshooting

### "No private key configured"

Run `pistachio config set private-key` and enter your wallet key. Or set `PISTACHIO_PRIVATE_KEY=0x...` in your environment.

### "No Pistachio Pass found"

You need to claim your free pass first. Go to [drm3.network/claim](https://drm3.network/claim) or run `pistachio claim-pass`.

### "Insufficient MOR balance"

You need MOR tokens on the **Base** network. If you have MOR on Ethereum mainnet or Arbitrum, it won't work — you need to bridge it to Base.

### "Insufficient ETH for gas"

You need a small amount of ETH on Base for transaction fees. $5 is plenty.

### Wrong version after `brew upgrade`

If `pistachio --version` shows an old version after upgrading, you may have both the formula and cask installed. They conflict. Fix:

```bash
brew uninstall pistachio
brew install --cask pistachio
```

### Port already in use

```bash
pistachio config set port 8080
pistachio serve
```

Or: `PISTACHIO_PORT=8080 pistachio serve`

### macOS: "unidentified developer" warning

If you downloaded the binary directly (not via Homebrew):

```bash
xattr -d com.apple.quarantine /usr/local/bin/pistachio
```

Homebrew installs don't have this issue.

### Session expired / no active session

Sessions have a time limit based on your stake amount. Stake more MOR for longer sessions, or enable auto-renewal:

```bash
pistachio session renew-all
```

### Models not loading

```bash
pistachio catalog refresh
pistachio catalog probe            # Check which models are healthy
```

### Still stuck?

```bash
pistachio info                     # Check version and config
pistachio wallet balance           # Verify funds
pistachio session list             # Check session status
```

Visit [status.drm3.network](https://status.drm3.network) to check if the network is healthy.

---

## Environment Variables

| Variable | Purpose |
|----------|---------|
| `PISTACHIO_PRIVATE_KEY` | Wallet private key (alternative to config file) |
| `PISTACHIO_PORT` | Server port (default: 19377) |

---

## Useful Links

| | |
|--|--|
| Download | [github.com/drm3labs/drm3-releases](https://github.com/drm3labs/drm3-releases/releases) |
| Claim Pass | [drm3.network/claim](https://drm3.network/claim) |
| NFT Marketplace | [nft.drm3.xyz](https://nft.drm3.xyz) |
| Network Status | [status.drm3.network](https://status.drm3.network) |
| Block Explorer | [cashew.explorer.drm3.network](https://cashew.explorer.drm3.network) |
| Homepage | [drm3.network](https://drm3.network) |

---

*[drm3.network](https://drm3.network) — DRM3 Labs Corp.*
