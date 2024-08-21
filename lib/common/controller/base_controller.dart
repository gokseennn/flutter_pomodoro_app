import 'package:get/get.dart';

abstract class BaseController extends GetxController
    with GetTickerProviderStateMixin {
  // RxStatus nesnesi olarak tanımlanmış
  var status = RxStatus.loading().obs;

  @override
  void onInit() async {
    await _initialize();
    super.onInit();
  }

  Future<void> _initialize() async {
    await futurize(initController);
  }

  Future<void> initController() async {}

  Future<void> futurize(Future<void> Function() action) async {
    try {
      _setLoading(RxStatus.loading());
      await action();
    } catch (e) {
      _setLoading(RxStatus.error(
          'An error occurred')); // Hata durumunu daha iyi yönetmek için
    } finally {
      _setLoading(RxStatus.success());
    }
  }

  void _setLoading(RxStatus newStatus) {
    status.value = newStatus;
  }
}
