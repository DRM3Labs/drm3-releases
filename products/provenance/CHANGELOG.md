# Changelog

## v0.4.1 (2026-05-29)

- Hard-fail on missing mnemonic (no silent null signatures)
- Cross-compilation for Linux targets
- Unicode NFC normalization in canonical JSON for deterministic hashing
- BatchSigner / BatchResult API for row-level provenance signing
- Browser verification module (zero-dependency, Web Crypto)
- 93.1% test coverage (up from 85.6%)

## v0.4.0

- BatchSigner WASM and Elixir NIF bindings
- ServiceProvider registry concept with SQL schemas and Rust types

## v0.3.2

- Rebuilt WASM with BatchSigner/BatchResult exports
- Service-level attestation schema (Phase 4B)

## v0.3.1

- pkg-web WASM rebuild with updated bindings

## v0.3.0

- Canonical receipt metadata (`_meta`) with `content_uri` and vendor context
- Release pipeline for WASM tarballs, static libs, and provenance signing

## v0.2.0 (2026-04-13)

First published release of drm3-provenance bindings.

- WASM bindings for Cloudflare Workers (`pkg-web`), Node.js (`pkg-node`), and bundlers (`pkg-bundler`)
- Rust static libraries for macOS (arm64, x86_64)
- Ed25519 receipt signing with BIP39 key derivation
- Merkle chain rollups for batch attestation
- Receipt chaining via parent links
- `.metadata()` API for attestation context in receipt envelope
- All release artifacts signed with provenance receipts
