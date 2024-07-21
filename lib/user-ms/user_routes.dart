import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pomodoro_app/user-ms/my_pets/controller/my_pets_binding.dart';
import 'package:pomodoro_app/user-ms/my_pets/view/my_pets.dart';
import 'package:pomodoro_app/user-ms/store/controller/store_binding.dart';
import 'package:pomodoro_app/user-ms/store/view/store_screen.dart';
import 'package:pomodoro_app/user-ms/wardrobe/controller/wardrobe_binding.dart';
import 'package:pomodoro_app/user-ms/wardrobe/view/wardrobe_screen.dart';

class UserRoutes {
  static final routes = [
    GetPage(
        name: MyPets.routeName,
        page: () => const MyPets(),
        binding: MyPetsBinding()),
    GetPage(
        name: WardrobeScreen.routeName,
        page: () => const WardrobeScreen(),
        binding: WardrobeBinding()),
    GetPage(
        name: StoreScreen.routeName,
        page: () => const StoreScreen(),
        binding: StoreBinding())
  ];
}
