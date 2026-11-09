# [Financial Ratios API](https://apiverve.com/marketplace/financialratios?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)

Financial Ratios returns the key profitability, liquidity, leverage, efficiency and cash-flow ratios for a US public company by ticker - margins, ROE, ROA, current ratio, debt-to-equity, interest coverage, asset turnover, FCF margin and more - all computed from SEC filing data. On paid plans, valuation&#x3D;true adds market cap, P/E, P/S, P/B and earnings yield against the latest stored share price.

The Financial Ratios API provides a simple, reliable way to integrate financial ratios functionality into your applications. Built for developers who need production-ready financial ratios capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/financialratios?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/financialratios?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/financialratios)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.FinancialRatios)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-financialratios/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_financialratios)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/financialratios)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_financialratios)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callFinancialRatiosAPI() {
    try {
        const params = new URLSearchParams({
            ticker: 'AAPL',
            valuation: true
        });

        const response = await fetch(`https://api.apiverve.com/v1/financialratios?${params}`, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callFinancialRatiosAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/financialratios?ticker=AAPL&valuation=true" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/financialratios
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/financialratios) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.FinancialRatios
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.FinancialRatios) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-financialratios
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-financialratios/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_financialratios
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_financialratios) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/financialratios
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/financialratios) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_financialratios
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_financialratios) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:financialratios-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/financialratios-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [Financial Ratios API](https://apiverve.com/marketplace/financialratios?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/financialratios](https://docs.apiverve.com/ref/financialratios)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The Financial Ratios API is commonly used for:

- **Web Applications** - Add financial ratios features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with financial ratios capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the Financial Ratios API:

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

---

## Support & Community

- 🏠 **API Home**: [Financial Ratios API](https://apiverve.com/marketplace/financialratios?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.
