# Changelog

## v0.2.0 (2026-04-13)

First published release of drm3-provenance bindings.

- WASM bindings for Cloudflare Workers (`pkg-web`), Node.js (`pkg-node`), and bundlers (`pkg-bundler`)
- Rust static libraries for macOS (arm64, x86_64)
- Ed25519 receipt signing with BIP39 key derivation
- Merkle chain rollups for batch attestation
- Receipt chaining via parent links
- `.metadata()` API for attestation context in receipt envelope
- All release artifacts signed with provenance receipts
