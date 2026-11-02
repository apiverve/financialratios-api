/// Response models for the Financial Ratios API.

/// API Response wrapper.
class FinancialratiosResponse {
  final String status;
  final dynamic error;
  final FinancialratiosData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  FinancialratiosResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory FinancialratiosResponse.fromJson(Map<String, dynamic> json) => FinancialratiosResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? FinancialratiosData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Financial Ratios API.

class FinancialratiosData {
  String? ticker;
  String? company;
  String? cik;
  num? fiscalYear;
  num? fiscalQuarter;
  String? filingType;
  String? filingDate;
  String? periodEnd;
  FinancialratiosDataProfitability? profitability;
  FinancialratiosDataLiquidity? liquidity;
  FinancialratiosDataLeverage? leverage;
  FinancialratiosDataEfficiency? efficiency;
  FinancialratiosDataCashflow? cashFlow;
  FinancialratiosDataPershare? perShare;

  FinancialratiosData({
    this.ticker,
    this.company,
    this.cik,
    this.fiscalYear,
    this.fiscalQuarter,
    this.filingType,
    this.filingDate,
    this.periodEnd,
    this.profitability,
    this.liquidity,
    this.leverage,
    this.efficiency,
    this.cashFlow,
    this.perShare,
  });

  factory FinancialratiosData.fromJson(Map<String, dynamic> json) => FinancialratiosData(
      ticker: json['ticker'],
      company: json['company'],
      cik: json['cik'],
      fiscalYear: json['fiscalYear'],
      fiscalQuarter: json['fiscalQuarter'],
      filingType: json['filingType'],
      filingDate: json['filingDate'],
      periodEnd: json['periodEnd'],
      profitability: json['profitability'] != null ? FinancialratiosDataProfitability.fromJson(json['profitability']) : null,
      liquidity: json['liquidity'] != null ? FinancialratiosDataLiquidity.fromJson(json['liquidity']) : null,
      leverage: json['leverage'] != null ? FinancialratiosDataLeverage.fromJson(json['leverage']) : null,
      efficiency: json['efficiency'] != null ? FinancialratiosDataEfficiency.fromJson(json['efficiency']) : null,
      cashFlow: json['cashFlow'] != null ? FinancialratiosDataCashflow.fromJson(json['cashFlow']) : null,
      perShare: json['perShare'] != null ? FinancialratiosDataPershare.fromJson(json['perShare']) : null,
    );
}

class FinancialratiosDataProfitability {
  num? grossMargin;
  num? operatingMargin;
  num? netMargin;
  num? returnOnEquity;
  num? returnOnAssets;

  FinancialratiosDataProfitability({
    this.grossMargin,
    this.operatingMargin,
    this.netMargin,
    this.returnOnEquity,
    this.returnOnAssets,
  });

  factory FinancialratiosDataProfitability.fromJson(Map<String, dynamic> json) => FinancialratiosDataProfitability(
      grossMargin: json['grossMargin'],
      operatingMargin: json['operatingMargin'],
      netMargin: json['netMargin'],
      returnOnEquity: json['returnOnEquity'],
      returnOnAssets: json['returnOnAssets'],
    );
}

class FinancialratiosDataLiquidity {
  num? currentRatio;
  num? quickRatio;
  num? cashRatio;

  FinancialratiosDataLiquidity({
    this.currentRatio,
    this.quickRatio,
    this.cashRatio,
  });

  factory FinancialratiosDataLiquidity.fromJson(Map<String, dynamic> json) => FinancialratiosDataLiquidity(
      currentRatio: json['currentRatio'],
      quickRatio: json['quickRatio'],
      cashRatio: json['cashRatio'],
    );
}

class FinancialratiosDataLeverage {
  num? debtToEquity;
  num? debtToAssets;
  num? equityMultiplier;
  dynamic interestCoverage;

  FinancialratiosDataLeverage({
    this.debtToEquity,
    this.debtToAssets,
    this.equityMultiplier,
    this.interestCoverage,
  });

  factory FinancialratiosDataLeverage.fromJson(Map<String, dynamic> json) => FinancialratiosDataLeverage(
      debtToEquity: json['debtToEquity'],
      debtToAssets: json['debtToAssets'],
      equityMultiplier: json['equityMultiplier'],
      interestCoverage: json['interestCoverage'],
    );
}

class FinancialratiosDataEfficiency {
  num? assetTurnover;
  num? inventoryTurnover;
  num? receivablesTurnover;

  FinancialratiosDataEfficiency({
    this.assetTurnover,
    this.inventoryTurnover,
    this.receivablesTurnover,
  });

  factory FinancialratiosDataEfficiency.fromJson(Map<String, dynamic> json) => FinancialratiosDataEfficiency(
      assetTurnover: json['assetTurnover'],
      inventoryTurnover: json['inventoryTurnover'],
      receivablesTurnover: json['receivablesTurnover'],
    );
}

class FinancialratiosDataCashflow {
  num? freeCashFlow;
  num? fcfMargin;
  num? operatingCashFlowMargin;
  num? capexToRevenue;

  FinancialratiosDataCashflow({
    this.freeCashFlow,
    this.fcfMargin,
    this.operatingCashFlowMargin,
    this.capexToRevenue,
  });

  factory FinancialratiosDataCashflow.fromJson(Map<String, dynamic> json) => FinancialratiosDataCashflow(
      freeCashFlow: json['freeCashFlow'],
      fcfMargin: json['fcfMargin'],
      operatingCashFlowMargin: json['operatingCashFlowMargin'],
      capexToRevenue: json['capexToRevenue'],
    );
}

class FinancialratiosDataPershare {
  num? eps;
  num? bookValuePerShare;
  num? freeCashFlowPerShare;

  FinancialratiosDataPershare({
    this.eps,
    this.bookValuePerShare,
    this.freeCashFlowPerShare,
  });

  factory FinancialratiosDataPershare.fromJson(Map<String, dynamic> json) => FinancialratiosDataPershare(
      eps: json['eps'],
      bookValuePerShare: json['bookValuePerShare'],
      freeCashFlowPerShare: json['freeCashFlowPerShare'],
    );
}

class FinancialratiosRequest {
  String ticker;
  int? year;
  int? quarter;

  FinancialratiosRequest({
    required this.ticker,
    this.year,
    this.quarter,
  });

  Map<String, dynamic> toJson() => {
      'ticker': ticker,
      if (year != null) 'year': year,
      if (quarter != null) 'quarter': quarter,
    };
}
