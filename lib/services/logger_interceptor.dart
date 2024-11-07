import 'dart:developer';

import 'package:dio/dio.dart';

/// This interceptor is used to show request and response logs
class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Error type: ${err.error}\n\nError message: ${err.message}'); //Debug log

    handler.next(err); //Continue with the Error
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    log('${options.method} request ==> $requestPath'); //Info log

    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('Status Code: ${response.statusCode}\n\nStatus Message: ${response.statusMessage}\n\nData: ${response.data}'); // Debug log

    handler.next(response); // continue with the Response
  }
}
