import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';


class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = "Bearer :sample";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(jsonEncode(response.data));
    super.onResponse(response, handler);
  }
}
