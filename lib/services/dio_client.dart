import 'dart:async';
import 'package:dio/dio.dart';
import 'package:tracking_partner/services/logger_interceptor.dart';

class DioClient {
  late final Dio _dio;
  DioClient()
      : _dio = Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        )..interceptors.addAll([LoggerInterceptor()]);

  // GET METHOD
  Future<Response> get(String url) async {
    try {
      final Response response = await _dio.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // POST METHOD
  Future<Response> post(String url, {dynamic body, dynamic headers}) async {
    try {
      if (headers != null) {
        _dio.options = BaseOptions(headers: headers);
      }
      final Response response = await _dio.post(url, data: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PUT METHOD
  Future<Response> put(String url, {dynamic body}) async {
    try {
      final Response response = await _dio.put(url, data: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE METHOD
  Future<Response> delete(String url, {dynamic body}) async {
    try {
      final Response response = await _dio.delete(url, data: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
