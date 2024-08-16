import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

mixin FuturizeHelper on GetxController, StateMixin {
  Future<T?> futurize<T>(Future<T?> Function() futureFunction) {
    change(null, status: RxStatus.loading());
    return futureFunction().then((value) {
      change(value,
          status: value != null ? RxStatus.success() : RxStatus.empty());
      return value;
    }).catchError((error) {
      change(null, status: RxStatus.error(error.toString()));
      return null;
    });
  }
}

extension ResponseExtension on Response {
  bool get isOk =>
      statusCode != null && statusCode! >= 200 && statusCode! <= 299;
}
