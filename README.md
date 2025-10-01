# 🍅 Pomodoro & Görev Yönetimi (Clean/Layered GetX)

**Flutter** ve **GetX** ile geliştirilmiş, Pomodoro tekniği ve görev yönetimi özelliklerini bir araya getiren yüksek performanslı ve modüler bir mobil uygulama. Proje, **Clean Architecture** prensipleri ve katmanlı servis yapısıyla, **Production-Ready** bir mimari olarak tasarlanmıştır.

---

## 📱 Proje Hakkında

Uygulama, kullanıcıların odaklanma sürelerini optimize etmelerine, tamamladıkları çalışma seanslarını kaydetmelerine ve istatistiklerini takip etmelerine olanak tanır. Proje, bakım kolaylığı ve ölçeklenebilirlik göz önünde bulundurularak **Modüler Mimari** ile tasarlanmıştır.

---

## 🌟 Temel Özellikler

* **Gelişmiş Pomodoro Sayacı:** Özelleştirilebilir odaklanma ve mola süreleri (`PomodoroController` ve `selectWorkTime` metodu).
* **Özel Çizim (CustomPainter) Zamanlayıcı:** Görsel olarak zengin, pürüzsüz animasyonlu dairesel geri sayım göstergesi (`CircularTimer`).
* **Anlık Veri Senkronizasyonu:** Tamamlanan her çalışma seansının **API'ya kaydedilmesi** (`AddStudyDto` ile `PomodoroRepository`).
* **Yerel Bildirimler:** Seans bittiğinde kullanıcıyı uyaran, platformlar arası bildirim yönetimi. (**`NotificationService`** ve **`permission_handler`** entegrasyonu).
* **Token ve Oturum Yönetimi:** JWT/Token'ın güvenli **yerel depolamada** saklanması ve otomatik yetkilendirme (`AuthService` ve `StorageService`).
* **Detaylı İstatistikler:** Çalışma geçmişini, günlük bazda çalışılan dakika ve tarih bazlı verilerle takip etme (`StatisticRepository` ve `DayStatistics`).

---

## 🏗️ Teknik Mimari

Proje, **Flutter**, **Dio** ve **GetX** kombinasyonu ile **Katmanlı (Layered) / Clean Architecture** prensiplerine tam uyum sağlayarak geliştirilmiştir.

### State Management & MVC Yapısı

* **GetX:** Reaktif **Durum Yönetimi (State Management)**, **Bağımlılık Enjeksiyonu (DI)** ve **Rota Yönetimi** (`GetMaterialApp`, `Get.toNamed`).
* **Modüler MVC:** Her bir özellik (Pomodoro, İstatistik) kendi içinde **`Controller`**, **`Repository`**, **`Model`**, **`Binding`** ve **`View`** sınıflarıyla ayrı modüller halinde tutulmuştur.

### Mimari Tasarım Desenleri

#### 1. Base Controller Pattern

Tüm Controller'lar **`BaseController`**'dan kalıtım alır. Bu yapı, otomatik durum yönetimi (yüklenme, hata, başarı) sağlar.

```dart
// BaseController'dan bir alıntı
abstract class BaseController extends GetxController with GetTickerProviderStateMixin {
  var status = RxStatus.loading().obs;

  Future<void> futurize(Future<void> Function() action) async {
    try {
      status.value = RxStatus.loading();
      await action();
    } catch (e) {
      status.value = RxStatus.error('An error occurred');
    } finally {
      status.value = RxStatus.success();
    }
  }
}
```

Merkezi API Servis Mimarisi

ApiService (Dio Wrapper): HTTP kütüphanesi (Dio) üzerine soyutlanmış, özel bir wrapper.

Global Loading Yönetimi: Tüm API çağrıları için merkezi bir ApiLoading (global spinner) mekanizması entegre edilmiştir.

Merkezi Hata Yönetimi: Tüm HTTP hataları yakalanır ve main.dart içinde tanımlanan onError callback'i ile kullanıcıya anında AlertDialog ile gösterilir.

Provider Soyutlaması (IApiProvider): Dio kütüphanesini soyutlayarak gelecekte farklı bir HTTP kütüphanesine geçişi kolaylaştırır.

Response Extension: Okunabilir kod için response?.isOk ?? false gibi özel uzantılar (util.dart dosyasında) kullanılır.

Ortam Yönetimi (Environment)

Uygulama, --dart-define=environment= bayrağı ile dinamik olarak development ve production ortamlarında çalıştırılabilir.
Proje Yapısı
Proje, özellik tabanlı (Feature-based) ve katmanlı (Layered) bir yaklaşımla organize edilmiştir:

lib/
├── common/
│   ├── components/                 # CommonScreen, Shimmer, ApiLoading, BottomNavBar
│   ├── controller/                 # BaseController, BottomNavController
│   ├── environment/                # Prod/Dev Environment configs
│   ├── services/                   # API, Auth, Storage, Notification Services
│   └── util.dart                   # ResponseExtension, FuturizeHelper Mixin
├── general-ms/                     # Genel Uygulama Modülleri (Pomodoro, Home, Welcome)
│   └── pomodoro/                   # Pomodoro özelliği
│       ├── controller/           # PomodoroController, PomodoroRepository
│       ├── model/                  # AddStudyDto
│       └── view/                   # PomodoroScreen, CircularTimer
└── user-ms/                       # Kullanıcıya Özgü Modüller (Statistics, Profile, Auth)
    └── statistics/                 # İstatistik özelliği
        ├── controller/           # StatisticController, StatisticRepository
        └── model/                  # DayStatistics, ChartData
