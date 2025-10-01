# 🍅 Pomodoro & Görev Yönetimi

<div align="center">

**Flutter Uygulaması**

Clean Architecture • GetX • Modüler Tasarım

[Özellikler](#-özellikler) • [Mimari](#️-mimari) • [Kurulum](#-kurulum) • [Kullanım](#-kullanım)

</div>

---

## 📖 Genel Bakış

**Flutter** ve **GetX** ile geliştirilmiş, Pomodoro tekniği ve görev yönetimi özelliklerini bir araya getiren yüksek performanslı mobil uygulama. Proje, **Clean Architecture** prensipleri ve katmanlı servis yapısıyla production-ready bir mimari sunar.

### 🎯 Ne Sunar?

Kullanıcıların odaklanma sürelerini optimize etmelerine, tamamladıkları çalışma seanslarını kaydetmelerine ve detaylı istatistiklerini takip etmelerine olanak tanır. Bakım kolaylığı ve ölçeklenebilirlik odaklı **modüler mimari** ile tasarlanmıştır.

---

## ✨ Özellikler

### 🔐 Güvenlik & Veri Yönetimi

- **Token Tabanlı Kimlik Doğrulama**
  - JWT/Token'ın güvenli yerel depolamada saklanması
  - Otomatik yetkilendirme ile `AuthService` entegrasyonu

- **Anlık Veri Senkronizasyonu**
  - Her çalışma seansı otomatik API'ya kaydedilir
  - `AddStudyDto` ile `PomodoroRepository` üzerinden veri transferi

### 📊 Analitik & Raporlama

- **Detaylı İstatistikler**
  - Günlük, haftalık ve aylık çalışma takibi
  - Tarih bazlı veri görselleştirme
  - `StatisticRepository` ve `DayStatistics` modelleri

---

## 🏗️ Mimari

### 🎯 Teknoloji Stack

```
Flutter • GetX • Dio • Clean Architecture
```

### 📐 Mimari Prensipler

#### **1. Clean Architecture & Katmanlı Yapı**

Proje, **Katmanlı (Layered)** ve **Clean Architecture** prensiplerine tam uyum sağlar:

- ✅ Separation of Concerns (İlgi Alanlarının Ayrılması)
- ✅ Dependency Inversion (Bağımlılık Tersine Çevirme)
- ✅ Single Responsibility (Tek Sorumluluk)
- ✅ Testable & Maintainable (Test Edilebilir & Sürdürülebilir)

#### **2. State Management & MVC**

**GetX** kullanılarak reaktif ve performanslı state management:

- **Durum Yönetimi:** Reaktif veri akışı ve otomatik UI güncellemeleri
- **Bağımlılık Enjeksiyonu:** `Get.put()`, `Get.lazyPut()` ile DI pattern
- **Rota Yönetimi:** `GetMaterialApp` ve `Get.toNamed()` ile navigasyon
- **Modüler MVC:** Her özellik için ayrı `Controller`, `Repository`, `Model`, `Binding`, `View`

---

## 🎨 Tasarım Desenleri

### 🔷 Base Controller Pattern

Tüm controller'lar merkezi **`BaseController`**'dan kalıtım alır:

```dart
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

### 🌐 Merkezi API Servis Mimarisi

**`ApiService`** - Dio Wrapper ile güçlendirilmiş HTTP yönetimi:

- **Global Loading:** Tüm API çağrıları için merkezi spinner
- **Merkezi Hata Yönetimi:** `onError` callback ile otomatik AlertDialog
- **Provider Soyutlaması:** `IApiProvider` interface ile kütüphane bağımsızlığı
- **Response Extension:** `response?.isOk ?? false` gibi okunabilir uzantılar

### 🌍 Ortam Yönetimi

Dinamik ortam yapılandırması:

```bash
# Development ortamı
flutter run --dart-define=environment=development

# Production ortamı
flutter run --dart-define=environment=production
```

---

## 📁 Proje Yapısı

```
lib/
├── 📂 common/                          # Ortak bileşenler ve servisler
│   ├── 📂 components/                  # Paylaşılan UI bileşenleri
│   │   ├── CommonScreen               # Genel ekran şablonu
│   │   ├── Shimmer                    # Yükleme animasyonları
│   │   ├── ApiLoading                 # API yükleme göstergesi
│   │   └── BottomNavBar               # Alt navigasyon çubuğu
│   │
│   ├── 📂 controller/                  # Ortak controller mantığı
│   │   ├── BaseController             # Temel controller sınıfı
│   │   └── BottomNavController        # Navigasyon yönetimi
│   │
│   ├── 📂 environment/                 # Ortam yapılandırmaları
│   │   ├── ProdEnvironment            # Production ayarları
│   │   └── DevEnvironment             # Development ayarları
│   │
│   ├── 📂 services/                    # Temel servisler
│   │   ├── ApiService                 # HTTP servisi (Dio wrapper)
│   │   ├── AuthService                # Kimlik doğrulama
│   │   ├── StorageService             # Yerel depolama
│   │   └── NotificationService        # Bildirim yönetimi
│   │
│   └── 📄 util.dart                    # Yardımcı sınıflar ve uzantılar
│       └── (ResponseExtension, FuturizeHelper Mixin)
│
├── 📂 general-ms/                      # Genel modüller
│   └── 📂 pomodoro/                    # Pomodoro özelliği
│       ├── 📂 controller/
│       │   ├── PomodoroController     # İş mantığı
│       │   └── PomodoroRepository     # Veri yönetimi
│       ├── 📂 model/
│       │   └── AddStudyDto            # Veri transfer objesi
│       └── 📂 view/
│           ├── PomodoroScreen         # Ana ekran
│           └── CircularTimer          # Zamanlayıcı bileşeni
│
└── 📂 user-ms/                         # Kullanıcıya özel modüller
    └── 📂 statistics/                  # İstatistik özelliği
        ├── 📂 controller/
        │   ├── StatisticController    # İş mantığı
        │   └── StatisticRepository    # Veri yönetimi
        └── 📂 model/
            ├── DayStatistics          # Günlük istatistikler
            └── ChartData              # Grafik verileri
```

