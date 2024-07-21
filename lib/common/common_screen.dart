import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/components/common_header.dart';

class CommonScreen<T> extends GetView<T> {
  final Widget? loader;
  final String? rightTitle;
  final ScrollController? scrollController;
  final List<Widget> Function(T) body;
  final String? controllerTag;
  final double bottomPadding;
  final bool showSearchBar;
  final bool showNavbar;
  final bool showHeader;
  final int selectedBottomSheetIndex;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Future<void> Function()? onRefresh;
  final double horizontalPadding;
  final bool addBottomPadding;

  const CommonScreen({
    super.key,
    this.loader,
    this.rightTitle,
    this.scrollController,
    required this.body,
    this.controllerTag,
    this.bottomPadding = 10,
    this.showSearchBar = true,
    this.showNavbar = true,
    this.showHeader = true,
    this.selectedBottomSheetIndex = 0,
    this.bottomNavigationBar,
    this.appBar,
    this.onRefresh,
    this.horizontalPadding = 10,
    this.addBottomPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollCtrl = scrollController ?? ScrollController();
    final showFloatingCart = true.obs;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: CommonHeader()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SafeArea(
          child: RefreshIndicator(
            edgeOffset: onRefresh != null
                ? Get.mediaQuery.padding.top +
                    (appBar == null ? (showSearchBar ? 100 : 50) : -50)
                : -1000,
            color: Get.theme.colorScheme.secondary,
            onRefresh: onRefresh ?? () async {},
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: scrollCtrl,
              slivers: [
                if (controller is StateMixin)
                  SliverToBoxAdapter(
                    child: (controller as StateMixin).obx(
                      (state) => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: body(controller).length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(
                            bottom: body(controller).length == 1
                                ? 0
                                : bottomPadding,
                            left: horizontalPadding,
                            right: horizontalPadding,
                          ),
                          child: body(controller)[index],
                        ),
                      ),
                      onLoading: Center(
                        child: loader ??
                            const CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                      ),
                    ),
                  )
                else
                  SliverList.builder(
                    itemCount: body(controller).length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                        bottom:
                            body(controller).length == 1 ? 0 : bottomPadding,
                        left: horizontalPadding,
                        right: horizontalPadding,
                      ),
                      child: body(controller)[index],
                    ),
                  ),
                if (addBottomPadding)
                  SliverToBoxAdapter(
                    child: SizedBox(
                        height: bottomNavigationBar == null
                            ? (Get.context!.mediaQueryPadding.bottom +
                                Get.context!.height * 0.12)
                            : 0),
                  ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: bottomNavigationBar == null && showNavbar
      //     ? Obx(
      //         () => AnimatedScale(
      //           scale: showFloatingCart.value ? 1 : 0,
      //           duration: 200.milliseconds,
      //           child: const CommonFloatingCart(),
      //         ),
      //       )
      //     : null,
      // bottomSheet: bottomNavigationBar ??
      //     (showNavbar
      //         ? CommonFooter(
      //             scrollController: scrollCtrl,
      //             selectedIndex: selectedBottomSheetIndex,
      //             showFloatingCart: showFloatingCart,
      //           )
      //         : null),
    );
  }
}
