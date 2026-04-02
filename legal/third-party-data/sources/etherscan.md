# Etherscan — Data Agreement

## Provider
Etherscan.io (Etherscan Pte Ltd)

## URL
https://etherscan.io/

## Terms of Service URL
https://etherscan.io/terms

## License
API ToS (proprietary, tiered access)

## Data We Collect
Ethereum blockchain data via the Etherscan API including account balances, transaction history, token transfers, contract ABIs, gas prices, and block information. Also access to internal transactions and event logs.

## How We Use It
On-chain data signal in DRM3 products. Etherscan data provides Ethereum blockchain context including wallet activity, smart contract interactions, token movements, and gas market conditions. Used for blockchain-related enrichment and analysis.

## Commercial Use
Yes, with attribution. Etherscan's API terms permit commercial use of the data for display and analysis in applications. Cannot resell raw blockchain data obtained through their API as a competing data product.

## Redistribution
Limited. We may serve Etherscan-derived blockchain data as part of enriched data profiles. We should not build a product whose primary value is serving raw Ethereum blockchain data as a substitute for Etherscan. Note: the underlying blockchain data is public, but Etherscan's processed/indexed version has their value-add.

## Attribution Required
Yes. Etherscan requires attribution when displaying data sourced from their API. Must credit "Powered by Etherscan.io" or equivalent.

## Rate Limits
- Free tier: 5 calls per second, 100,000 calls per day
- Standard plan: higher limits per subscription tier
- API key required (free registration)
- Rate limit headers returned with responses

## Key Restrictions
- CANNOT resell or sublicense raw Etherscan API data
- CANNOT use data to build a competing blockchain explorer
- CANNOT scrape etherscan.io; must use the API
- CANNOT share API keys publicly or embed in client-side code
- Must provide attribution when displaying Etherscan-sourced data
- Free tier has strict rate limits that must be respected

## DRM3 Compliance Notes
Compliant. Our usage (blockchain data enrichment, displaying wallet and transaction context) is a standard use case. Important nuance: while Ethereum blockchain data is inherently public, Etherscan's indexed and processed version is their product. If we need higher throughput or want to avoid Etherscan dependency, we could run our own Ethereum node and index directly -- but that is a significant infrastructure investment. Current usage at free-tier limits is sustainable for our volume. Upgrade to a paid plan if we approach the 100K calls/day limit.

## Last Reviewed
2026-04-02
