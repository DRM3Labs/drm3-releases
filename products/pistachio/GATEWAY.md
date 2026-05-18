# Deploy Your Own Pistachio Gateway

Host a Pistachio inference gateway using the official Docker image. Deploy on Fly.io, Google Cloud, AWS, DigitalOcean, Railway, or any platform that runs containers.

## What You Get

A hosted AI inference gateway connected to the Morpheus decentralized network. Your users authenticate with API keys. You control the wallet, the staking, and the capacity.

## Monthly Cost

| Service | What | Cost |
|---------|------|------|
| Fly.io (or similar) | 1 shared CPU, 1GB RAM | ~$5-7/mo |
| Alchemy RPC | Free tier (300M compute units) | $0 |
| Base gas | Session open/close txs | ~$0.30/mo |
| DRM3 Pass | Free tier (one per wallet) | $0 |
| **Total** | | **~$5-8/mo** |

## Prerequisites

- Docker image: `drm3/pistachio:latest`
- An Ethereum wallet private key (Base network)
- ETH on Base for gas (~$0.01 per session)
- Free [Alchemy](https://alchemy.com) account for Base RPC

## Deploy on Fly.io

### 1. Create a Fly App

```bash
fly apps create my-pistachio
```

### 2. Download `fly.toml`

Grab the template from the [releases repo](https://github.com/drm3labs/drm3-releases/blob/main/products/pistachio/fly.example.toml), or create one:

```toml
app = 'my-pistachio'
primary_region = 'iad'

[build]

[env]
  GATEWAY_MODE = "true"
  GATEWAY_REQUIRE_AUTH = "true"
  GATEWAY_INSTANCE = "my-gateway"

[http_service]
  internal_port = 19377
  force_https = true
  auto_stop_machines = 'off'
  auto_start_machines = true
  min_machines_running = 1
  processes = ['app']

[http_service.concurrency]
  type = 'connections'
  hard_limit = 100
  soft_limit = 70

[[http_service.checks]]
  grace_period = "60s"
  interval = "15s"
  method = "GET"
  timeout = "10s"
  path = "/inference/health"

[[vm]]
  memory = '1gb'
  cpu_kind = 'shared'
  cpus = 1
  memory_mb = 1024
```

### 4. Set Secrets

```bash
# Your wallet private key (Base network)
fly secrets set PISTACHIO_PRIVATE_KEY=0x... --app my-pistachio

# API key for your users (they send this as Bearer token)
fly secrets set GATEWAY_API_KEY=pst_$(openssl rand -hex 12) --app my-pistachio

# Base RPC endpoint (free Alchemy account: https://alchemy.com)
fly secrets set BASE_RPC_URLS=https://base-mainnet.g.alchemy.com/v2/YOUR_KEY --app my-pistachio
```

### 5. Deploy

```bash
fly deploy --image drm3/pistachio:latest
```

No source code needed. The Docker image contains everything.

## Deploy on Other Platforms

The same Docker image works anywhere:

```bash
# Docker (any host)
docker run -p 19377:19377 \
  -e GATEWAY_MODE=true \
  -e GATEWAY_REQUIRE_AUTH=true \
  -e PISTACHIO_PRIVATE_KEY=0x... \
  -e GATEWAY_API_KEY=pst_... \
  -e BASE_RPC_URLS=https://base-mainnet.g.alchemy.com/v2/YOUR_KEY \
  drm3/pistachio:latest

# Google Cloud Run
gcloud run deploy pistachio \
  --image drm3/pistachio:latest \
  --port 19377 \
  --set-env-vars "GATEWAY_MODE=true,GATEWAY_REQUIRE_AUTH=true"

# Railway / Render / DigitalOcean App Platform
# Paste the image URL: drm3/pistachio:latest
# Set env vars in the dashboard
```

### 6. Claim a DRM3 Pass

Your gateway wallet needs a DRM3 Pass NFT to stake sessions. On first visit, the dashboard will prompt you to claim one (free, costs ~$0.01 gas). Or claim via CLI:

```bash
pistachio claim-pass
```

### 7. Start Staking

Open your gateway dashboard, go to **Auto-Staker**, pick a template, and start. Sessions are staked automatically.

## Configuration Reference

### Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `PISTACHIO_PRIVATE_KEY` | Yes | Wallet private key (0x... hex) |
| `GATEWAY_API_KEY` | Yes | Bearer token for API access (pst_...) |
| `BASE_RPC_URLS` | Yes | Comma-separated Base RPC endpoints |
| `GATEWAY_MODE` | Yes | Set to `true` for hosted mode |
| `GATEWAY_REQUIRE_AUTH` | Yes | Set to `true` to require API keys |
| `GATEWAY_INSTANCE` | Optional | Instance label shown in UI banner |
| `GATEWAY_BASE_URL` | Optional | Base URL for OpenGraph tags |
| `ALLOWED_HOSTS` | Optional | Comma-separated allowed Host headers (blocks .fly.dev) |

### Auth Model

- **Browser users**: Enter API key on the login page (stored as 7-day session cookie)
- **API clients**: `Authorization: Bearer pst_...` header
- **Health endpoint**: Always public at `/inference/health`

### API Endpoints

```bash
# Chat (OpenAI-compatible)
curl https://my-pistachio.fly.dev/inference/v1/chat/completions \
  -H "Authorization: Bearer pst_YOUR_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"glm-4.7","messages":[{"role":"user","content":"Hello"}]}'

# Models
curl https://my-pistachio.fly.dev/inference/v1/models \
  -H "Authorization: Bearer pst_YOUR_KEY"

# Health (no auth)
curl https://my-pistachio.fly.dev/inference/health
```

### Custom Domain

To use a custom domain and block the `.fly.dev` URL:

1. Add a DNS record pointing to Fly
2. `fly certs add your.domain --app my-pistachio`
3. Set `ALLOWED_HOSTS=your.domain` in fly.toml
4. The `.fly.dev` URL will return 421 for all non-health requests

### Optional: Edge Auth

For additional browser protection, put Cloudflare Access or oauth2-proxy in front. API keys bypass edge auth for machine clients.

## Capacity Tiers

Your wallet needs a DRM3 Pass NFT to stake. Higher tiers = more capacity.

| Tier | Capacity | Cost |
|------|----------|------|
| Free | 20 MOR | Free (one per wallet) |
| Bronze | 200 MOR | 5 MOR |
| Silver | 1,000 MOR | 20 MOR |
| Gold | 5,000 MOR | 80 MOR |
| Diamond | 20,000 MOR | 250 MOR |

Mint passes directly from the Wallet page in your dashboard, or at [nft.drm3.xyz](https://nft.drm3.xyz).

## Support

- Documentation: [drm3.network/docs/pistachio](https://drm3.network/docs/pistachio)
- Issues: File a support ticket from the dashboard

---

Pistachio v0.20.0 — DRM3 Labs Corp.
