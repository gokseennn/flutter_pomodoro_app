import 'package:get/get.dart';
import 'package:pomodoro_app/common/services/api_service/api_service.dart';
import 'package:pomodoro_app/common/services/api_service/model/http_method_enum.dart';
import 'package:pomodoro_app/common/util.dart';
import 'package:pomodoro_app/user-ms/statistics/model/day_statistics_model.dart';

class StatisticRepository {
  final _apiService = Get.find<ApiService>();

  Future<List<DayStatistics>> getStatistics() async {
    final response = await _apiService.request(
      path: "http://localhost:5111/Study/getStudies",
      method: HttpMethod.get,
    );

    if (response?.isOk ?? false) {
      // 'data' alanını kontrol et ve içindeki listeyi DayStatistics modellerine dönüştür.
      final List<dynamic> dataList = response?.data['data'] as List<dynamic>;

      return dataList
          .map((item) => DayStatistics.fromJson(item as Map<String, dynamic>))
          .toList();
    }

    return <DayStatistics>[];
  }
}
