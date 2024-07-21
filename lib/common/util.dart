import 'package:get/get.dart';

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
