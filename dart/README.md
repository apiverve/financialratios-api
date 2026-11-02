# Financial Ratios API - Dart/Flutter Client

Financial Ratios returns the key profitability, liquidity, leverage, efficiency and cash-flow ratios for a US public company by ticker - margins, ROE, ROA, current ratio, debt-to-equity, interest coverage, asset turnover, FCF margin and more - all computed from SEC filing data.

[![pub package](https://img.shields.io/pub/v/apiverve_financialratios.svg)](https://pub.dev/packages/apiverve_financialratios)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Financial Ratios API](https://apiverve.com/marketplace/financialratios?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_financialratios: ^1.2.4
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
      'quarter': 0
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
    "ticker": "AAPL",
    "company": "Apple Inc.",
    "cik": "0000320193",
    "fiscalYear": 2025,
    "fiscalQuarter": 4,
    "filingType": "10-K",
    "filingDate": "2025-10-31",
    "periodEnd": "2025-09-27",
    "profitability": {
      "grossMargin": 46.91,
      "operatingMargin": 31.97,
      "netMargin": 26.92,
      "returnOnEquity": 151.91,
      "returnOnAssets": 31.18
    },
    "liquidity": {
      "currentRatio": 0.89,
      "quickRatio": 0.86,
      "cashRatio": 0.22
    },
    "leverage": {
      "debtToEquity": 3.87,
      "debtToAssets": 0.79,
      "equityMultiplier": 4.87,
      "interestCoverage": null
    },
    "efficiency": {
      "assetTurnover": 1.16,
      "inventoryTurnover": 38.64,
      "receivablesTurnover": 10.46
    },
    "cashFlow": {
      "freeCashFlow": 98767000000,
      "fcfMargin": 23.73,
      "operatingCashFlowMargin": 26.79,
      "capexToRevenue": 3.06
    },
    "perShare": {
      "eps": 7.46,
      "bookValuePerShare": 4.914,
      "freeCashFlowPerShare": 6.5824
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
