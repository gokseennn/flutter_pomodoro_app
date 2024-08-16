import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:pomodoro_app/common/services/api_service/model/http_interceptor.dart';
import 'package:pomodoro_app/common/services/api_service/model/http_method_enum.dart';
import 'package:pomodoro_app/common/services/api_service/model/response_type_enum.dart';

import '../i_api_provider.dart';

class DioApiProvider extends IApiProvider {
  late final Dio _dio;

  DioApiProvider({
    required super.baseUrl,
    required super.timeout,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
  }

  @override
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
  }) {
    try {
      return _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: method.name.toUpperCase(),
          headers: headers,
          sendTimeout: data != null ? timeout ?? super.timeout : null,
          receiveTimeout: timeout ?? super.timeout,
          responseType: ResponseType.values.firstWhereOrNull(
                (e) => e.name == responseType.name,
              ) ??
              ResponseType.json,
        ),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      if (e is DioException) {
        return Future.value(
          Response(
            requestOptions: e.requestOptions,
            statusCode: e.response?.statusCode ?? -1,
            statusMessage: e.response?.statusMessage ?? '',
            data: e.response?.data,
          ),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  void addInterceptor(HttpInterceptor httpInterceptor) {
    if (httpInterceptor.interceptor is InterceptorsWrapper) {
      httpInterceptors.add(httpInterceptor);
      final interceptor = httpInterceptors.last.interceptor;
      _dio.interceptors.add(interceptor);
      Get.log('Interceptor ${httpInterceptor.name} added');
    } else {
      throw Exception('Interceptor must be of type Interceptor (dio package)');
    }
  }

  @override
  void removeInterceptor(String interceptorName) {
    final interceptor =
        httpInterceptors.firstWhereOrNull((i) => i.name == interceptorName);
    if (interceptor != null) {
      _dio.interceptors.remove(interceptor.interceptor);
      Get.log('Interceptor ${interceptor.name} removed');
    } else {
      Get.log('Interceptor $interceptorName not found');
    }
  }
}
