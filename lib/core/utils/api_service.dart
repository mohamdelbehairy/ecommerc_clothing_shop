import 'package:dio/dio.dart';
import 'package:e_clot_shop/core/utils/secret_key.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> post({required String url, required data}) async {
    final response = await _dio.post(url,
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer ${SecretKey.stripeSecretKey}',
          },
        ));
    return response;
  }
}
