# USGS Earthquake Hazards — Data Agreement

## Provider
U.S. Geological Survey (USGS), Department of the Interior

## URL
https://earthquake.usgs.gov/fdsnws/event/1/

## Terms of Service URL
https://www.usgs.gov/information-policies-and-instructions/copyrights-and-credits

## License
Public Domain (US government data)

## Data We Collect
Earthquake event data including magnitude, location (latitude/longitude/depth), time, tsunami flag, significance score, and felt reports via the USGS Earthquake Hazards API (FDSN Event Web Service). Also access ShakeMap and PAGER data for significant events.

## How We Use It
Seismic/geophysical signal in DRM3 products. Earthquake data provides geographic risk context and real-time natural hazard monitoring for data enrichment and alerting.

## Commercial Use
Yes. Public domain data with no restrictions on commercial use.

## Redistribution
Yes. Public domain data may be freely redistributed in any form.

## Attribution Required
No. Public domain data has no enforceable attribution requirement. USGS requests citation when using their data. We honor this as good practice: "Data from USGS Earthquake Hazards Program."

## Rate Limits
- No API key required
- No documented hard rate limits
- Service designed for real-time consumption; GeoJSON feeds update every minute for significant events
- Large historical queries should use date range filters

## Key Restrictions
- No restrictions on data use
- Preliminary earthquake data may be revised -- magnitudes and locations are updated as more seismograph data arrives
- Do not misrepresent preliminary data as final assessments

## DRM3 Compliance Notes
Fully compliant. US government data is public domain and unrestricted. No API key required. Be aware that earthquake parameters (especially magnitude) are frequently revised in the hours after an event. No legal risks identified.

## Last Reviewed
2026-04-02
