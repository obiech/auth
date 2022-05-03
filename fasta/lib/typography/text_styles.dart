import 'package:fasta/colors/colors.dart';
import 'package:fasta/typography/font_weights.dart';
import 'package:flutter/material.dart';

/// Defines text styles for the puzzle UI.
class FastaTextStyle {
  /// Headline 1 text style
  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 29.3,
      fontWeight: FastaFontWeight.semiBold,
    );
  }

  /// Headline 2 text style
  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 54,
      height: 1.1,
      fontWeight: FastaFontWeight.semiBold,
    );
  }

  /// Headline 3 text style
  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 34,
      height: 1.12,
      fontWeight: FastaFontWeight.semiBold,
    );
  }

  /// Headline 3 Soft text style
  static TextStyle get headline3Soft {
    return _baseTextStyle.copyWith(
      fontSize: 34,
      height: 1.17,
      fontWeight: FastaFontWeight.regular,
    );
  }

  /// Headline 4 text style
  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      height: 1.15,
      fontWeight: FastaFontWeight.bold,
    );
  }

  /// Headline 5 text style
  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      height: 1.25,
      fontWeight: FastaFontWeight.bold,
    );
  }

  /// Body Large Bold text style
  static TextStyle get bodyLargeBold {
    return _baseTextStyle.copyWith(
      fontSize: 46,
      height: 1.17,
      fontWeight: FastaFontWeight.bold,
    );
  }

  /// Body Large text style
  static TextStyle get bodyLarge {
    return _baseTextStyle.copyWith(
      fontSize: 46,
      height: 1.17,
      fontWeight: FastaFontWeight.regular,
    );
  }

  /// Label text style
  static TextStyle get label {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      height: 1.27,
      fontWeight: FastaFontWeight.regular,
    );
  }

  static const _baseTextStyle = TextStyle(
    fontFamily: 'Open Sans',
    color: FastaColors.black,
    fontWeight: FastaFontWeight.regular,
  );
}
