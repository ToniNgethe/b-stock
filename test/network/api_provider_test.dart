import 'package:bstock/core/network/api_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_provider_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  group('ApiProvider', () {
    late MockDio mockDio;
    late ApiProvider apiProvider;

    setUp(() {
      mockDio = MockDio();
      apiProvider = ApiProvider(mockDio);
    });

    test('returns data when request succeeds', () async {
      final response = Response(
        requestOptions: RequestOptions(path: '/test'),
        data: {'result': 'ok'},
      );

      when(mockDio.get<dynamic>('/test', queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => response);

      final result = await apiProvider.get('/test', {});
      expect(result, {'result': 'ok'});
    });

    test('throws message when DioException occurs', () async {
      final exception = DioException(
        requestOptions: RequestOptions(path: '/test'),
        message: 'error',
      );
      when(mockDio.get<dynamic>('/test', queryParameters: anyNamed('queryParameters')))
          .thenThrow(exception);

      expect(() => apiProvider.get('/test', {}), throwsA('error'));
    });
  });
}
