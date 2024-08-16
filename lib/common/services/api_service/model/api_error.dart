import 'package:dio/dio.dart';

class ApiError {
  final int code;
  final String message;

  ApiError({required this.code, required this.message});

  factory ApiError.fromDioException(DioException e) {
    final exception = e.response?.data['exception']['response'] ??
        e.response?.data?['exception'];
    return ApiError(
      code: e.response?.statusCode ?? -1,
      message: exception != null
          ? exception['message'] is List
              ? (exception['message'] as List).first.toString()
              : exception['message'] ?? e.response?.statusMessage ?? ''
          : e.response?.statusMessage ?? '',
    );
  }
}
