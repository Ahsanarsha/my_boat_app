// import 'package:my_boat/features/navbar/controllers/navbar_controller.dart';
// import 'package:my_boat/features/navbar/models/navbar_model.dart';
// import 'package:my_boat/themes/colors.dart';
// import 'package:my_boat/themes/styles.dart';
// import 'package:my_boat/widgets/clickable.dart';
// import 'package:my_boat/widgets/dynamic_vertical_space.dart';
// import 'package:my_boat/widgets/vertical_space.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

// class NavbarWidget extends StatelessWidget {
//   final List<NavbarModel> data;
//   const NavbarWidget({super.key, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<NavbarController>(
//       assignId: true,
//       id: NavbarController.builderKey,
//       builder: (controller) {
//         return SafeArea(
//           bottom: (MediaQuery.of(context).padding.bottom > 0) ? false : true,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     color: AppColors.white,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         for (int index = 0; index < data.length; index++)
//                           Expanded(
//                             child: Clickable(
//                               onTap: () async {
//                                 controller.updateNavBarIndex(index);
//                               },
//                               child: Column(
//                                 children: [
//                                   // Container(
//                                   //   height: controller.navBarIndex == index
//                                   //       ? 3.5.h
//                                   //       : 0.5.h,
//                                   //   width: double.infinity,
//                                   //   color: controller.navBarIndex == index
//                                   //       ? AppColors.primary
//                                   //       : AppColors.c8E8E8E,
//                                   // ),
// const VerticalSpace(height: 20),
// Image.asset(
//   data[index].assetIconPath,
//   color: controller.navBarIndex == index
//       ? AppColors.primary
//       : AppColors.c8E8E8E,
//   scale: 20,
// ),
//                                   Text(
//                                     data[index].text,
//                                     style: mediumTextStyle(
//                                       fontSize: 14,
//                                       color: controller.navBarIndex == index
//                                           ? AppColors.primary
//                                           : AppColors.c8E8E8E,
//                                     ),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                   const VerticalSpace(height: 10),
//                                   const DynamicVerticalSpace(height: 10),
//                                 ],
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                   // Centered Add Button
//                   Positioned(
//                     bottom: 15,
//                     child: GestureDetector(
//                       onTap: () {
//                         // Handle add button tap action here
//                       },
//                       child: Container(
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: AppColors.primary, // Center button color
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: const Icon(
//                           Icons.add,
//                           color: Colors.white,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_boat/features/navbar/controllers/navbar_controller.dart';
import 'package:my_boat/features/navbar/models/navbar_model.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/widgets/clickable.dart';

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
          child: Container(
            // color: AppColors.white,
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border:
                    const Border(top: BorderSide(color: AppColors.cE4E4E4))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // First icon
                _buildNavItem(data[0], controller, 0),

                // Second icon
                _buildNavItem(data[1], controller, 1),

                // Center Add Button
                GestureDetector(
                  onTap: () {
                    // Handle add button tap action here
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.primary, // Center button color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),

                // Third icon
                _buildNavItem(data[2], controller, 2),

                // Fourth icon
                _buildNavItem(data[3], controller, 3),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper function to build each navigation item
  Widget _buildNavItem(
      NavbarModel item, NavbarController controller, int index) {
    return Expanded(
      child: Clickable(
        onTap: () async {
          controller.updateNavBarIndex(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              data[index].assetIconPath,
              color: controller.navBarIndex == index
                  ? AppColors.primary
                  : AppColors.cA3A3A3,
              scale: 20,
            ),
            Text(
              item.text,
              style: mediumTextStyle(
                fontSize: 12,
                color: controller.navBarIndex == index
                    ? AppColors.primary
                    : AppColors.cA3A3A3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
