// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:device_info_plus/device_info_plus.dart';

// class NotificationService extends GetxService with WidgetsBindingObserver {
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   @override
//   void onInit() {
//     super.onInit();
//     WidgetsBinding.instance.addObserver(this);
//     _initNotification();
//   }

//   @override
//   void onClose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.onClose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused) {
//       _showNotification();
//     }
//   }

//   void _initNotification() {
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     const initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     // iOS için DarwinInitializationSettings kullanıyoruz
//     const initializationSettingsIOS = DarwinInitializationSettings();

//     const initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> _showNotification() async {
//     final deviceInfo = DeviceInfoPlugin();
//     String deviceName = 'Unknown';
//     String deviceModel = 'Unknown';

//     if (GetPlatform.isAndroid) {
//       var androidInfo = await deviceInfo.androidInfo;
//       deviceName = androidInfo.brand;
//       deviceModel = androidInfo.model;
//     } else if (GetPlatform.isIOS) {
//       var iosInfo = await deviceInfo.iosInfo;
//       deviceName = iosInfo.name;
//       deviceModel = iosInfo.model;
//     }

//     const androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       channelDescription: 'your_channel_description', // Burayı ekleyin
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );

//     // iOS için DarwinNotificationDetails kullanıyoruz
//     const iOSPlatformChannelSpecifics = DarwinNotificationDetails();

//     const platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics,
//     );

//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Arka Planda: $deviceName',
//       'Model: $deviceModel - Uygulama arka planda çalışıyor',
//       platformChannelSpecifics,
//     );
//   }
// }
