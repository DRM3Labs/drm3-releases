# Pistachio CLI

Rust-native P2P inference client for the Morpheus network. Wallet-as-identity, NFT-gated stake capacity, on-chain session attestation. One binary, all platforms.

**Latest:** `pistachio-v0.11.10`

## Install

### macOS (recommended)

```bash
brew tap drm3labs/drm3 && brew install pistachio
```

### Linux / WSL2

```bash
curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/products/pistachio/install.sh | sh
```

### Windows

Install [WSL2](https://learn.microsoft.com/windows/wsl/install), then run the Linux command inside Ubuntu.

## Get started

```bash
pistachio config set private-key
pistachio serve
```

Open `http://localhost:19377`. Full walkthrough: [GUIDE.md](./GUIDE.md).

## Update / uninstall

```bash
brew upgrade pistachio    # update
brew uninstall pistachio  # remove (wallet config at ~/.mor/config.toml preserved)
```

## Verification

Every release artifact ships with a SHA256 checksum and (when enabled) an Ed25519 provenance receipt signed by `drm3/releases/signer`. Public keys: [status.drm3.network/.well-known/drm3-keys.json](https://status.drm3.network/.well-known/drm3-keys.json).

## Capacity & passes

Claim your free **Starter** pass for 20 MOR stake capacity. NFT passes add more — see [drm3.xyz](https://drm3.xyz).

Contract: [`0xDba7705f4F5aA8250576EA9082de12840F730284`](https://basescan.org/address/0xDba7705f4F5aA8250576EA9082de12840F730284) on Base.

## License

Proprietary. DRM3 Labs Corp.
