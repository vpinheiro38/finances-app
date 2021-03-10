import 'package:finances_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  final String _fontName = 'Montserrat';

  final double _largeTextSize = 20.0;
  final double _mediumTextSize = 16.0;
  final double _bodyTextSize = 14.0;
  final double _smallBodyTextSize = 10.0;

  TextStyle _h1TextStyle;
  TextStyle _h2TextStyle;
  TextStyle _largeBodyTextStyle;
  TextStyle _bodyTextStyle;
  TextStyle _boldBodyTextStyle;
  TextStyle _smallBodyTextStyle;
  TextStyle _boldGrayBodyTextStyle;
  TextStyle _grayBodyTextStyle;

  TextStyles() {
    _h1TextStyle = TextStyle(
      fontFamily: _fontName,
      fontWeight: FontWeight.bold,
      fontSize: _largeTextSize,
      color: AppColors.textColor,
    );

    _h2TextStyle = TextStyle(
      fontFamily: _fontName,
      fontWeight: FontWeight.bold,
      fontSize: _mediumTextSize,
      color: AppColors.textColor,
    );

    _largeBodyTextStyle = TextStyle(
      fontFamily: _fontName,
      fontSize: _mediumTextSize,
      color: AppColors.textColor,
    );

    _boldBodyTextStyle = TextStyle(
      fontFamily: _fontName,
      fontWeight: FontWeight.bold,
      fontSize: _bodyTextSize,
      color: AppColors.textColor,
    );

    _bodyTextStyle = TextStyle(
      fontFamily: _fontName,
      fontSize: _bodyTextSize,
      color: AppColors.textColor,
    );

    _smallBodyTextStyle = TextStyle(
      fontFamily: _fontName,
      fontSize: _smallBodyTextSize,
      color: AppColors.hintTextColor,
    );

    _boldGrayBodyTextStyle = TextStyle(
      fontFamily: _fontName,
      fontWeight: FontWeight.bold,
      fontSize: _bodyTextSize,
      color: AppColors.hintTextColor,
    );

    _grayBodyTextStyle = TextStyle(
      fontFamily: _fontName,
      fontSize: _bodyTextSize,
      color: AppColors.hintTextColor,
    );
  }

  TextStyle get h1TextStyle => _h1TextStyle;
  TextStyle get h2TextStyle => _h2TextStyle;
  TextStyle get largeBodyTextStyle => _largeBodyTextStyle;
  TextStyle get boldBodyTextStyle => _boldBodyTextStyle;
  TextStyle get bodyTextStyle => _bodyTextStyle;
  TextStyle get smallBodyTextStyle => _smallBodyTextStyle;
  TextStyle get grayTextStyle => _grayBodyTextStyle;
  TextStyle get boldGrayTextStyle => _boldGrayBodyTextStyle;
}