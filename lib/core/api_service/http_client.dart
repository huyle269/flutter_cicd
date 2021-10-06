import 'package:dio/dio.dart';

import '../app_config/app_config.dart';
import '../logging/intercepter_logging.dart';

class HttpClient {
  HttpClient._internal();

  static HttpClient shared = HttpClient._internal();

  Dio? _repository;

  static Dio getRepository() {
    shared._repository ??= generateRepository();
    return shared._repository!;
  }

  static Dio generateRepository() => Dio(
        BaseOptions(
          baseUrl: AppConfig.shared.baseURL,
          connectTimeout: 15000,
          receiveTimeout: 15000,
          responseType: ResponseType.json,
          headers: {
            Headers.contentTypeHeader: 'application/json',
            'Authorization': AppConfig.shared.basicAuthen,
          },
        ),
      )..interceptors.add(AppInterceptorLogging());

  static void setAuthorization(String? jwt) {
    if (shared._repository != null) {
      shared._repository!.options.headers = {
        Headers.contentTypeHeader: 'application/json',
        'Authorization': 'Bearer ' + jwt!,
      };
    }
  }

  static void setBasicAuthorization() {
    if (shared._repository != null) {
      shared._repository!.options.headers = {
        Headers.contentTypeHeader: 'application/json',
        'Authorization': AppConfig.shared.basicAuthen,
      };
    }
  }
}
