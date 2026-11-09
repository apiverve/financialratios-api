# Financial Ratios API

Financial Ratios returns the key profitability, liquidity, leverage, efficiency and cash-flow ratios for a US public company by ticker - margins, ROE, ROA, current ratio, debt-to-equity, interest coverage, asset turnover, FCF margin and more - all computed from SEC filing data. On paid plans, valuation=true adds market cap, P/E, P/S, P/B and earnings yield against the latest stored share price.

[![npm version](https://img.shields.io/npm/v/@apiverve/financialratios.svg)](https://www.npmjs.com/package/@apiverve/financialratios)

This is a JavaScript wrapper for the [Financial Ratios API](https://apiverve.com/marketplace/financialratios?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/financialratios
```

Using yarn:
```shell
yarn add @apiverve/financialratios
```

---

## Configuration

Before using the Financial Ratios API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The Financial Ratios API documentation is found here: [https://docs.apiverve.com/ref/financialratios](https://docs.apiverve.com/ref/financialratios?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const financialratiosAPI = require('@apiverve/financialratios');
const api = new financialratiosAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  ticker: "AAPL",
  year: 0,
  quarter: 0,
  valuation: true
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  ticker: "AAPL",
  year: 0,
  quarter: 0,
  valuation: true
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  ticker: "AAPL",
  year: 0,
  quarter: 0,
  valuation: true
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

## Example Response

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

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
