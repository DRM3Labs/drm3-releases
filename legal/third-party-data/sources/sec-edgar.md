# SEC EDGAR — Data Agreement

## Provider
U.S. Securities and Exchange Commission (SEC)

## URL
https://www.sec.gov/edgar

## Terms of Service URL
https://www.sec.gov/privacy#security (general terms); https://www.sec.gov/os/accessing-edgar-data (EDGAR-specific access policy)

## License
Public Domain (US government data)

## Data We Collect
SEC filings including 10-K, 10-Q, 8-K, S-1, proxy statements, insider trading reports (Form 4), and company information via the EDGAR full-text search API and XBRL APIs. Also access company facts, submissions history, and filing indexes.

## How We Use It
Financial and corporate signal in DRM3 products. SEC filings provide corporate disclosure data used for company analysis, regulatory event tracking, and financial data enrichment.

## Commercial Use
Yes. Public domain data with no restrictions on commercial use.

## Redistribution
Yes. Public domain data may be freely redistributed in any form.

## Attribution Required
No. Public domain data has no enforceable attribution requirement. Best practice: cite "SEC EDGAR" as the data source.

## Rate Limits
- No API key required
- MUST include a User-Agent header with company name and contact email (e.g., `DRM3 Labs admin@drm3.network`)
- 10 requests per second maximum
- SEC will block IPs that exceed rate limits or fail to identify themselves

## Key Restrictions
- MUST include identifying User-Agent header on all requests -- SEC actively blocks anonymous or generic user agents
- Do not crawl the full EDGAR archive without coordinating with SEC (use bulk data downloads instead)
- Do not access EDGAR for the purpose of overloading the system
- Filing data may be delayed; do not represent it as real-time

## DRM3 Compliance Notes
Fully compliant. US government data is public domain. The key operational requirement is the User-Agent header -- SEC enforces this and will block our IP if we fail to include it. Our implementation must set a proper User-Agent with DRM3 contact information on every request. No legal risks identified.

## Last Reviewed
2026-04-02
