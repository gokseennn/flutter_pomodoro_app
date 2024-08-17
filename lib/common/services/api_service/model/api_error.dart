import 'package:dio/dio.dart';

class ApiError {
  final int code;
  final String message;

  ApiError({required this.code, required this.message});

  factory ApiError.fromDioException(DioException e) {
    final errors = e.response?.data['errors'];
    String errorMessage = e.response?.statusMessage ?? '';

    if (errors != null && errors is List && errors.isNotEmpty) {
      final firstError = errors.first;
      if (firstError['messages'] is List && firstError['messages'].isNotEmpty) {
        errorMessage = firstError['messages'].first.toString();
      }
    }

    return ApiError(
      code: e.response?.statusCode ?? -1,
      message: errorMessage,
    );
  }
}
