# Google Custom Search — Data Agreement

## Provider
Google LLC

## URL
https://developers.google.com/custom-search/

## Terms of Service URL
https://developers.google.com/custom-search/v1/terms

## License
API ToS (Google APIs Terms of Service + Custom Search-specific terms)

## Data We Collect
Web search results including titles, URLs, snippets, and metadata via the Google Custom Search JSON API. Used for search-based signal enrichment and web presence analysis.

## How We Use It
Web presence and discoverability signal in DRM3 products. Google Search results provide context on how entities appear in web search, including ranking position, snippet content, and related results.

## Commercial Use
Yes, with strict conditions. Google Custom Search API may be used in commercial applications, but usage must comply with Google's display requirements and caching restrictions.

## Redistribution
Heavily restricted. Google's terms impose strict conditions on how search results may be displayed and stored:
- Results must be displayed in a manner consistent with Google's requirements
- Cannot cache search results for more than 24 hours
- Cannot aggregate results with other search engine results
- Cannot serve cached/stored Google search results via our API beyond the 24-hour window

## Attribution Required
Yes. Must display Google branding when showing search results. Specific branding requirements are documented in the Custom Search API terms.

## Rate Limits
- 100 queries per day (free tier)
- $5 per 1,000 queries beyond free tier (up to 10,000 queries per day)
- API key required (via Google Cloud Console)
- Per-second limits apply

## Key Restrictions
- CANNOT cache results for more than 24 hours
- CANNOT combine Google results with results from other search engines in the same display
- MUST display Google branding/attribution with results
- CANNOT modify or reorder search results
- CANNOT use results to train ML models
- CANNOT use Programmable Search Engine to create a general web search experience (must be scoped)
- Must comply with Google APIs ToS and all applicable policies
- Cannot scrape google.com directly; must use the API

## DRM3 Compliance Notes
MODERATE RISK. The 24-hour caching restriction is the primary concern. We cannot store Google search results in our index and serve them later. Our usage must be real-time or near-real-time: fetch results, display them with proper attribution, and discard within 24 hours. If we need persistent web search data, we must use a different source or negotiate an enterprise agreement. The cost model ($5/1K queries) also scales quickly -- budget accordingly. Ensure our implementation respects the caching TTL and display requirements.

## Last Reviewed
2026-04-02
