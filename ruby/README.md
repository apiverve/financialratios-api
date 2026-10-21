# Financial Ratios API - Ruby Gem

Financial Ratios returns the key profitability, liquidity, leverage, efficiency and cash-flow ratios for a US public company by ticker - margins, ROE, ROA, current ratio, debt-to-equity, interest coverage, asset turnover, FCF margin and more - all computed from SEC filing data.

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
  quarter: 0
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ ticker: "AAPL", year: 0, quarter: 0 })
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/financialratios?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/financialratios?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/financialratios?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
