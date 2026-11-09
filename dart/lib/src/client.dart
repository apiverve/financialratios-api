import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class FinancialratiosValidationException implements Exception {
  final List<String> errors;

  FinancialratiosValidationException(this.errors);

  @override
  String toString() => 'FinancialratiosValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Financial Ratios API client.
///
/// For more information, visit: https://apiverve.com/marketplace/financialratios?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [ticker] (required) - Stock ticker symbol (e.g. AAPL, MSFT, ADBE) [minLength: 1, maxLength: 6]
/// * [year] - Fiscal year to retrieve. Defaults to latest available. History covers only the quarters captured so far; a missing period answers 404 listing the available ones. [min: 2000, max: 2030]
/// * [quarter] - Fiscal quarter to retrieve. Defaults to latest available. [min: 1, max: 4]
/// * [valuation] - Add a valuation block: market cap, P/E, earnings yield, P/S and P/B against the latest stored share price, with the trailing-twelve-month EPS, revenue and net income behind them. Latest filing only; null for a year/quarter request. The block is paid; free plans get it back null.
class FinancialratiosClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'ticker': ValidationRule(type: 'string', required: true, minLength: 1, maxLength: 6),
    'year': ValidationRule(type: 'integer', required: false, min: 2000, max: 2030),
    'quarter': ValidationRule(type: 'integer', required: false, min: 1, max: 4),
    'valuation': ValidationRule(type: 'boolean', required: false),
  };

  FinancialratiosClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/financialratios',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [FinancialratiosValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw FinancialratiosValidationException(errors);
    }
  }

  /// Execute a request to the Financial Ratios API.
  ///
  /// Parameters are validated before sending the request.
  Future<FinancialratiosResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw FinancialratiosException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: params.map((key, value) => MapEntry(key, value.toString())),
      );

      final response = await _httpClient.get(
        uri,
        headers: {
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return FinancialratiosResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw FinancialratiosException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw FinancialratiosException('Resource not found');
      } else {
        throw FinancialratiosException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is FinancialratiosException) rethrow;
      throw FinancialratiosException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Financial Ratios API client.
class FinancialratiosException implements Exception {
  final String message;

  FinancialratiosException(this.message);

  @override
  String toString() => 'FinancialratiosException: $message';
}
