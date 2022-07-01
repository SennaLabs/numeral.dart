import 'dart:math' show pow;

import 'package:intl/intl.dart';

import 'constants.dart';
import 'parser.dart';

/// Numeral formatter
///
/// This class is used to format numbers into strings.
///
/// Example usage:
/// ```dart
/// const numeral =  Numeral(1314);
/// print(numeral.format()); // => "1.314K"
/// ```
class Numeral {
  /// Create [Numeral] class.
  ///
  /// The Factory create a [Numeral] class instance.
  ///
  /// [numeral] is num [Type].
  ///
  /// return [Numeral] instance.
  const Numeral(this.numeral);

  /// Original numeral.
  final num numeral;

  /// Format [number] to beautiful [String].
  ///
  /// E.g:
  /// ```dart
  /// Numeral(1000).value(); // -> 1K
  /// ```
  ///
  /// return a [String] type.
  String format(
      {int fractionDigits = DEFAULT_FRACTION_DIGITS, bool roundUp = false}) {
    final NumeralParsedValue parsed = numeralParser(numeral);
    if (!roundUp) {
      return _removeEndsZero(
              truncateToDecimalPlaces(parsed.value, precision: 2).toString()) +
          parsed.suffix;
    } else {
      return _removeEndsZero(parsed.value.toStringAsFixed(fractionDigits)) +
          parsed.suffix;
    }
  }

  double truncateToDecimalPlaces(num value, {required int precision}) =>
      (value * pow(10, precision)).truncate() / pow(10, precision);

  /// Remove value ends with zero.
  ///
  /// Remove formated value ends with zero,
  /// replace to zero string.
  ///
  /// [value] type is [String].
  ///
  /// return a [String] type.
  String _removeEndsZero(String value) {
    if (value.indexOf('.') == -1) {
      return value;
    }

    if (value.endsWith('.')) {
      return value.substring(0, value.length - 1);
    } else if (value.endsWith('0')) {
      return _removeEndsZero(value.substring(0, value.length - 1));
    }

    return value;
  }

  /// Get formated value.
  ///
  /// Get the [value] function value.
  ///
  /// return a [String] type.
  @override
  String toString() => format();
}
