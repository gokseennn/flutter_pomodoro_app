import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/components/common_header.dart';
import 'package:pomodoro_app/common/controller/drawer_controller.dart';

class CommonScreen<T> extends GetView<T> {
  final List<Widget> Function(T) body;
  final PreferredSizeWidget? appBar;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final String? title;

  const CommonScreen(
      {super.key,
      required this.body,
      this.appBar,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.title});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DrawerAppController>(
      init: DrawerAppController(),
      builder: (drawerController) => Scaffold(
        backgroundColor: Colors.white,
        key: GlobalKey<ScaffoldState>(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: CommonHeader(title: title),
        ),
        drawer: Drawer(
          child: Container(
            color: const Color(0xFFF5F5DC),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5DC), // Bej rengi
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildDrawerItem(
                              Image.asset("assets/icons/timer.png"), 'timer',
                              () {
                            Get.offAllNamed('/home');
                          }),
                          // _buildDrawerItem(
                          //     Image.asset("assets/icons/break.png"),
                          //     'break',
                          //     () {}),
                          // _buildDrawerItem(
                          //     Image.asset("assets/icons/pets.png"), 'pets', () {
                          //   Get.offAllNamed(MyPets.routeName);
                          // }),
                          // _buildDrawerItem(
                          //     Image.asset("assets/icons/wardrobe.png"),
                          //     'wardrobe', () {
                          //   Get.offAllNamed('/wardrobe');
                          // }),
                          // _buildDrawerItem(
                          //     Image.asset("assets/icons/store.png"), 'store',
                          //     () {
                          //   Get.offAllNamed('/store');
                          // }),
                          _buildDrawerItem(
                              Image.asset("assets/icons/settings.png"),
                              'settings', () {
                            Get.offAllNamed('/settings');
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Builder(
          builder: (BuildContext context) {
            Get.put<ScaffoldState>(Scaffold.of(context), permanent: false);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: crossAxisAlignment,
                    mainAxisAlignment: mainAxisAlignment,
                    children: body(controller),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDrawerItem(Widget icon, String title, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
            ),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Row(
                children: [
                  icon,
                  const SizedBox(width: 16),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
