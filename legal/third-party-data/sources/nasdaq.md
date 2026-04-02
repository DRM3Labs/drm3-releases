# NASDAQ Listed Companies — Data Agreement

## Provider
Nasdaq, Inc.

## URL
https://www.nasdaqtrader.com/

## Terms of Service URL
https://www.nasdaqtrader.com/Trader.aspx?id=dpolicyagreement

## License
Proprietary (Nasdaq Data Policy Agreement)

## Data We Collect
NASDAQ-listed company data including ticker symbols, company names, market category, listing status, and sector classification. Downloaded from the public nasdaqtrader.com FTP/HTTP endpoints (symboldirectory files).

## How We Use It
Financial entity reference data in DRM3 products. NASDAQ listed company data provides ticker-to-company mapping, market classification, and listing status for financial data enrichment and entity resolution.

## Commercial Use
Limited. The free data files from nasdaqtrader.com are intended for informational purposes. Derived use (using the data to enrich other datasets, map tickers to companies) is permissible. Building a product whose primary value is the NASDAQ company listing data itself is not.

## Redistribution
Restricted. Cannot redistribute the raw NASDAQ data feed as a standalone product. May include NASDAQ-derived company information (ticker, name, sector) as part of enriched data profiles that add substantial value beyond the raw listing data.

## Attribution Required
No formal attribution requirement for the free data files, but best practice: cite "Data from Nasdaq" when displaying listing information.

## Rate Limits
- No API key required for public data files
- Data files are static downloads (updated daily)
- No rate limits on file downloads, but one download per day is sufficient

## Key Restrictions
- Cannot redistribute raw NASDAQ data feeds as a standalone data product
- Cannot use data to create a competing securities listing service
- Data is provided "as is" with no guarantee of accuracy or timeliness
- Real-time market data (quotes, trades) requires a separate paid data agreement -- we use only the free listing reference data

## DRM3 Compliance Notes
Compliant. We use only the free company listing reference data (symbols, names, sectors), not real-time market data which requires an expensive data license. Our usage is standard: ticker-to-company mapping for enrichment. We do not redistribute the raw listing file. The distinction between free reference data and paid market data is critical -- never expand our NASDAQ data collection to include real-time quotes without securing a market data agreement.

## Last Reviewed
2026-04-02
