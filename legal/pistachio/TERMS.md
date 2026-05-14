# Terms of Use — Pistachio

**DRM3 Labs Corp. · Last updated: May 14, 2026**

These terms supplement the [general DRM3 Terms of Use](../TERMS.md). In the event of conflict, these product-specific terms govern for Pistachio.

## What Pistachio Is

Pistachio is a **peer-to-peer inference client** for the Morpheus decentralized AI network. It runs locally on your machine and connects directly to AI providers. **Pistachio is not a wallet, exchange, custody service, or financial product.**

## Non-Custodial Architecture

Pistachio is non-custodial software. Your private key is stored exclusively on your local device at `~/.pistachio/config.toml` with restricted file permissions. DRM3 Labs Corp.:

- Never receives, transmits, or stores your private key
- Never has access to your private key at any time
- Has no ability to recover a lost private key
- Has no ability to reverse or modify transactions you initiate
- Has no control over your digital assets

**You are solely responsible for securing your private key and seed phrase.** If your key is lost, stolen, or compromised, any digital assets controlled by that key may be permanently lost. DRM3 Labs Corp. has no ability to help you recover them.

## What Your Private Key Is Used For

Pistachio uses your private key exclusively for:

- **Signing staking transactions** — opening and closing MOR inference sessions on Base
- **Signing inference requests** — authenticating your identity to AI providers
- **Deriving your wallet address** — displaying your balances and session history

Your key is never used for any other purpose and never leaves your device.

## Staking and Digital Assets

When you stake MOR tokens through Pistachio, your tokens are locked in the Morpheus SessionRouter smart contract on Base mainnet. This is a third-party contract not developed or controlled by DRM3 Labs Corp. Staked MOR is returned to your wallet when sessions are closed, subject to the contract's rules.

DRM3 Labs Corp. is not responsible for:

- Smart contract bugs or unexpected behavior in the Morpheus protocol
- Changes to the Morpheus protocol, staking rules, or token economics
- Loss of staked tokens due to contract upgrades, exploits, or network issues
- Gas costs for staking, closing, or failed transactions
- Provider downtime, quality, or availability on the Morpheus network

## Inference Data

Your prompts and AI responses travel peer-to-peer between your machine and providers on the Morpheus network. DRM3 Labs Corp. **never sees, stores, processes, or has access to your inference data**. Providers are independent third parties; DRM3 Labs Corp. does not control, endorse, or take responsibility for provider behavior, output quality, or data handling.

## Closed Source Software

Pistachio is proprietary closed-source software. You may not reverse engineer, decompile, or disassemble any part of Pistachio except as required by applicable law.

## Alpha Software

Pistachio is alpha software under active development. It may contain bugs that could affect staking transactions, session management, or key handling. **Use at your own risk.** DRM3 Labs Corp. recommends:

- Do not stake more MOR than you can afford to lose
- Keep your private key backed up securely
- Verify transaction details before confirming
- Start with small stakes to familiarize yourself with the system

## Network Dependency

Pistachio requires a Base RPC endpoint to function. Performance and reliability depend on your RPC provider, network conditions, and provider availability. DRM3 Labs Corp. does not guarantee that sessions will remain active, that providers will be available, or that inference will succeed.

## No Financial Advice

Nothing in Pistachio or any DRM3 communication constitutes financial, investment, legal, or tax advice. MOR tokens and other digital assets are volatile and speculative. You should consult qualified professionals before making financial decisions.

---

[General Terms](../TERMS.md) · [Privacy Policy](PRIVACY.md) · legal@drm3.io
