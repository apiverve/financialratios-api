Financial Ratios API
============

Financial Ratios returns the key profitability, liquidity, leverage, efficiency and cash-flow ratios for a US public company by ticker - margins, ROE, ROA, current ratio, debt-to-equity, interest coverage, asset turnover, FCF margin and more - all computed from SEC filing data. On paid plans, valuation=true adds market cap, P/E, P/S, P/B and earnings yield against the latest stored share price.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-financialratios.svg)](https://pypi.org/project/apiverve-financialratios/)

This is a Python wrapper for the [Financial Ratios API](https://apiverve.com/marketplace/financialratios?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-financialratios
```

Using `pip3`:

```bash
pip3 install apiverve-financialratios
```

---

## Configuration

Before using the Financial Ratios API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_financialratios.apiClient import FinancialratiosAPIClient

# Initialize the client with your APIVerve API key
api = FinancialratiosAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0,
    "valuation": true
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Financial Ratios API documentation is found here: [https://docs.apiverve.com/ref/financialratios](https://docs.apiverve.com/ref/financialratios?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_financialratios.apiClient import FinancialratiosAPIClient

# Initialize the client with your APIVerve API key
api = FinancialratiosAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0,
    "valuation": true
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

## Error Handling

The API client provides comprehensive error handling through the `FinancialratiosAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_financialratios.apiClient import FinancialratiosAPIClient, FinancialratiosAPIClientError

api = FinancialratiosAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0,
    "valuation": true
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except FinancialratiosAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_financialratios.apiClient import FinancialratiosAPIClient, FinancialratiosAPIClientError

api = FinancialratiosAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0,
    "valuation": true
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except FinancialratiosAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_financialratios.apiClient import FinancialratiosAPIClient, FinancialratiosAPIClientError

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0,
    "valuation": true
}

# Using context manager ensures proper cleanup
with FinancialratiosAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except FinancialratiosAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_financialratios.apiClient import FinancialratiosAPIClient

# Enable debug mode
api = FinancialratiosAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0,
    "valuation": true
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_financialratios.apiClient import FinancialratiosAPIClient

api = FinancialratiosAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0,
    "valuation": true
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
