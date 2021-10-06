import 'package:flutter/material.dart';

class ColorPalette {
  static const Color titleTextColor = Colors.red;
  static const Color normalTextColor = Colors.grey;
  static const Color topLeftLinearColor = Color(0xff5FA6E3);
  static const Color bottomRightLinearColor = Color(0xff0060BD);
  static const Color primaryColor = Color(0xff2563EB);
  static const LinearGradient linearStatusBar = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    colors: <Color>[topLeftLinearColor, bottomRightLinearColor],
    tileMode: TileMode.clamp,
  );
  static const Color primary1Color = Color(0xFFE81C35);
  static const Color text1Color = Color(0xFF323B4B);
  static const Color text2Color = Color(0xFF4E5D78);
  static const Color text3Color = Color(0xFF8A94A6);
  static const Color text4Color = Color(0xFFB0B7C3);
  static const Color lightTextColor = Color(0xFFFFFFFF);

  static const Color bg1Color = Color(0xFFC1C7D0);
  static const Color bg2Color = Color(0xFFF3F3F3);
  static const Color bg4Color = Color(0xFFFFFFFF);
}
