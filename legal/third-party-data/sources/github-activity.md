# GitHub Activity — Data Agreement

## Provider
GitHub, Inc. (Microsoft subsidiary)

## URL
https://github.com/

## Terms of Service URL
https://docs.github.com/en/site-policy/github-terms/github-terms-of-service

## License
API ToS (GitHub Terms of Service, Section H: API Terms)

## Data We Collect
Public repository activity data via the GitHub REST API v3 and GraphQL API v4. Includes repository metadata (stars, forks, watchers), commit activity, release information, issue/PR counts, contributor statistics, and organization profiles.

## How We Use It
Open source activity signal in DRM3 products. GitHub data provides software ecosystem health indicators, project vitality metrics, and developer community context for enrichment and analysis.

## Commercial Use
Yes, with conditions. GitHub's ToS permit API use in commercial applications. You may display and analyze public repository data. You may not use GitHub data to build a product that competes with GitHub.

## Redistribution
Limited. We may serve GitHub-derived metrics (star counts, activity trends, contributor stats) as part of enriched data profiles. We should not build a product whose primary value proposition is serving GitHub data as a substitute for GitHub itself.

## Attribution Required
Yes. GitHub's ToS require attribution when displaying GitHub data. Must credit GitHub as the data source.

## Rate Limits
- Unauthenticated: 60 requests per hour per IP
- Authenticated (token): 5,000 requests per hour
- GraphQL API: 5,000 points per hour
- Search API: 30 requests per minute (authenticated)
- Secondary rate limits for expensive operations

## Key Restrictions
- CANNOT use data to build a product that competes with GitHub
- CANNOT scrape GitHub (must use the API)
- CANNOT use data for surveillance or tracking of individuals
- CANNOT use data to discriminate against users
- Must respect robots.txt and API rate limits
- OAuth tokens must not be shared or embedded in client-side code
- GitHub may throttle or block abusive API usage without notice

## DRM3 Compliance Notes
Compliant. We use the API as intended -- fetching public repository metadata for display and analysis. We are not building a competing code hosting platform. Our usage (project vitality metrics, ecosystem health indicators) is a standard and expected use case. We authenticate with a token for higher rate limits. Ensure we do not exceed search API rate limits, which are more restrictive than general API limits.

## Last Reviewed
2026-04-02
