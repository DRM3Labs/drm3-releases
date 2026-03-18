# CLAUDE.md - drm3-releases

> Public distribution registry for DRM3 tools, SDKs, and binaries.

## CRITICAL: This Repo is PUBLIC

This is **the only public repo** in the DRM3 ecosystem. Everything here is visible to the world.

| What | Rule |
|------|------|
| Source code | NEVER commit here |
| Repo URLs | NEVER reference private repos |
| Internal paths | NEVER expose |
| Binaries | OK - compiled artifacts only |
| Install scripts | OK - point to this repo's releases |
| Homebrew formula | OK - downloads from this repo |

## What Lives Here

```
drm3-releases/
├── README.md       # Product catalog, install instructions
├── install.sh      # Cross-platform curl installer
└── Formula/
    └── mor.rb      # Homebrew formula for mor CLI
```

## Install Flow

Users install via:

```bash
# Homebrew (Mac)
brew tap drm3labs/drm3 && brew install mor

# curl (Linux/Mac/Chromebook)
curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-releases/main/install.sh | sh
```

## Releases

Binary releases are published to GitHub Releases on this repo:
- `mor-darwin-arm64` (Mac Apple Silicon)
- `mor-darwin-amd64` (Mac Intel)
- `mor-linux-amd64` (Linux x86_64)

Tag format: `mor-v{VERSION}` (e.g., `mor-v0.1.0`)

## Homebrew Tap

The formula at `Formula/mor.rb` is served via:
- Tap repo: `drm3labs/homebrew-drm3` (or this repo acts as tap)
- Tap command: `brew tap drm3labs/drm3`

Formula downloads binaries from this repo's releases.

## Updating Releases

1. Build binaries in `rusty-mor-staked-inference-sdk` (PRIVATE)
2. Create GitHub Release here with binaries attached
3. Update `Formula/mor.rb` with new version and SHA256 hashes
4. Update `install.sh` VERSION if needed
5. Update `README.md` download links if needed

## What NOT to Do

- NEVER reference `rusty-mor-staked-inference-sdk` or any private repo
- NEVER commit source code
- NEVER expose internal architecture details
- Homepage is `https://drm3.network`, not GitHub

## Related Private Repos

| Repo | What | Where Binaries Come From |
|------|------|--------------------------|
| `rusty-mor-staked-inference-sdk` | MOR CLI source | `mor-*` binaries |
| `drm3-mor-app` | Tauri desktop app | `.dmg` releases |

These are PRIVATE. Never reference them in this repo.
