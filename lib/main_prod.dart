import 'package:crm_app/core/app_config/app_config.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'main.dart';

void main() async {
  await ThemeManager.initialise();
  AppConfig appConfig = AppConfig(Environments.Production);
  initializeApp(appConfig);
}
