# Cisco Umbrella — Data Agreement

## Provider
Cisco Systems, Inc. (OpenDNS / Umbrella)

## URL
https://umbrella.cisco.com/

## Terms of Service URL
No explicit license for the Top 1M list. General Cisco ToS: https://www.cisco.com/c/en/us/about/legal/terms-conditions.html

## License
No explicit license. Publicly available download hosted on AWS S3. Implicitly available for research and analysis use.

## Data We Collect
Cisco Umbrella Popularity List (Top 1M domains). Downloaded from the public S3 bucket (`s3-us-west-1.amazonaws.com/umbrella-static/top-1m.csv.zip`). Contains domain names ranked by DNS query popularity.

## How We Use It
DNS popularity signal in DRM3's internet telemetry index. Used alongside Tranco and Majestic rankings to build composite domain importance scores.

## Commercial Use
Unclear. No explicit license is provided with the dataset. It is publicly hosted and widely used in academic and commercial security research. Cisco has not enforced restrictions on commercial use of this list, but the absence of an explicit license means there is some legal ambiguity.

## Redistribution
Unclear. No explicit redistribution rights granted. We serve derived/composite domain scores that incorporate Umbrella rankings as one factor among many, which is likely permissible as transformative use. We do not redistribute the raw list.

## Attribution Required
Recommended but not formally required. Best practice: credit "Cisco Umbrella" when referencing DNS popularity data derived from this source.

## Rate Limits
None. The dataset is a static file download from S3. Download once per day (list updates daily).

## Key Restrictions
- No explicit license means no guaranteed rights
- Cisco could restrict access or change terms at any time
- Should not rely on this as a sole critical data source
- Do not redistribute the raw CSV as a standalone product

## DRM3 Compliance Notes
MINOR RISK: The absence of an explicit license is a gap. However, the dataset has been publicly available since 2016 and is widely used across the security industry (academic papers, commercial products, OSINT tools) without enforcement action. Our usage is standard: one ranking signal among several in a composite domain index. Mitigation: (1) we never redistribute the raw list, (2) Tranco (which we also use) already incorporates Umbrella data under Apache 2.0, providing a licensed alternative path to similar data. If Cisco restricts access, we can drop this source with minimal impact.

## Last Reviewed
2026-04-02
