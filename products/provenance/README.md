# DRM3 Provenance

`drm3-provenance` — cryptographic proof of work for the AI age. Ed25519 attestation receipts, Merkle rollups, and trust aggregation.

**Latest:** `provenance-v0.4.1`

Every data operation produces a signed receipt. The receipt travels with the data. Anyone downstream can verify it without trusting anyone in the chain.

---

## Install

### Cloudflare Workers (WASM)

Download the `pkg-web` tarball from the latest release:

```bash
curl -fsSL https://github.com/drm3labs/drm3-releases/releases/download/provenance-v0.4.1/drm3-provenance-wasm-web-v0.4.1.tar.gz | tar xz
```

Copy `pkg-web/` contents into your worker's `src/wasm/` directory.

Add the CompiledWasm rule to `wrangler.toml`:

```toml
[[rules]]
type = "CompiledWasm"
globs = ["**/*.wasm"]
fallthrough = false
```

### Node.js / CLI

Download the `pkg-node` tarball:

```bash
curl -fsSL https://github.com/drm3labs/drm3-releases/releases/download/provenance-v0.4.1/drm3-provenance-wasm-node-v0.4.1.tar.gz | tar xz
```

### Rust (crate)

Add to `Cargo.toml`:

```toml
[dependencies]
drm3-provenance = { path = "../drm3-provenance/crates/provenance" }
```

---

## Quick Start

```typescript
import wasmModule from './wasm/drm3_provenance_bg.wasm';
import { initSync, Keyring, Receipt } from './wasm/drm3_provenance.js';

// Initialize WASM (once, before any other call)
initSync({ module: wasmModule });

// Derive signing key from BIP39 mnemonic
const keyring = Keyring.fromMnemonic(mnemonic);
const keypair = keyring.derive('myservice/scanner');

// Sign work
const receipt = Receipt.create('data.fetch')
  .inputs({ source: 'example.com', fetched_at: '2026-04-13T00:00:00Z' })
  .outputs({ row_count: 1500, output_hash: 'sha256:abc...', _meta: meta })
  .metadata(meta)
  .sign(keypair);

// Verify
receipt.verify(); // true

// Serialize
const json = receipt.toJson();
const restored = Receipt.fromJson(json);
```

See [GUIDE.md](./GUIDE.md) for granularity levels, best practices, and complete examples.

---

## Platform Targets

| Target | Directory | Use Case |
|--------|-----------|----------|
| `pkg-web` | CF Workers | Has `initSync`. Use this for Cloudflare Workers. |
| `pkg-node` | Node.js / CLI | CommonJS. For serverless functions and CLI tools. |
| `pkg-bundler` | Webpack / esbuild | Auto-init. Do NOT use for CF Workers. |

## Verification

Every release artifact ships with a `.receipt.json` file signed by the DRM3 release signer. Download the receipt alongside the artifact and verify:

```typescript
const receipt = Receipt.fromJson(receiptJson);
console.log(receipt.verify()); // true — signature is valid
console.log(receipt.metadata()); // release metadata (product, version, sha256)
```

## License

Proprietary. DRM3 Labs Corp.
