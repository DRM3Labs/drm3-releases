# Pistachio Desktop

The Pistachio P2P inference client, packaged as a native macOS app (Tauri + Rust). Same engine as the CLI, wrapped in a desktop UI with system-tray controls and auto-update.

**Latest:** `pistachio-desktop-v0.30.0`

## Install (macOS)

```bash
brew tap drm3labs/drm3 && brew install --cask pistachio-desktop
```

Installs the desktop app + bundled `pistachio` CLI. Homebrew removes the macOS quarantine attribute automatically, so no Gatekeeper warnings.

## Direct download

DMG images and Tauri update bundles are attached to each release:

- `Pistachio_<version>_aarch64.dmg` — Apple Silicon
- `Pistachio_<version>_x64.dmg` — Intel
- `Pistachio_<version>_aarch64.app.tar.gz` + `.sig` — Tauri auto-update payload
- `Pistachio_<version>_x64.app.tar.gz` + `.sig` — Tauri auto-update payload

See: [https://github.com/DRM3Labs/drm3-releases/releases](https://github.com/DRM3Labs/drm3-releases/releases)

## Auto-update

The desktop app checks [update/pistachio-desktop.json](../../update/pistachio-desktop.json) on launch. Updates are signed; the Tauri updater verifies the `.sig` before applying.

## Linux / Windows

The desktop shell is macOS-only today. Use the [Pistachio CLI](../pistachio/README.md) on Linux / WSL2 / Chromebook.

## License

Proprietary. DRM3 Labs Corp.
