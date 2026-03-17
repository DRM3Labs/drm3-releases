# DRM3 Homebrew Tap

Homebrew formulae, binary releases, and install scripts for DRM3 tools.

## Quick Install

### macOS (Homebrew)

```bash
brew tap drm3labs/drm3-homebrew-tap
brew install mor
```

### Linux / Ubuntu / Chromebook

```bash
curl -fsSL https://raw.githubusercontent.com/drm3labs/drm3-homebrew-tap/main/install.sh | sh
```

## Available Formulae

| Formula | Description | Platforms |
|---------|-------------|-----------|
| `mor` | Local AI gateway for Morpheus decentralized inference | macOS, Linux |

## Platform Support

| Platform | Architecture | Install Method |
|----------|-------------|----------------|
| macOS Apple Silicon (M1+) | ARM64 | `brew install mor` or install.sh |
| macOS Intel | x86_64 | `brew install mor` or install.sh |
| Linux | x86_64 | `brew install mor` or install.sh |
| Chromebook | x86_64 (via Crostini) | install.sh |

## Binary Releases

All compiled binaries are published to [Releases](https://github.com/drm3labs/drm3-homebrew-tap/releases).

## More Info

- Homepage: [drm3.network](https://drm3.network)
- Install guide: [INSTALL.md](https://drm3.network/docs/install)
