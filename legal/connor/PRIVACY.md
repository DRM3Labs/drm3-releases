# Privacy Policy — Connor

**DRM3 Labs Corp. · Last updated: March 30, 2026**

Connor is a DNS intelligence and internet telemetry platform operated by DRM3 Labs Corp.

This policy supplements the [general DRM3 Privacy Policy](../PRIVACY.md).

## Data We Collect About Domains

All data Connor collects about domains is already publicly available via standard internet protocols. Connor does not create new data about domain owners — it indexes what is already observable by anyone.

**Public protocol data collected:**
- DNS records (A, AAAA, MX, NS, TXT, CNAME, SOA, CAA, SRV) via DNS-over-HTTPS
- TLS certificate chains via port 443 TLS handshake
- Certificate Transparency log entries via crt.sh
- WHOIS/RDAP registration data via public WHOIS servers
- HTTP status and headers via single HTTPS request (no content crawling)
- robots.txt content (to report on AI crawler policies)
- Traceroute hop data via ICMP
- ASN/IP organization via public IP databases
- DNSSEC validation status via DNS

Connor does **not** access private networks, authenticated services, password-protected pages, or non-public infrastructure.

## Data We Collect About API Users

API access requires an API key for rate limiting. We collect:
- Request counts per key (for rate limiting)
- No personal information tied to API keys
- No browsing history, tracking, or analytics
- No cookies for API access (UI sessions use HttpOnly JWT cookies)

## What We Don't Collect

- No personal information about domain owners
- No web page content (Connor does not crawl or index pages)
- No user accounts or profiles
- No third-party tracking or analytics
- No advertising data

## robots.txt

Connor fetches robots.txt to **analyze and report** AI crawler blocking policies across the internet. This is metadata research — Connor does not crawl page content. DNS, WHOIS, TLS, and traceroute queries use separate protocols not governed by robots.txt. See our Terms of Use for full details.

## Domain Owner Rights

DNS, WHOIS, and TLS certificate data are public by protocol design. Domain owners cannot opt out of public DNS resolution.

If you believe Connor is displaying inaccurate data about your domain, or if you have questions about our scanning practices, contact rob@drm3.io.

## Data Retention

- Recent observations: 30 days (Cloudflare D1)
- Permanent archive: Indefinite (Google BigQuery)
- All archived data includes cryptographic provenance receipts

---

[General Privacy Policy](../PRIVACY.md) · [Terms of Use](TERMS.md) · rob@drm3.io
