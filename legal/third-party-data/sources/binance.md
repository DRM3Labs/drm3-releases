# Binance — Data Agreement

## Provider
Binance Holdings Ltd.

## URL
https://www.binance.com/

## Terms of Service URL
https://www.binance.com/en/terms

## License
API ToS (proprietary)

## Data We Collect
Cryptocurrency spot prices, trading pairs, 24h volume, price change percentages via the public REST API (`/api/v3/ticker/price`, `/api/v3/ticker/24hr`).

## How We Use It
Display current and historical crypto price data within DRM3 products. Used as one input in aggregated market signals that are provenance-signed before serving.

## Commercial Use
Limited. Binance API ToS permits display of data in applications but prohibits reselling raw price feeds or building a competing exchange data product.

## Redistribution
No raw redistribution. Derived/aggregated data (e.g., provenance-signed composite signals combining multiple sources) is permissible as it constitutes a transformative use. Raw Binance price ticks must not be served directly via our API.

## Attribution Required
Yes. Binance requires attribution when displaying their data. Must include "Data provided by Binance" or equivalent where Binance-sourced prices are shown.

## Rate Limits
- Public endpoints: 1,200 requests per minute per IP (weight-based system)
- Order book depth and ticker endpoints have varying weights
- IP ban triggered at sustained overuse

## Key Restrictions
- Cannot resell or sublicense raw market data
- Cannot use data to build a competing cryptocurrency exchange
- Cannot scrape beyond API-provided endpoints
- Cannot misrepresent data source or accuracy
- Cannot cache and serve raw data as if it were real-time

## DRM3 Compliance Notes
Our usage is compliant: we fetch prices for display and as inputs to aggregated signals. We do not redistribute raw Binance feeds. Provenance-signed composite signals that blend multiple price sources are transformative and not a raw redistribution. We must ensure attribution is visible wherever Binance-sourced prices appear in isolation.

## Last Reviewed
2026-04-02
