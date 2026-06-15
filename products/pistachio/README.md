# Pistachio CLI

Rust-native P2P inference client for the Morpheus network. Wallet-as-identity, NFT-gated stake capacity, on-chain session attestation. One binary, all platforms.

**Latest:** `pistachio-v0.30.0`

## Install

### macOS

```bash
brew tap drm3labs/drm3 && brew install --cask pistachio-desktop
```

Installs the desktop app + CLI. For the headless CLI only (no desktop app): `brew install drm3labs/drm3/pistachio`. The cask and formula can coexist.

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

## Host a gateway

Deploy Pistachio as a hosted inference gateway using Docker. No source code needed.

```bash
docker pull drm3/pistachio:latest
```

Deploy on Fly.io, Google Cloud Run, AWS, DigitalOcean, Railway — any platform that runs containers. ~$5-8/month.

Full instructions: [GATEWAY.md](./GATEWAY.md) · Docker Hub: [drm3/pistachio](https://hub.docker.com/r/drm3/pistachio)

## Update / uninstall

```bash
brew upgrade --cask pistachio-desktop  # update
brew uninstall --cask pistachio-desktop  # remove (wallet config preserved)
```

## Verification

Every release artifact ships with a SHA256 checksum and (when enabled) an Ed25519 provenance receipt signed by `drm3/releases/signer`. Public keys: [status.drm3.network/.well-known/drm3-keys.json](https://status.drm3.network/.well-known/drm3-keys.json).

## Capacity & passes

Claim your free **Starter** pass for 20 MOR stake capacity. NFT passes add more — see [drm3.xyz](https://drm3.xyz).

Contract: [`0x3a29929e97DF8a2EB515e6a35da5f019c91ECA43`](https://basescan.org/address/0x3a29929e97DF8a2EB515e6a35da5f019c91ECA43) on Base.

## License

Proprietary. DRM3 Labs Corp.
