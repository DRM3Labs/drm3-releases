# Health Contract

`@drm3/health-contract` — the single canonical, strongly-typed definition of every DRM3 product's `GET /health`. One Zod schema imported by both ends: `validateHealth()` (the status monitor — a wrong shape is a loud, field-named `degraded`, never a silent `undefined`→0) and `buildHealth()` (each product — throws if it would ship a drifted shape). Not a product — the health-reporting substrate.

**Latest:** `health-contract-v0.2.0`

## Install

```bash
npm install https://github.com/DRM3Labs/drm3-releases/releases/download/health-contract-v0.2.0/drm3-health-contract-0.2.0.tgz
```

## Use

```ts
// Consumer (status monitor)
import { validateHealth } from '@drm3/health-contract';
const v = validateHealth(sku, await resp.json());
if (!v.ok) markDegraded(v.error);   // names the offending field

// Producer (each product's /health)
import { buildHealth } from '@drm3/health-contract';
return Response.json(buildHealth({ sku: 'connor', status: 'ok', metrics: { domainsTracked, snapshotsTotal, scanRate } }));
```

Source: `DRM3Labs/drm3-health-contract`.
