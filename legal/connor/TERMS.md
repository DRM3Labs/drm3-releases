# Terms of Use — Connor

**DRM3 Labs Corp. · Last updated: March 30, 2026**

Connor is a DNS intelligence and internet telemetry platform operated by DRM3 Labs Corp.

These terms supplement the [general DRM3 Terms of Use](../TERMS.md).

## What Connor Does

Connor continuously observes publicly available internet infrastructure data across 10,000+ domains. All data Connor collects is already public — it indexes what is observable by anyone using standard internet protocols.

## Data Collection

Connor collects the following categories of public data:

**DNS Records:** A, AAAA, MX, NS, TXT, CNAME, SOA, CAA, SRV records via DNS-over-HTTPS (Cloudflare resolver). Includes DMARC, SPF, and MCP service discovery records.

**TLS Certificates:** Certificate chain data (issuer, subject, validity dates, Subject Alternative Names) via TLS handshake on port 443 and Certificate Transparency logs (crt.sh).

**WHOIS / RDAP:** Registrar, registration dates, nameservers, and registrant organization from public WHOIS servers and RDAP endpoints.

**HTTPS Probing:** HTTP status code, server header, security headers, redirect chains, and response timing from a single HTTPS HEAD/GET request to port 443. Connor does not crawl pages, follow links, or index content.

**Subdomain Discovery:** Subdomains discovered from TLS certificate Subject Alternative Names (SANs), Certificate Transparency logs, and DNS resolution of common subdomain prefixes.

**Network Intelligence:** ASN organization and country via reverse IP lookup. Traceroute hop-by-hop path data. DNSSEC validation status.

**robots.txt:** Connor fetches and parses /robots.txt to identify AI crawler blocking policies. See "How We Honor robots.txt" below.

## How We Honor robots.txt

Connor respects robots.txt for HTTP content access. Specifically:

- Connor reads robots.txt to **report on AI crawler blocking policies** — this is metadata about the domain's stance on automated access.
- Connor does **not crawl, scrape, or index web page content**. Our HTTPS probe makes a single request to the domain root to check HTTP status and headers. It does not follow links or access deeper pages.
- If a domain's robots.txt disallows our user agent, Connor will still resolve DNS records, check TLS certificates, and query WHOIS/RDAP — these are public protocol queries, not HTTP crawling.
- DNS resolution, WHOIS lookup, certificate transparency queries, and traceroute are not governed by robots.txt — they use separate protocols (DNS, WHOIS, HTTPS to CT log servers, ICMP).

## Scanning Methodology

All observations are cryptographically signed with Ed25519 provenance receipts. Each receipt contains:
- What was queried (inputs)
- What was observed (outputs)
- SHA-256 content hashes of both
- Ed25519 signature with the observer's public key
- Timestamp and observer identity

Receipts are independently verifiable — anyone can confirm that Connor observed specific data at a specific time.

## Scanning Frequency

Connor scans its domain catalog daily. Enrichment data (WHOIS, ASN, DNSSEC, robots.txt) is refreshed on a multi-day cycle. Change detection compares consecutive scans and records infrastructure changes (DNS provider migrations, certificate authority switches, etc.).

## Data Retention

- **30-day hot cache:** Recent observations stored on Cloudflare D1 for real-time API access.
- **Permanent archive:** All observations permanently stored in BigQuery with full provenance receipts.

## API Access

API access requires an API key for rate limiting and access control. API keys are associated with service identity, not personal identity.

## No Warranty

Connor is provided "as is" without warranty of any kind. Scan data reflects what was observable at the time of scanning and may not represent current state.

---

[General Terms](../TERMS.md) · [Privacy Policy](PRIVACY.md) · rob@drm3.io
