# Signing

DRM3 uses two independent signing schemes. They serve different purposes. Don't confuse them.

## Scheme A — Ed25519 data-provenance receipts

**Purpose:** any binary or data output DRM3 ships is accompanied by a Receipt signed with Ed25519. Consumers verify by comparing the receipt's `public_key` against the authoritative registry.

| Aspect | Value |
|---|---|
| Public key registry | https://status.drm3.network/.well-known/drm3-keys.json |
| Algorithm | Ed25519 (raw, not via minisign wrapper) |
| Signer tool | internal release signing binary |
| Verify tool (users) | `scripts/verify-release.sh` |
| Private key | derived per-product from a signing secret (path varies per SKU) |
| Key location | local developer machine / secure vault — never in any repo |

**Active for:** Pistachio CLI binaries, Connor, Open-Signals, News-RAG, RunsWith.

**Pistachio CLI flow, end-to-end:**

1. The release script builds the four platform binaries.
2. If the signing secret is configured, the script produces `{binary}.receipt.json` next to each artifact.
3. Receipt is uploaded as a release asset alongside the binary + `.sha256`.
4. Users run `scripts/verify-release.sh /path/to/binary` — it downloads the receipt, looks up the signer's pubkey in the registry, verifies the signature.

A receipt looks like:

```json
{
  "kind": "release.binary",
  "service": "pistachio",
  "version": "0.9.45",
  "platform": "darwin-arm64",
  "git_hash": "...",
  "sha256": "...",
  "signed_at": "...",
  "signature": "...",
  "public_key": "ed25519:5192708fc4d23fa6c591c5d40463259abc93753e5fcdfb8bd9a80a5d81225a26"
}
```

## Scheme B — Tauri minisign (desktop auto-updater)

**Purpose:** Tauri's updater refuses to install a bundle it can't verify against a known pubkey. This prevents a hijacked update channel from pushing malicious binaries. Nothing to do with data provenance — purely bundle integrity for the auto-update pipeline.

| Aspect | Value |
|---|---|
| Public key | embedded in the desktop app configuration under `plugins.updater.pubkey` (base64 minisign format) |
| Manifest | `update/pistachio-desktop.json` in this repo |
| Algorithm | Ed25519 via minisign wrapper |
| Signer tool | Tauri build (produces `.app.tar.gz` + `.sig`) |
| Private key | release signing key stored outside the repository |
| Backup | secure vault |

**Active for:** Pistachio Desktop (post-v0.9.45).

**Pistachio Desktop release flow, end-to-end:**

1. The release script bumps versions, builds and signs the desktop bundle, uploads the `.app.tar.gz` + `.sig` + `.dmg` to a `pistachio-desktop-v$VERSION` release on this repo.
2. The same script rewrites `update/pistachio-desktop.json` with the new version, download URL, and the `.sig` file's contents.
3. The desktop app polls the manifest URL on launch + on "Check for Updates". When `manifest.version > local_version`, it downloads the bundle, verifies the `.sig` against the embedded pubkey, installs, and relaunches.
4. If verification fails, install is rejected — user stays on current version.

A manifest looks like:

```json
{
  "version": "0.9.45",
  "notes": "Pistachio Desktop v0.9.45",
  "pub_date": "2026-04-17T20:00:00Z",
  "platforms": {
    "darwin-aarch64": {
      "url": "https://github.com/drm3labs/drm3-releases/releases/download/pistachio-desktop-v0.9.45/Pistachio_0.9.45_aarch64.app.tar.gz",
      "signature": "untrusted comment: signature from tauri secret key\n..."
    }
  }
}
```

## When you are touching signing

- **Never commit a private key to any repo.** Both schemes' privkeys live outside the working tree.
- **Never reuse a Scheme A key for Scheme B or vice versa.** Different algorithms, different threat models, different key registries.
- **Rotation cost is asymmetric.** Scheme A rotation is harmless (registry is live, consumers re-fetch). Scheme B rotation breaks every installed client on a plugin-updater-enabled version — time it with a hard version bump that forces manual re-install.
- **If you see empty signatures or a stale URL in `update/*.json`, the release script didn't run or failed.** Don't ship a bundle while the manifest is broken — Tauri will reject the install and the failure is silent on most clients.
- **The auto-updater check happens on app launch and on "Check for Updates" in the tray.** The React UI also displays a persistent banner via `UpdateBanner.tsx`. All three paths converge on the same manifest fetch.
