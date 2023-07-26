import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiProvider {
  final Dio _dio;

  ApiProvider(this._dio);

  Future<dynamic> get(String url, Map<String, dynamic> queryParams) async {
    try {
      final response =
          await _dio.get<dynamic>(url, queryParameters: queryParams);
      return response.data;
    } on DioException catch (e) {
      throw e.message ?? "Unable to process request";
    }
  }
}
