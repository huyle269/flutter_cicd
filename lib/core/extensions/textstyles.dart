import 'package:crm_app/core/extensions/color_palette.dart';
import 'package:crm_app/core/extensions/textstyle_extension.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle _defaultStyle = TextStyle(
    fontSize: 14,
    color: ColorPalette.text1Color,
    fontWeight: FontWeight.w400,
    height: 16 / 14,
  );

  static TextStyle small1Text =
      _defaultStyle.copyWith(fontSize: 11.7, height: 16 / 11.7);
  static TextStyle small2Text =
      _defaultStyle.copyWith(fontSize: 9.7, height: 16 / 9.7);
  static TextStyle small3Text =
      _defaultStyle.copyWith(fontSize: 8.1, height: 16 / 8.1);

  static TextStyle body1Text =
      _defaultStyle.copyWith(fontSize: 16.8, height: 24 / 16.8);
  static TextStyle body2Text =
      _defaultStyle.copyWith(fontSize: 14, height: 16 / 14);

  static TextStyle heading1Text =
      _defaultStyle.copyWith(fontSize: 34.8, height: 40 / 34.8).bold;
  static TextStyle heading2Text =
      _defaultStyle.copyWith(fontSize: 29, height: 32 / 29).bold;
  static TextStyle heading3Text =
      _defaultStyle.copyWith(fontSize: 24.2, height: 32 / 24.2).bold;
  static TextStyle heading4Text =
      _defaultStyle.copyWith(fontSize: 20.2, height: 24 / 20.2).bold;
  static TextStyle heading5Text =
      _defaultStyle.copyWith(fontSize: 16.8, height: 24 / 16.8).bold;
}

// How to use?
// Text('test text', style: TextStyles.normalText.semibold.whiteColor);
// Text('test text', style: TextStyles.itemText.whiteColor.bold);