import 'package:crm_app/representation/screens/main_screen.dart';
import 'package:crm_app/representation/screens/intro_screen.dart';
import 'package:crm_app/representation/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repository/authen_repository.dart';

final Map<String, WidgetBuilder> routes = {
  IntroScreen.routeName: (context) => IntroScreen(),
  LoginScreen.routeName: (context) => LoginScreen(authenRepositoryImpl: context.read<AuthenRepositoryImpl>()),
  MainScreen.routeName: (context) => MainScreen(),
};
