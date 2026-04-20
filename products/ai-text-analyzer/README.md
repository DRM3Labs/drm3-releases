# AI Text Analyzer

`@drm3/ai-text-analyzer` — heuristic AI-generated-text detector. Zero LLM cost, deterministic scoring. Used inside the World News RAG ingestion pipeline to score article authenticity before signing.

**Latest:** `ai-text-analyzer-v1.1.0`

## Install

```bash
npm install @drm3/ai-text-analyzer
```

Or download the tarball from [the release](https://github.com/DRM3Labs/drm3-releases/releases/tag/ai-text-analyzer-v1.1.0) and install locally:

```bash
npm install ./drm3-ai-text-analyzer-1.1.0.tgz
```

## Quick start

```ts
import { analyze } from '@drm3/ai-text-analyzer';

const result = analyze('Some text to score.');
// { score: 0.73, signals: { repetition: 0.4, burstiness: 0.9, ... } }
```

## Verification

Each release ships a SHA256 checksum file and an Ed25519 provenance receipt signed by `drm3/releases/signer`. Public keys: [status.drm3.network/.well-known/drm3-keys.json](https://status.drm3.network/.well-known/drm3-keys.json).

## License

Proprietary. DRM3 Labs Corp.
