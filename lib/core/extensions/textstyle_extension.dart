import 'package:crm_app/core/extensions/color_palette.dart';
import 'package:flutter/material.dart';

extension ExtendedTextStyle on TextStyle {
  // define text's font weight
  TextStyle get light {
    return this.copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get regular {
    return this.copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get italic {
    return this.copyWith(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    );
  }

  TextStyle get medium {
    return this.copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get bold {
    return this.copyWith(fontWeight: FontWeight.w700);
  }

  // define text's color
  TextStyle get text1Color {
    return this.copyWith(color: ColorPalette.text1Color);
  }

  TextStyle get text2Color {
    return this.copyWith(color: ColorPalette.text2Color);
  }

  TextStyle get text3Color {
    return this.copyWith(color: ColorPalette.text3Color);
  }

  TextStyle get text4Color {
    return this.copyWith(color: ColorPalette.text4Color);
  }

  TextStyle get textErrorColor {
    return this.copyWith(color: ColorPalette.primary1Color);
  }

  TextStyle get lightTextColor {
    return this.copyWith(color: ColorPalette.lightTextColor);
  }

  // convenience functions
  TextStyle setColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle setTextSize(double size) {
    return copyWith(fontSize: size);
  }
}
