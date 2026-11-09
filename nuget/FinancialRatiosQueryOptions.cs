using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.FinancialRatios
{
    /// <summary>
    /// Query options for the Financial Ratios API
    /// </summary>
    public class FinancialRatiosQueryOptions
    {
        /// <summary>
        /// Stock ticker symbol (e.g. AAPL, MSFT, ADBE)
        /// </summary>
        [JsonProperty("ticker")]
        public string Ticker { get; set; }

        /// <summary>
        /// Fiscal year to retrieve. Defaults to latest available. History covers only the quarters captured so far; a missing period answers 404 listing the available ones.
        /// </summary>
        [JsonProperty("year")]
        public int? Year { get; set; }

        /// <summary>
        /// Fiscal quarter to retrieve. Defaults to latest available.
        /// </summary>
        [JsonProperty("quarter")]
        public int? Quarter { get; set; }

        /// <summary>
        /// Add a valuation block: market cap, P/E, earnings yield, P/S and P/B against the latest stored share price, with the trailing-twelve-month EPS, revenue and net income behind them. Latest filing only; null for a year/quarter request. The block is paid; free plans get it back null.
        /// </summary>
        [JsonProperty("valuation")]
        public bool? Valuation { get; set; }
    }
}
