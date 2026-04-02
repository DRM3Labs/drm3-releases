# Mozilla Observatory — Data Agreement

## Provider
Mozilla Foundation

## URL
https://observatory.mozilla.org/

## Terms of Service URL
https://www.mozilla.org/en-US/about/legal/terms/mozilla/ (general Mozilla terms)

## License
MPL 2.0 (Mozilla Public License 2.0) — open source project

## Data We Collect
Website security scan results via the Mozilla Observatory API. Includes grades (A+ through F), scores, and individual test results for HTTP headers (Content-Security-Policy, Strict-Transport-Security, X-Frame-Options, etc.), TLS configuration, and other web security best practices.

## How We Use It
Domain security posture signal in DRM3's internet telemetry index. Observatory grades and individual test results are included in domain security profiles. Used to assess web security configuration quality.

## Commercial Use
Yes. MPL 2.0 permits commercial use. The API provides scan results that are freely available. The underlying tool is open source.

## Redistribution
Yes. MPL 2.0 permits redistribution. We may serve Observatory scan results as part of enriched domain profiles via our API. If we modify the Observatory source code itself, modifications to MPL-licensed files must remain under MPL 2.0.

## Attribution Required
No formal attribution required for API data consumption. MPL 2.0 requires license retention if distributing source code. Best practice: credit Mozilla Observatory as data source.

## Rate Limits
No documented rate limits, but the service is a free community resource. Our policy: limit to approximately 20 requests per minute to be a good citizen. Scans can be triggered (POST) or fetched from cache (GET with recent=true).

## Key Restrictions
- Do not abuse the service with excessive scan requests
- Do not use to perform denial-of-service against target domains (scans generate real HTTP requests to targets)
- If modifying and distributing the Observatory source code, MPL 2.0 copyleft applies to modified files

## DRM3 Compliance Notes
Fully compliant. MPL 2.0 is a permissive copyleft license that allows commercial use and redistribution of scan results. We use the API as intended -- scanning domains and reporting security posture. We should cache results to minimize load on their infrastructure and avoid re-scanning the same domain more than once per day unless specifically requested.

## Last Reviewed
2026-04-02
