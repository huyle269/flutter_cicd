import 'package:flutter/material.dart';

class QuickActions {
  static void dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (currentFocus.isFirstFocus || currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
