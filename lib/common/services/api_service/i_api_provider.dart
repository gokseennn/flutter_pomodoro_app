import 'package:dio/dio.dart';
import 'package:pomodoro_app/common/services/api_service/model/http_interceptor.dart';
import 'package:pomodoro_app/common/services/api_service/model/http_method_enum.dart';
import 'package:pomodoro_app/common/services/api_service/model/response_type_enum.dart';

abstract class IApiProvider {
  final String baseUrl;
  final Duration timeout;
  final List<HttpInterceptor> httpInterceptors = []; // Erişimi değiştirdik

  IApiProvider({
    required this.baseUrl,
    required this.timeout,
  });

  Future<Response> request({
    required String path,
    required HttpMethod method,
    ApiResponseType responseType = ApiResponseType.json,
    Object? data,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    Duration? timeout,
  });

  void addInterceptor(HttpInterceptor httpInterceptor);

  void removeInterceptor(String interceptorName);

  List<String> get interceptors => httpInterceptors.map((e) => e.name).toList();
}
