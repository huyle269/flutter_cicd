import 'dart:io';

import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late double screenPaddingTop;
  static late Orientation orientation;
  static late double sizeRatio;

  static late double topSafeAreaPadding;
  static late double bottomSafeAreaPadding;
  static late double devicePixelRatio;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    sizeRatio = screenWidth / screenHeight;
    orientation = _mediaQueryData.orientation;
    devicePixelRatio = _mediaQueryData.devicePixelRatio;

    topSafeAreaPadding = _mediaQueryData.padding.top;
    bottomSafeAreaPadding = _mediaQueryData.padding.bottom;

    if (Platform.isIOS) {
      screenPaddingTop = topSafeAreaPadding;
    } else {
      screenPaddingTop = topSafeAreaPadding + 6;
    }
  }

  static bool isIphoneX() {
    if (Platform.isIOS && screenHeight >= 812.0) {
      return true;
    }
    return false;
  }
}
