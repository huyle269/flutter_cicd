import 'package:flutter/material.dart';

mixin CustomButtonStyles {
  static ButtonStyle appBarAction = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.transparent,
    ), //button color
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
  );
}
