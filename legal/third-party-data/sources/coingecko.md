# CoinGecko — Data Agreement

## Provider
Gecko Labs Pte. Ltd.

## URL
https://www.coingecko.com/

## Terms of Service URL
https://www.coingecko.com/en/terms

## License
API ToS (proprietary, tiered access)

## Data We Collect
Cryptocurrency market data including prices, market cap, 24h volume, circulating supply, and historical price data via the CoinGecko API v3 (`/api/v3/coins/markets`, `/api/v3/simple/price`).

## How We Use It
Display crypto market data within DRM3 products. Used as one of multiple price sources in aggregated, provenance-signed market signals.

## Commercial Use
Limited. Free tier (Demo API) permits display in applications but explicitly prohibits commercial redistribution of raw price data. CoinGecko Pro/Enterprise plans unlock commercial redistribution rights. Our current usage is on the free tier.

## Redistribution
No raw redistribution on the free tier. CoinGecko's ToS for the free API prohibit serving their raw data to third parties. Derived/aggregated data that blends CoinGecko with other sources and adds provenance metadata is a gray area -- it is transformative but still incorporates their data. If our signal products gain traction, we should evaluate upgrading to a paid plan that explicitly permits redistribution.

## Attribution Required
Yes. CoinGecko requires "Powered by CoinGecko" attribution with a link back to coingecko.com wherever their data is displayed.

## Rate Limits
- Free tier (Demo API): 10-30 calls/minute depending on endpoint
- Pro tier: higher limits based on plan
- 429 responses with Retry-After header when exceeded

## Key Restrictions
- Free tier: cannot commercially redistribute raw price data
- Cannot use data to build a competing market data aggregator
- Cannot scrape the website; must use the API
- Cannot remove or obscure CoinGecko attribution
- Cannot store and serve historical data as a substitute for their API

## DRM3 Compliance Notes
RISK FLAG: Our aggregated provenance-signed signals incorporate CoinGecko price data as one input among several. While the output is transformative (multi-source, signed, enriched), CoinGecko's free-tier ToS are strict about commercial redistribution. Two mitigations: (1) we never serve raw CoinGecko data -- always blended/derived, (2) if signal products become revenue-generating, upgrade to CoinGecko Pro which explicitly allows commercial use. Monitor their ToS updates closely.

## Last Reviewed
2026-04-02
