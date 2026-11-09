# Financial Ratios API - Dart/Flutter Client

Financial Ratios returns the key profitability, liquidity, leverage, efficiency and cash-flow ratios for a US public company by ticker - margins, ROE, ROA, current ratio, debt-to-equity, interest coverage, asset turnover, FCF margin and more - all computed from SEC filing data. On paid plans, valuation=true adds market cap, P/E, P/S, P/B and earnings yield against the latest stored share price.

[![pub package](https://img.shields.io/pub/v/apiverve_financialratios.svg)](https://pub.dev/packages/apiverve_financialratios)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Financial Ratios API](https://apiverve.com/marketplace/financialratios?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_financialratios: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_financialratios/apiverve_financialratios.dart';

void main() async {
  final client = FinancialratiosClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'ticker': 'AAPL',
      'year': 0,
      'quarter': 0,
      'valuation': true
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "ticker": "COST",
    "company": "COSTCO WHOLESALE CORP /NEW",
    "cik": "0000909832",
    "fiscalYear": 2026,
    "fiscalQuarter": 4,
    "filingType": "10-K",
    "filingDate": "2026-10-07",
    "periodEnd": "2026-08-30",
    "profitability": {
      "grossMargin": null,
      "operatingMargin": 3.85,
      "netMargin": 3.04,
      "returnOnEquity": 25.77,
      "returnOnAssets": 10.36
    },
    "liquidity": {
      "currentRatio": 1.06,
      "quickRatio": 0.62,
      "cashRatio": 0.46
    },
    "leverage": {
      "debtToEquity": 1.49,
      "debtToAssets": 0.6,
      "equityMultiplier": 2.49,
      "interestCoverage": 80.59
    },
    "efficiency": {
      "assetTurnover": 3.4,
      "inventoryTurnover": 13.68,
      "receivablesTurnover": null
    },
    "cashFlow": {
      "freeCashFlow": 9382000000,
      "fcfMargin": 3.09,
      "operatingCashFlowMargin": 5.22,
      "capexToRevenue": 2.12
    },
    "perShare": {
      "eps": 20.76,
      "bookValuePerShare": 80.5599,
      "freeCashFlowPerShare": 21.1103
    },
    "valuation": {
      "priceAsOf": "2026-11-05T21:00:00.000Z",
      "marketCap": 473576966930,
      "priceToEarnings": 51.33,
      "earningsYield": 1.95,
      "priceToSales": 1.56,
      "priceToBook": 13.23,
      "trailingEps": 20.76,
      "trailingRevenue": 303154000000,
      "trailingNetIncome": 9226000000,
      "trailingBasis": "annual"
    }
  }
}
```

## API Reference

- **API Home:** [Financial Ratios API](https://apiverve.com/marketplace/financialratios?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/financialratios](https://docs.apiverve.com/ref/financialratios?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
