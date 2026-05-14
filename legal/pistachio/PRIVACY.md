# Privacy Policy — Pistachio

**DRM3 Labs Corp. · Last updated: May 14, 2026**

Pistachio is a peer-to-peer inference client for the Morpheus network. It runs locally on your machine.

This policy supplements the [general DRM3 Privacy Policy](../PRIVACY.md).

## Local Data Storage

Pistachio stores the following data on your device:

| Data | Location | Purpose |
|------|----------|---------|
| Private key | `~/.pistachio/config.toml` (chmod 600) | Transaction signing, identity |
| RPC endpoint | `~/.pistachio/config.toml` | Blockchain connectivity |
| Session cache | `~/.pistachio/known_closed_sessions.json` | Faster startup |
| Settings | `~/.pistachio/pistachio.db` (SQLite) | RPC config, templates, preferences |
| API keys | `~/.pistachio/keys.db` (SQLite) | Gateway mode key management |

**Your private key never leaves your device.** It is stored with restricted file permissions and is never transmitted to DRM3 or any third party.

## Inference Data

Your prompts and AI responses travel **peer-to-peer** between your machine and providers on the Morpheus network. DRM3 Labs Corp. never sees, stores, or processes your inference data. We have no access to what you ask or what providers respond.

## Network Telemetry

When Pistachio communicates with DRM3 infrastructure (the DRM3 Explorer), the following data is included:

- **Wallet address** — your Base mainnet address (publicly visible on-chain)
- **Install identity** — an Ed25519 public key auto-generated per install (not linked to personal identity)
- **Software version** — the Pistachio version you are running

This data is used for network monitoring, pass capacity verification, and product improvement.

## Blockchain Data

Staking transactions (session open, close, amounts) occur on Base mainnet and are **publicly visible on-chain**. This is inherent to blockchain technology. DRM3 Labs Corp. does not control or collect this data — it exists on the public ledger.

## RPC Provider

Pistachio sends blockchain queries (reading sessions, balances, marketplace data) to the RPC endpoint you configure (e.g., Alchemy). Your RPC provider may log your IP address and request data according to their own privacy policy. DRM3 Labs Corp. does not control third-party RPC providers.

## What We Don't Collect

- No personal information (name, email, phone, IP address)
- No inference prompts or responses
- No private keys or wallet credentials
- No browsing history or cookies
- No analytics or tracking scripts
- No device identifiers beyond the install-specific Ed25519 key

## Data Deletion

To remove all local Pistachio data:

```
pistachio uninstall
```

Or manually delete `~/.pistachio/`. DRM3 does not retain any data that requires server-side deletion because we do not collect personal data.

---

[General Privacy Policy](../PRIVACY.md) · [Terms of Use](TERMS.md) · legal@drm3.io
