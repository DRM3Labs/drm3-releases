# Provenance Guide

How to sign data with drm3-provenance. From single rows to Merkle-rolled batches.

---

## What is attested provenance

Every data operation in DRM3 produces an attestation: a cryptographically signed receipt that states what was done, what data went in, what came out, and when. The receipt is signed with Ed25519, chained to every receipt before and after it, and travels with the data. Any downstream party can confirm which key signed each link, and that no link has changed since it was written.

---

## Three Granularity Levels

Not everything needs the same level of proof. Choose the level that fits the context.

### Row-level

A signed receipt on every individual data point. Maximum auditability.

```typescript
const receipt = Receipt.create('data.fetch.row')
  .inputs({ entity_key: 'AAPL', fetched_at: timestamp })
  .outputs({ ...rowData, _meta: meta })
  .metadata(meta)
  .sign(keypair);
```

Use for: internal audits, compliance checks, forensic analysis, high-value data.

### Session-level (Merkle rollup)

Individual row receipts roll into a Merkle tree. One root hash covers the entire batch.

```typescript
import { MerkleChain } from './wasm/drm3_provenance.js';

const chain = new MerkleChain();
for (const rowReceipt of rowReceipts) {
  chain.add(rowReceipt);
}

const batchReceipt = Receipt.create('data.fetch.batch')
  .inputs({ source: 'nasdaq', row_count: rowReceipts.length })
  .outputs({ merkle_root: chain.merkleRoot(), _meta: meta })
  .metadata(meta)
  .sign(keypair);
```

Use for: pipeline runs, periodic ingests, bulk processing. Batch-level proof without per-row overhead.

### Service-level

A single receipt covers all sessions for a product. External consumers get one verifiable root.

```typescript
const serviceReceipt = Receipt.create('service.attest')
  .inputs({ service: 'connor', period: '2026-04-13', session_count: 288 })
  .outputs({ merkle_root: dailyRoot, _meta: meta })
  .metadata(meta)
  .sign(keypair);
```

Use for: external APIs, public dashboards, downstream consumers who need proof without internal detail.

Fine-grained internally. Coarser-grained at the boundary. The chain is the same. The granularity is the choice.

---

## Getting a Signing Key

Every signer starts with a BIP39 mnemonic (24 words). From the mnemonic, derive deterministic Ed25519 keypairs for each purpose.

```typescript
import { Keyring } from './wasm/drm3_provenance.js';

// One mnemonic per product or organization
const keyring = Keyring.fromMnemonic(process.env.MY_MNEMONIC);

// Derive purpose-specific keys
const scannerKey = keyring.derive('myorg/scanner');
const enrichKey  = keyring.derive('myorg/enrichment');
const releaseKey = keyring.derive('myorg/releases');
```

**Derivation path conventions:**
- `{org}/{purpose}` for top-level keys
- `{org}/{product}/{plane}` for per-plane signing (e.g., `connor/whois`, `connor/dnssec`)
- `{org}/releases/signer` for release binary signing

**Key storage:**
- Store the mnemonic as a secret (env var, Cloudflare Worker secret, vault)
- Never commit mnemonics to source control
- The test mnemonic (`abandon abandon abandon ... about`) is for development only

**Publishing your public key:**
- Extract the public key from any derived keypair: `keypair.publicKey()`
- Publish at a well-known URL so verifiers can check signatures
- DRM3 publishes at `https://status.drm3.network/.well-known/drm3-keys.json`

---

## The Receipt API

### ReceiptBuilder

```typescript
const receipt = Receipt.create('action.name')    // action: what was done
  .inputs({ ... })                                // inputs: what went in (hashed)
  .outputs({ ..., _meta: meta })                  // outputs: what came out (hashed)
  .metadata(meta)                                 // metadata: stored in receipt envelope
  .parent(parentReceiptId)                         // optional: chain to parent
  .cost(amount, unit, tier)                        // optional: cost tracking
  .durationMs(BigInt(496))                         // optional: execution time
  .sign(keypair);                                  // sign and produce receipt
```

### Receipt Accessors

```typescript
receipt.id()          // "rcpt_a1b2c3d4e5f6a7b8"
receipt.action()      // "data.fetch"
receipt.timestamp()   // "2026-04-13T00:00:00Z"
receipt.inputHash()   // SHA-256 of canonical inputs
receipt.outputHash()  // SHA-256 of canonical outputs
receipt.publicKey()   // Ed25519 public key (prefixed)
receipt.signature()   // Ed25519 signature (prefixed)
receipt.metadata()    // metadata object or null
receipt.verify()      // true if signature valid
receipt.hash()        // receipt hash for Merkle trees
receipt.toJson()      // serialize to JSON
```

### Deserialization

```typescript
const restored = Receipt.fromJson(json);
console.log(restored.verify()); // true
```

---

## The `_meta` Attestation Pattern

Every receipt should include `_meta` inside `.outputs()`. The `_meta` is the attestation: it describes what was fetched, from where, when, and a human-readable attestation statement. Because `_meta` is inside outputs, the `output_hash` cryptographically binds the data to its attestation in one signed payload.

Also pass the same object to `.metadata()` so it is stored in the receipt envelope and retrievable via `receipt.metadata()`.

```typescript
const meta = {
  protocol: 'drm3-provenance-v1',
  service: 'my-service',
  signer: 'myorg/scanner',
  version: '1.0.0',
  content_uri: 'https://my-service.example.com/provenance/...',
  timestamp: '2026-04-13T00:00:00Z',
  vendor: 'example-api',
  vendor_uri: 'https://api.example.com',
  attestation: 'MyOrg attests this data was observed at 2026-04-13T00:00:00Z.',
};
```

**Required fields:**

| Field | Description |
|-------|-------------|
| `protocol` | Always `drm3-provenance-v1` |
| `service` | Product or service name |
| `signer` | Derivation path of the signing key |
| `version` | Service version |
| `timestamp` | ISO 8601 when the operation occurred |
| `attestation` | Human-readable attestation statement |

**Recommended fields:**

| Field | Description |
|-------|-------------|
| `content_uri` | URL where the receipt chain can be verified |
| `vendor` | Upstream data source identifier |
| `vendor_uri` | Upstream API URL |
| `response_status` | HTTP status from upstream |
| `bytes_out` | Response payload size |
| `duration_ms` | Fetch/processing time |
| `data_license` | URL to the data license in effect |

**Why `_meta` in outputs AND `.metadata()`?**
- `output_hash` = SHA-256 of canonical outputs (data + `_meta`). This cryptographically binds the attestation to the data.
- `.metadata()` stores it in the receipt envelope for direct retrieval without reconstructing outputs.

---

## Receipt Chaining

Every receipt can link to a parent, forming a provenance DAG.

```
Raw fetch  ->  Receipt A (genesis)
                 ^
Analysis   ->  Receipt B (parent: A)
                 ^
Report     ->  Receipt C (parent: B)
```

```typescript
// Parent receipt from raw data fetch
const fetchReceipt = Receipt.create('data.fetch')
  .inputs({ source: 'example.com' })
  .outputs({ row_count: 100, _meta: fetchMeta })
  .metadata(fetchMeta)
  .sign(fetchKey);

// Child receipt from analysis
const analysisReceipt = Receipt.create('data.analyze')
  .inputs({ source_receipt: fetchReceipt.id() })
  .outputs({ sentiment: 0.7, _meta: analysisMeta })
  .metadata(analysisMeta)
  .parent(fetchReceipt.id())
  .sign(analysisKey);
```

Walk the chain from any output back to the raw source.

---

## How DRM3 Signs

DRM3 Labs operates the signing infrastructure for its products. 30 active signing keys, all derived from a single root mnemonic.

**Derivation paths in production:**

| Product | Path | What it signs |
|---------|------|---------------|
| Connor scanner | `connor/worker` | DNS scans via DoH |
| Connor enrichment | `connor/{plane}` | WHOIS, ASN, robots.txt, DNSSEC |
| Open Signals | `signals-3p/{source}` | Government and public data fetches |
| Cashew | `cashew/cache` | Morpheus blockchain cache responses |
| RunsWith | `runswith/analyst` | Service fingerprinting and migration detection |
| Release signer | `drm3/releases/signer` | Binary releases |

Every key is independently verifiable. The public keys are published at `https://status.drm3.network/.well-known/drm3-keys.json`.

---

## Verify Any Receipt Yourself

The point of attested provenance: the signer is named on every receipt, permanently, and anyone can check that name and the unaltered payload for themselves.

```typescript
// Download a receipt from any DRM3 API
const receipt = Receipt.fromJson(receiptJson);

// Verify the signature is valid
if (!receipt.verify()) throw new Error('Invalid signature');

// Check the public key matches a known signer
const knownKeys = await fetch('https://status.drm3.network/.well-known/drm3-keys.json').then(r => r.json());
const signerKey = receipt.publicKey();
if (!knownKeys.includes(signerKey)) throw new Error('Unknown signer');

// The data is authentic. The attestation is bound to the data by output_hash.
```
