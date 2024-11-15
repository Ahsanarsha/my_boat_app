import 'package:my_boat/features/navbar/controllers/navbar_controller.dart';
import 'package:my_boat/features/navbar/models/navbar_model.dart';
import 'package:my_boat/features/navbar/views/home_screen/home_screen.dart';
import 'package:my_boat/features/navbar/widgets/navbar_widget.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  final Widget designNotImplemented = const Center(
    child: Text('Feature coming soon'),
  );

  late NavbarController navbarController;

  @override
  void initState() {
    navbarController = Get.put(NavbarController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<NavbarController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<NavbarModel> data = [
      NavbarModel(
        assetIconPath: AssetIcons.home,
        text: AppLocalizations.of(context)!.home,
        view: const HomeScreen(),
      ),
      NavbarModel(
        assetIconPath: AssetIcons.search,
        text: AppLocalizations.of(context)!.searchNav,
        view: const Text('Search Screen'),
      ),
      NavbarModel(
        assetIconPath: AssetIcons.message,
        text: AppLocalizations.of(context)!.messages,
        view: const Text('Messages Screen'),
      ),
      NavbarModel(
        assetIconPath: AssetIcons.profile,
        text: AppLocalizations.of(context)!.profile,
        view: const Text('Profile Screen'),
      ),
    ];

    return GetBuilder<NavbarController>(
      assignId: true,
      id: NavbarController.builderKey,
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.cF9F9F9,
          body: PageView.builder(
            controller: navbarController.pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            onPageChanged: (value) {},
            itemBuilder: (BuildContext context, int index) {
              return data[index].view;
            },
          ),
          bottomNavigationBar: NavbarWidget(data: data),
        );
      },
    );
  }
}
