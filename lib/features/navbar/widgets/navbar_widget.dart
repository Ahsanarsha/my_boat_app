import 'package:my_boat/features/navbar/controllers/navbar_controller.dart';
import 'package:my_boat/features/navbar/models/navbar_model.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/clickable.dart';
import 'package:my_boat/widgets/dynamic_vertical_space.dart';
import 'package:my_boat/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NavbarWidget extends StatelessWidget {
  final List<NavbarModel> data;
  const NavbarWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(
      assignId: true,
      id: NavbarController.builderKey,
      builder: (controller) {
        return SafeArea(
          bottom: (MediaQuery.of(context).padding.bottom > 0) ? false : true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: AppColors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int index = 0; index < data.length; index++)
                      Expanded(
                        child: Clickable(
                          onTap: () async {
                            controller.updateNavBarIndex(index);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: controller.navBarIndex == index
                                    ? 3.5.h
                                    : 0.5.h,
                                width: double.infinity,
                                color: controller.navBarIndex == index
                                    ? AppColors.primary
                                    : AppColors.c8E8E8E,
                              ),
                              const VerticalSpace(height: 8),
                              Image.asset(
                                data[index].assetIconPath,
                                color: controller.navBarIndex == index
                                    ? AppColors.primary
                                    : AppColors.c8E8E8E,
                                scale: 4,
                              ),
                              Text(
                                data[index].text,
                                style: mediumTextStyle(
                                  fontSize: 12,
                                  color: controller.navBarIndex == index
                                      ? AppColors.primary
                                      : AppColors.c8E8E8E,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const VerticalSpace(height: 10),
                              const DynamicVerticalSpace(height: 10),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
