# Terms of Use — Pistachio Pass NFTs

**DRM3 Labs Corp. · Last updated: March 23, 2026**

Pistachio Passes (PSTC) are ERC-721 NFTs on Base mainnet that control inference stake capacity.

These terms supplement the [general DRM3 Terms of Use](../TERMS.md).

## Capacity Tiers

Claiming the free Starter pass grants a baseline of 20 MOR inference capacity. Paid passes increase capacity beyond the baseline.

| Tier | Capacity | Price | Supply |
|------|----------|-------|--------|
| Starter (free) | 20 MOR | Free | Unlimited |
| Bronze | +200 MOR | 5 MOR | 200 |
| Silver | +1,000 MOR | 20 MOR | 200 |
| Gold | +5,000 MOR | 80 MOR | 100 |
| Diamond | +20,000 MOR | 250 MOR | 50 |

## Capacity Stacking Rules

**Paid passes stack.** A wallet holding a Bronze and a Silver pass receives 200 + 1,000 = 1,200 MOR capacity on top of the 20 MOR baseline.

**The free Starter Pass does not stack.** Regardless of how many Starter Passes a wallet holds — whether minted or received via transfer — the free tier capacity is counted once per wallet: 20 MOR. Acquiring multiple Starter Passes does not increase capacity beyond the single 20 MOR baseline.

This is enforced at the API layer. The contract permits standard ERC-721 transfers, but the capacity calculation recognizes only one free-tier allocation per wallet.

## Product-Specific Terms

NFTs are non-refundable once minted. A 3% royalty (ERC-2981) applies to all secondary sales. Passes carry no equity, governance, or dividend rights — they are functional utility tokens for inference capacity only. MOR payments go directly to the DRM3 treasury wallet, not through an intermediary.

## Alpha Software

Pistachio Pass is alpha software under active development.

## No Warranty

Pistachio Pass is provided "as is" without warranty of any kind.

---

[General Terms](../TERMS.md) · [Privacy Policy](PRIVACY.md) · support@drm3.io
