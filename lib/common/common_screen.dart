import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/components/common_header.dart';
import 'package:pomodoro_app/common/controller/drawer_controller.dart';

class CommonScreen<T> extends GetView<T> {
  final List<Widget> Function(T) body;
  final PreferredSizeWidget? appBar;
  final Future<void> Function()? onRefresh;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const CommonScreen({
    super.key,
    required this.body,
    this.appBar,
    this.onRefresh,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DrawerAppController>(
      init: DrawerAppController(),
      builder: (drawerController) => Scaffold(
        key: GlobalKey<ScaffoldState>(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: CommonHeader(),
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
                          _buildDrawerItem(Icons.timer, 'timer'),
                          _buildDrawerItem(Icons.coffee, 'break'),
                          _buildDrawerItem(Icons.pets, 'pets'),
                          _buildDrawerItem(Icons.add, 'wardrobe'),
                          _buildDrawerItem(Icons.shopping_basket, 'store'),
                          _buildDrawerItem(Icons.settings, 'settings'),
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
                child: RefreshIndicator(
                  color: Get.theme.colorScheme.secondary,
                  onRefresh: onRefresh ?? () async {},
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: crossAxisAlignment,
                      mainAxisAlignment: mainAxisAlignment,
                      children: body(controller),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Menü öğesine tıklandığında yapılacak işlemler
          },
          splashColor: Colors.black.withOpacity(0.1),
          highlightColor: Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
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
                  Icon(icon, color: Colors.black, size: 24),
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
