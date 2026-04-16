# Privacy Policy — Pistachio

**DRM3 Labs Corp. · Last updated: March 28, 2026**

Pistachio is a peer-to-peer inference client for the Morpheus network. It runs locally on your machine.

This policy supplements the [general DRM3 Privacy Policy](../PRIVACY.md).

## Data Practices

Pistachio connects directly to AI providers on the Morpheus network. Your prompts and responses travel peer-to-peer — DRM3 Labs Corp. never sees, stores, or processes your inference data. Session staking transactions occur on Base mainnet and are publicly visible on-chain.

## Network Telemetry

Pistachio transmits the following data to DRM3 infrastructure (Cashew) with API requests:

- **Wallet address** — your Base mainnet address (already publicly visible on-chain)
- **Install identity** — an Ed25519 public key auto-generated per install (not linked to personal identity)
- **Version** — the Pistachio software version you are running
- **Staking events** — when you stake or unstake MOR for inference sessions (session ID, model, amount — all publicly visible on-chain)

This data is used for network monitoring, product improvement, and usage analytics.

## What We Don't Collect

- No personal information (name, email, IP address)
- No inference prompts or responses
- No browsing history or cookies
- No analytics or tracking scripts
- No JWT tokens or session content

---

[General Privacy Policy](../PRIVACY.md) · [Terms of Use](TERMS.md) · support@drm3.io
