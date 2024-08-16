import 'package:dio/dio.dart';

class ApiError {
  final int code;
  final String message;

  ApiError({required this.code, required this.message});

  factory ApiError.fromDioException(DioException e) {
    // exception verisini alın
    final exception =
        e.response?.data['errors']['messages'] ?? e.response?.data?['errors'];

    // Başlangıçta hata mesajını boş bir string olarak ayarlayın
    String errorMessage = '';

    // exception verisini kontrol edin ve uygun şekilde işleyin
    if (exception is List) {
      // Eğer exception bir Listeyse ve mesajları içeriyorsa ilk elemanı al
      errorMessage = exception.first.toString();
    } else if (exception is Map) {
      // Eğer exception bir Map ise ve "message" anahtarına sahipse işle
      if (exception['message'] is List) {
        errorMessage = (exception['message'] as List).first.toString();
      } else if (exception['message'] is String) {
        errorMessage = exception['message'];
      }
    } else if (exception is String) {
      // Eğer exception direk bir string ise bunu mesaj olarak ayarla
      errorMessage = exception;
    } else {
      // Hiçbir durumda değilse varsayılan hata mesajını kullan
      errorMessage = e.response?.statusMessage ?? 'An unknown error occurred';
    }

    return ApiError(
      code: e.response?.statusCode ?? -1,
      message: errorMessage,
    );
  }
}
