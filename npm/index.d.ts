declare module '@apiverve/financialratios' {
  export interface financialratiosOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface financialratiosResponse {
    status: string;
    error: string | null;
    data: FinancialRatiosData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface FinancialRatiosData {
      ticker:        null | string;
      company:       null | string;
      cik:           null | string;
      fiscalYear:    number | null;
      fiscalQuarter: number | null;
      filingType:    null | string;
      filingDate:    Date | null;
      periodEnd:     Date | null;
      profitability: Profitability;
      liquidity:     Liquidity;
      leverage:      Leverage;
      efficiency:    Efficiency;
      cashFlow:      CashFlow;
      perShare:      PerShare;
      valuation:     Valuation;
  }
  
  interface CashFlow {
      freeCashFlow:            number | null;
      fcfMargin:               number | null;
      operatingCashFlowMargin: number | null;
      capexToRevenue:          number | null;
  }
  
  interface Efficiency {
      assetTurnover:       number | null;
      inventoryTurnover:   number | null;
      receivablesTurnover: null;
  }
  
  interface Leverage {
      debtToEquity:     number | null;
      debtToAssets:     number | null;
      equityMultiplier: number | null;
      interestCoverage: number | null;
  }
  
  interface Liquidity {
      currentRatio: number | null;
      quickRatio:   number | null;
      cashRatio:    number | null;
  }
  
  interface PerShare {
      eps:                  number | null;
      bookValuePerShare:    number | null;
      freeCashFlowPerShare: number | null;
  }
  
  interface Profitability {
      grossMargin:     null;
      operatingMargin: number | null;
      netMargin:       number | null;
      returnOnEquity:  number | null;
      returnOnAssets:  number | null;
  }
  
  interface Valuation {
      priceAsOf:         Date | null;
      marketCap:         number | null;
      priceToEarnings:   number | null;
      earningsYield:     number | null;
      priceToSales:      number | null;
      priceToBook:       number | null;
      trailingEps:       number | null;
      trailingRevenue:   number | null;
      trailingNetIncome: number | null;
      trailingBasis:     null | string;
  }

  export default class financialratiosWrapper {
    constructor(options: financialratiosOptions);

    execute(callback: (error: any, data: financialratiosResponse | null) => void): Promise<financialratiosResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: financialratiosResponse | null) => void): Promise<financialratiosResponse>;
    execute(query?: Record<string, any>): Promise<financialratiosResponse>;
  }
}
