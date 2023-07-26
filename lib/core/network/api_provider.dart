import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiProvider {
  final Dio _dio;

  ApiProvider(this._dio);

  Future<dynamic> get(String url) async {
    try {
      final response = await _dio.get<dynamic>(url);
      return response.data;
    } on DioException catch (e) {
      throw e.message ?? "Unable to process request";
    }
  }
}
