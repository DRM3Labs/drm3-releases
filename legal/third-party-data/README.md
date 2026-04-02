# Third-Party Data Sources — License & Usage Agreements

> Every external data source DRM3 ingests must have its terms documented here. No exceptions.

## Why This Exists

DRM3 products ingest data from 25+ external sources. Before we surface, redistribute, or commercially use any of this data, we need to know:

1. **Can we store it?** (caching, archival)
2. **Can we display it?** (in our UI, to authenticated users)
3. **Can we redistribute it?** (via API, to our customers)
4. **Can we use it commercially?** (as part of a paid product)
5. **Attribution required?** (must we credit the source?)
6. **Rate limits?** (what are the API/download constraints?)

## Source Registry

| Source | Provider | License | Commercial OK | Attribution | Status |
|--------|----------|---------|---------------|-------------|--------|
| [Binance](sources/binance.md) | Binance | API ToS | Yes (display) | Yes | Reviewed |
| [CoinGecko](sources/coingecko.md) | CoinGecko | Free API ToS | Limited | Yes | Reviewed |
| [Tranco](sources/tranco.md) | Tranco List (research) | Apache 2.0 | Yes | Yes (cite paper) | Reviewed |
| [Majestic](sources/majestic.md) | Majestic | Free download ToS | Yes (with attribution) | Yes | Reviewed |
| [Cisco Umbrella](sources/umbrella.md) | Cisco/OpenDNS | Free download | Yes | Yes | Reviewed |
| [Google Safe Browsing](sources/safe-browsing.md) | Google | API ToS | Yes (display) | Yes | Reviewed |
| [Mozilla Observatory](sources/mozilla-observatory.md) | Mozilla | MPL 2.0 | Yes | Yes | Reviewed |
| [FRED](sources/fred.md) | Federal Reserve | Public domain | Yes | Requested | Reviewed |
| [Congress.gov](sources/congress.md) | Library of Congress | Public domain | Yes | No | Reviewed |
| [Federal Register](sources/federal-register.md) | GPO | Public domain | Yes | No | Reviewed |
| [GovInfo](sources/govinfo.md) | GPO | Public domain | Yes | No | Reviewed |
| [SEC EDGAR](sources/sec-edgar.md) | SEC | Public domain | Yes | No | Reviewed |
| [Census](sources/census.md) | Census Bureau | Public domain | Yes | No | Reviewed |
| [FDIC](sources/fdic.md) | FDIC | Public domain | Yes | No | Reviewed |
| [GSA .gov](sources/gsa-gov.md) | CISA/GSA | Public domain | Yes | No | Reviewed |
| [Open-Meteo](sources/open-meteo.md) | Open-Meteo | CC BY 4.0 | Yes | Yes | Reviewed |
| [USGS Water](sources/usgs-water.md) | USGS | Public domain | Yes | No | Reviewed |
| [USGS Earthquakes](sources/usgs-earthquakes.md) | USGS | Public domain | Yes | No | Reviewed |
| [Reddit](sources/reddit.md) | Reddit | API ToS | Limited | Yes | Reviewed |
| [GDELT](sources/gdelt.md) | GDELT Project | Open, free | Yes | Yes | Reviewed |
| [GitHub Activity](sources/github-activity.md) | GitHub | API ToS | Yes (display) | Yes | Reviewed |
| [Google Search](sources/google-search.md) | Google | API ToS | Yes (display) | Yes | Reviewed |
| [NASDAQ](sources/nasdaq.md) | NASDAQ | Free data files | Yes (derived) | No | Reviewed |
| [Polymarket](sources/polymarket.md) | Polymarket | API ToS | Yes (display) | Yes | Reviewed |
| [Etherscan](sources/etherscan.md) | Etherscan | API ToS | Limited | Yes | Reviewed |

## Key Findings

### Fully Open (no restrictions)
US Government sources (FRED, Congress, Federal Register, GovInfo, SEC EDGAR, Census, FDIC, USGS, GSA) are all **public domain**. No attribution required. Unlimited commercial use.

### Open with Attribution
Tranco (Apache 2.0, cite the paper), Open-Meteo (CC BY 4.0), GDELT (cite project), Majestic (attribute), Umbrella (attribute).

### Commercial Use with Conditions
Binance, CoinGecko, Reddit, GitHub, Google Search, Polymarket, Etherscan — all allow display in products but restrict bulk redistribution of raw data. We should display derived/aggregated data, not raw dumps.

### Key Risks
- **CoinGecko**: Free tier prohibits commercial redistribution of raw price data. Our use (aggregated signals, provenance-signed) is likely OK but borderline.
- **Reddit**: New API terms (2023+) restrict commercial use without a paid agreement. Our use (public posts, aggregated) may need review.
- **Etherscan**: Free tier rate limits and ToS restrict commercial redistribution. We store derived data only.

## Process

When adding a new data source:
1. Read the provider's ToS/API terms
2. Create a file in `sources/{name}.md`
3. Document: license, commercial use, attribution, rate limits, key restrictions
4. Include the URL to the actual terms page
5. Add to the table above
6. Get Rob's sign-off before the fetcher goes live
