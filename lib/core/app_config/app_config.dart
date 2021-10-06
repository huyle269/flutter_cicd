enum Environments {
  Production,
  Development,
  Stagging,
}

class AppConfig {
  Environments flavor = Environments.Development;

  AppConfig._internal();
  static final AppConfig shared = AppConfig._internal();
  factory AppConfig(flavor) {
    AppConfig.shared.flavor = flavor;
    return AppConfig.shared;
  }

  String get baseURL {
    switch (flavor) {
      case Environments.Development:
        return 'http://localhost:8088';
      case Environments.Stagging:
        return 'baseurl for stag';
      case Environments.Production:
        return 'baseurl for prod';
    }
  }

  String get basicAuthen {
    switch (flavor) {
      case Environments.Development:
        return 'Basic Y3JtOmNybVNlY3JldA==';
      case Environments.Stagging:
        return 'basicAuthen for stag';
      case Environments.Production:
        return 'basicAuthen for prod';
    }
  }
}
