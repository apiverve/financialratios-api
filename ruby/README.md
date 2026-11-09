# Financial Ratios API - Ruby Gem

Financial Ratios returns the key profitability, liquidity, leverage, efficiency and cash-flow ratios for a US public company by ticker - margins, ROE, ROA, current ratio, debt-to-equity, interest coverage, asset turnover, FCF margin and more - all computed from SEC filing data. On paid plans, valuation=true adds market cap, P/E, P/S, P/B and earnings yield against the latest stored share price.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_financialratios'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_financialratios
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_financialratios'

# Initialize the client
client = APIVerve::Financialratios::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  ticker: "AAPL",
  year: 0,
  quarter: 0,
  valuation: true
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ ticker: "AAPL", year: 0, quarter: 0, valuation: true })
  puts response["data"]
rescue APIVerve::Financialratios::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Financialratios::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Financialratios::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/financialratios?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/financialratios?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/financialratios?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
