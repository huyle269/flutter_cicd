import 'package:crm_app/core/extensions/color_extension.dart';
import 'package:flutter/material.dart';

List<ThemeData> getThemes() {
  return [
    lightTheme1,
    // lightTheme2,
    // lightTheme3,
  ];
}

ThemeData originalThemeData = ThemeData();

ThemeData darkTheme = ThemeData(
  colorScheme: gDarkColorScheme,
  inputDecorationTheme: gInputDecorationTheme,
  textButtonTheme: gTextButtonThemeData,
  textTheme: gTextTheme,
  primaryTextTheme: gTextTheme,
);

ThemeData lightTheme1 = ThemeData(
  colorScheme: gColorScheme,
  inputDecorationTheme: gInputDecorationTheme,
  textButtonTheme: gTextButtonThemeData,
  textTheme: gTextTheme,
  primaryTextTheme: gTextTheme,
);

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

final gDarkColorScheme = originalThemeData.colorScheme.copyWith(
  primary: Colors.blue[700],
  secondary: Colors.yellow[700],
  brightness: Brightness.dark,
  background: Colors.blue[700],
);

final gColorScheme = originalThemeData.colorScheme.copyWith(
  primary: Colors.blue[300],
  secondary: Colors.yellow[300],
  brightness: Brightness.light,
  background: Colors.blue[300],
);

OutlineInputBorder outlineBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(style: BorderStyle.solid, color: color),
    borderRadius: BorderRadius.circular(8),
  );
}

final gInputDecorationTheme = InputDecorationTheme(
  labelStyle: TextStyle(color: Colors.grey),
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.only(left: 20, top: 17, bottom: 15, right: 20),
  border: outlineBorder(HexColors.fromHex('D1D5DB')),
  focusedBorder: outlineBorder(HexColors.fromHex('C84A97')),
  enabledBorder: outlineBorder(HexColors.fromHex('D1D5DB')),
  errorBorder: outlineBorder(HexColors.fromHex('DC2626')),
);

final gTextButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.blue,
    ), //button color
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
  ), //text (and icon)
);

final gTextTheme = originalThemeData.textTheme.apply(fontFamily: 'Roboto');
