import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SessionManager {
  factory SessionManager() => _shared;
  BuildContext? _context;

  SessionManager._();
  static final _shared = SessionManager._();

  void start(BuildContext context) {
    _context = context;
  }

  BuildContext? get getContext => _context;
}
