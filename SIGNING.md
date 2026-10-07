# Signing and verification

This page describes the checks that run when you install a DRM3 release today. Nothing here is a promise about a check you cannot run yourself.

## What the Pistachio CLI installer checks

`products/pistachio/install.sh` downloads one binary (`pistachio-<os>-<arch>`) from a GitHub release on this repository, then:

1. Downloads `<binary>.sha256` from the same release.
2. Reads the first field of that file and requires it to be a 64-character hex SHA256 value.
3. Computes the SHA256 of the downloaded binary with `sha256sum` or `shasum -a 256`.
4. Compares the two. On a missing checksum file, a malformed value, no SHA256 tool, or a mismatch, the installer prints the reason and exits 1 without installing anything.

That is the whole check. The checksum and the binary come from the same release, so this check proves the download arrived intact and matches what was uploaded to that release. It does not prove who uploaded it.

## What the Homebrew formula checks

`Formula/pistachio.rb` carries a SHA256 for each platform binary in the formula itself. Homebrew refuses to install a download whose hash does not match the formula. The formula is pinned to one version and is updated by a commit to this repository, so the hash you compare against comes from this repository, not from the release.

## What the desktop auto-updater checks

Pistachio Desktop is a Tauri app. Each release attaches `Pistachio_<version>_<arch>.app.tar.gz` and a matching `.sig` (minisign format). The manifest at `update/pistachio-desktop.json` lists the current version, each bundle's download URL, and each `.sig` file's contents.

On launch and on "Check for Updates", the app reads that manifest. When the manifest version is newer than the installed one, it downloads the bundle and verifies the signature against the public key built into the app. If verification fails, the update is rejected and the installed version stays in place.

## Receipt files

Many release assets have a `<asset>.receipt.json` beside them. A receipt is an Ed25519-signed record with these fields:

```json
{
  "id": "rcpt_...",
  "action": "release.binary",
  "timestamp": "2026-06-27T03:33:13Z",
  "input_hash": "sha256:...",
  "output_hash": "sha256:...",
  "signature": "ed25519:...",
  "public_key": "ed25519:..."
}
```

The signing key is listed under the Pistachio entry of the public key registry at [status.drm3.network/.well-known/drm3-keys.json](https://status.drm3.network/.well-known/drm3-keys.json).

Today no installer, formula or script in this repository reads a receipt, and the `output_hash` in a receipt is not the SHA256 of the asset it sits beside. A receipt is a record that the release step ran under a listed key. It is not, today, a way to verify the binary on your disk. Use the checksum checks above for that.

## What a signature means

A valid signature or matching checksum shows attribution and integrity: the file came from the stated release and arrived unchanged. It does not show that the software is correct or safe. Read the release notes before you run anything.
