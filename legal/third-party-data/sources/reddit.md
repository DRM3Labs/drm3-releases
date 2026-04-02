# Reddit — Data Agreement

## Provider
Reddit, Inc.

## URL
https://www.reddit.com/

## Terms of Service URL
https://www.reddit.com/wiki/api-terms

## License
API ToS (proprietary, revised 2023 with commercial pricing)

## Data We Collect
Public post and comment data from specified subreddits via the Reddit API (OAuth2). Includes post titles, scores, comment counts, timestamps, and subreddit metadata. Used for sentiment analysis and social signal aggregation.

## How We Use It
Social sentiment signal in DRM3 products. Reddit data provides public discourse context for topics relevant to our domain intelligence. Aggregated sentiment scores and trending topic detection, not individual post display.

## Commercial Use
RISK FLAG. Reddit's 2023 API changes introduced commercial pricing for API access used in commercial products. Free tier (100 requests/minute with OAuth) is intended for personal use, hobbyist projects, and academic research. Commercial use at scale requires a paid API agreement with Reddit.

## Redistribution
Restricted. Reddit's API terms prohibit redistribution of Reddit content to third parties. We cannot serve raw Reddit posts/comments via our API. Derived signals (aggregated sentiment scores, trend indicators) that do not contain Reddit content verbatim are likely permissible but exist in a gray area.

## Attribution Required
Yes. Reddit's API terms require attribution when displaying Reddit content. If we display any Reddit-sourced information, must credit Reddit.

## Rate Limits
- Free tier (OAuth): 100 requests per minute
- Must include descriptive User-Agent header
- Must use OAuth2 (not unauthenticated access)
- Commercial tier: higher limits per agreement

## Key Restrictions
- CANNOT use Reddit data to train AI/ML models (explicitly prohibited since 2023)
- CANNOT redistribute raw Reddit content to third parties
- CANNOT sell or sublicense Reddit data
- CANNOT use data for surveillance or tracking individuals
- Commercial use requires a paid agreement
- Must comply with Reddit's Content Policy in how data is presented
- Must not exceed rate limits or circumvent access controls

## DRM3 Compliance Notes
HIGH RISK. Reddit's 2023 API terms overhaul specifically targeted commercial use and data redistribution. Our usage pattern (aggregating public posts into sentiment signals for a commercial product) almost certainly requires a paid API agreement. Mitigations: (1) we do not redistribute raw Reddit content -- only derived sentiment scores, (2) we do not train ML models on Reddit data, (3) volume is currently low. ACTION REQUIRED: before scaling Reddit-based signals in any revenue-generating product, secure a commercial API agreement with Reddit. Until then, treat Reddit data as experimental/internal only.

## Last Reviewed
2026-04-02
