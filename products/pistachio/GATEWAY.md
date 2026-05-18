# Deploy Your Own Pistachio Gateway

Host a Pistachio inference gateway on Fly.io (or any platform). One binary, one wallet, one command.

## What You Get

A hosted AI inference gateway connected to the Morpheus decentralized network. Your users authenticate with API keys. You control the wallet, the staking, and the capacity.

## Prerequisites

- [Fly.io](https://fly.io) account (free tier works)
- An Ethereum wallet with MOR tokens on Base
- ETH on Base for gas (~$0.01 per session open/close)

## Quick Start

### 1. Install Pistachio

```bash
brew tap drm3labs/drm3
brew install pistachio
```

Or download from [GitHub Releases](https://github.com/drm3labs/drm3-releases/releases).

### 2. Create a Fly App

```bash
fly apps create my-pistachio
```

### 3. Create `fly.toml`

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
fly deploy
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
