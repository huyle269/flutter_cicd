import 'package:crm_app/core/logging/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppInterceptorLogging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!kReleaseMode) {
      Logger.printOut(
          '*** Request ***\nREQUEST[${options.method}] => ${options.uri}');
      if (options.method == 'POST' || options.method == 'PUT') {
        Logger.printOut('*** PARAMS ***\n' + options.data.toString());
      }
      if (options.method == 'GET') {
        Logger.printOut('*** PARAMS ***\n' + options.queryParameters.toString());
      }
      Logger.printOut('*** HEADERS ***\n' + options.headers.toString());
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!kReleaseMode) {
      Logger.printOut(
          '*** Response ***\nRESPONSE[${response.statusCode}] => ${response.realUri}\n${response.data.toString()}');
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (!kReleaseMode) {
      Logger.printOut(
          '*** Error ***\nERROR[${err.response?.data?['code'] ?? err.response?.statusCode}] => ${err.requestOptions.uri} WITH MESSAGE: ${err.response?.data?['message'] ?? err.message}');
    }
    return super.onError(err, handler);
  }
}
