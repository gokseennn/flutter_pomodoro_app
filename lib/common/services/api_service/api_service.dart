import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:pomodoro_app/common/services/api_service/i_api_provider.dart';
import 'package:pomodoro_app/common/services/api_service/model/api_error.dart';
import 'package:pomodoro_app/common/services/api_service/model/api_provider_enum.dart';
import 'package:pomodoro_app/common/services/api_service/model/http_interceptor.dart';
import 'package:pomodoro_app/common/services/api_service/model/http_method_enum.dart';
import 'package:pomodoro_app/common/services/api_service/model/response_type_enum.dart';
import 'package:pomodoro_app/common/services/api_service/providers/dio_api_provider.dart';
import 'package:pomodoro_app/common/services/auth_service/auth_service.dart';

class ApiService extends GetxService {
  AuthService? _authService;
  late final IApiProvider _apiProvider;
  late final Function(ApiError error)? _onError;
  late final Widget? _loader;

  final RxInt _showLoaderProcess = 0.obs;
  bool _loaderVisible = false;

  ApiService({
    required ApiProvider provider,
    required String baseUrl,
    required Duration timeout,
    Function(ApiError error)? onError,
    Widget? loader,
  }) {
    _loader = loader;
    _onError = onError;

    switch (provider) {
      case ApiProvider.dio:
        _apiProvider = DioApiProvider(
          baseUrl: baseUrl,
          timeout: timeout,
        );
        break;
    }
    _showLoaderProcess.listen(_loaderListener);
  }

  Future<Response?> request({
    required String path,
    required HttpMethod method,
    ApiResponseType responseType = ApiResponseType.json,
    Object? data,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    Duration? timeout,
    bool showLoader = false,
    bool showError = true,
  }) async {
    _initializeAuthService();
    if (_authService != null && headers == null && _authService!.user != null) {
      headers = ({"Authorization": _authService!.user!.token});
    }
    if (showLoader) {
      _showLoaderProcess.value++;
    }
    try {
      final response = await _apiProvider.request(
        path: path,
        method: method,
        responseType: responseType,
        data: data,
        queryParameters: queryParameters,
        headers: headers,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        timeout: timeout,
      );
      if (showLoader) {
        _showLoaderProcess.value--;
      }
      final statusCode = response.statusCode ?? -1;
      if (statusCode >= 200 && statusCode <= 299) {
        return response;
      } else {
        if (statusCode != 401 &&
            statusCode != 403 &&
            statusCode != 404 &&
            statusCode != 500) {
          _onApiError(response, showError, statusCode);
        }
      }
    } catch (e) {
      if (showLoader) {
        _showLoaderProcess.value--;
      }
      if (e is DioException &&
          e.response != null &&
          e.response!.statusCode != 401 &&
          e.response!.statusCode != 403 &&
          e.response!.statusCode != 404 &&
          e.response!.statusCode != 500) {
        if (showError) {
          _onError?.call(ApiError.fromDioException(e));
        }
      }
    }
    return null;
  }

  void _initializeAuthService() {
    try {
      _authService = Get.find<AuthService>();
    } catch (e) {
      _authService = null;
    }
  }

  void addInterceptor(HttpInterceptor interceptor) {
    _apiProvider.addInterceptor(interceptor);
  }

  void removeInterceptor(String interceptorName) {
    _apiProvider.removeInterceptor(interceptorName);
  }

  List<String> get interceptors => _apiProvider.interceptors;

  void _onApiError(Response response, bool showError, int statusCode) {
    if (showError) {
      _onError?.call(
        ApiError(
          code: statusCode,
          message: response.data != null
              ? response.data.toString()
              : response.statusMessage ?? 'Unknown error',
        ),
      );
    } else {
      throw ApiError(
        code: statusCode,
        message: response.data != null
            ? response.data.toString()
            : response.statusMessage ?? 'Unknown error',
      );
    }
  }

  void _loaderListener(processCount) {
    _showLoaderProcess.listen((processCount) {
      if (processCount > 0 && !_loaderVisible) {
        _loaderVisible = true;
        Get.dialog(
          PopScope(
            canPop: false,
            child: _loader ??
                const Center(
                  child: CircularProgressIndicator(),
                ),
          ),
          name: 'API_LOADER',
          barrierDismissible: false,
        );
      } else if (processCount <= 0 && _loaderVisible) {
        _loaderVisible = false;
        Get.back();
      }
    });
  }
}
