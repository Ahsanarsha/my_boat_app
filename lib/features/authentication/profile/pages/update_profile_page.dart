import 'package:my_boat/features/authentication/profile/pages/update_profile_photo_page.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/helper.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/button.dart';
import 'package:my_boat/widgets/clickable.dart';
import 'package:my_boat/widgets/hide_keyboard.dart';
import 'package:my_boat/widgets/horizontal_space.dart';
import 'package:my_boat/widgets/input_field.dart';
import 'package:my_boat/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  late final GlobalKey<FormState> fullNameFormKey;
  late final GlobalKey<FormState> usernameFormKey;
  late final GlobalKey<FormState> numberFormKey;

  late final FocusNode fullNameFocus;
  late final FocusNode usernameFocus;
  late final FocusNode numberFocus;

  late final TextEditingController fullNameController;
  late final TextEditingController usernameController;
  late final TextEditingController numberController;

  bool loading = false;

  @override
  void initState() {
    fullNameFormKey = GlobalKey<FormState>();
    usernameFormKey = GlobalKey<FormState>();
    numberFormKey = GlobalKey<FormState>();

    fullNameController = TextEditingController();
    usernameController = TextEditingController();
    numberController = TextEditingController();

    fullNameFocus = FocusNode();
    usernameFocus = FocusNode();
    numberFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    fullNameFocus.dispose();
    usernameFocus.dispose();
    numberFocus.dispose();

    fullNameController.dispose();
    usernameController.dispose();
    numberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyboardOnOutsideTap(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  const VerticalSpace(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetIcons.registerProgress1, scale: 4),
                    ],
                  ),
                  const VerticalSpace(height: 37),
                  Text(
                    AppLocalizations.of(context)!.updateYourProfile,
                    style: regularTextStyle(
                        fontSize: 28, color: AppColors.c0B2253),
                  ),
                  Text(
                    AppLocalizations.of(context)!.letsGetYou,
                    style: regularTextStyle(
                        color: AppColors.c9DA9B3, fontSize: 18),
                  ),
                  const VerticalSpace(height: 37),
                  Container(
                    height: 165.h,
                    width: 165.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AssetIcons.userPlcaeholder),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Clickable(
                          onTap: () =>
                              pushToTransparent(const UpdateProfilePhotoPage()),
                          child: Image.asset(AssetIcons.cameraColor, scale: 4),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpace(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.kindlyUploadYourPic,
                        style: regularTextStyle(
                          color: AppColors.c6D7A98,
                          fontSize: 14,
                        ),
                      ),
                      const HorizontalSpace(width: 4),
                      Text(
                        '*',
                        style: regularTextStyle(
                          height: 2,
                          color: AppColors.cFB0000,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace(height: 37),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.fullName,
                        style: regularTextStyle(
                          color: AppColors.c6D7A98,
                          fontSize: 14,
                        ),
                      ),
                      const HorizontalSpace(width: 4),
                      Text(
                        '*',
                        style: regularTextStyle(
                          height: 2,
                          color: AppColors.cFB0000,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: fullNameFormKey,
                    child: AppInputField(
                      controller: fullNameController,
                      focusNode: fullNameFocus,
                      name: AppLocalizations.of(context)!.fullName,
                      hint: AppLocalizations.of(context)!.enterFullName,
                      textInputType: TextInputType.name,
                      onChanged: (value) {
                        fullNameFormKey.currentState!.validate();
                      },
                      onFieldSubmitted: (value) {
                        fullNameFormKey.currentState!.validate();
                      },
                    ),
                  ),
                  const VerticalSpace(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.username,
                        style: regularTextStyle(
                          color: AppColors.c6D7A98,
                          fontSize: 14,
                        ),
                      ),
                      const HorizontalSpace(width: 4),
                      Text(
                        '*',
                        style: regularTextStyle(
                          height: 2,
                          color: AppColors.cFB0000,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: usernameFormKey,
                    child: AppInputField(
                      controller: usernameController,
                      focusNode: usernameFocus,
                      name: AppLocalizations.of(context)!.username,
                      hint: AppLocalizations.of(context)!.enterFullName,
                      textInputType: TextInputType.name,
                      onChanged: (value) {
                        usernameFormKey.currentState!.validate();
                      },
                      onFieldSubmitted: (value) {
                        usernameFormKey.currentState!.validate();
                      },
                    ),
                  ),
                  const VerticalSpace(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.phoneNumber,
                        style: regularTextStyle(
                          color: AppColors.c6D7A98,
                          fontSize: 14,
                        ),
                      ),
                      const HorizontalSpace(width: 4),
                      Text(
                        '*',
                        style: regularTextStyle(
                          height: 2,
                          color: AppColors.cFB0000,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: numberFormKey,
                    child: AppInputField(
                      controller: numberController,
                      focusNode: numberFocus,
                      name: AppLocalizations.of(context)!.phoneNumber,
                      hint: '+1',
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        numberFormKey.currentState!.validate();
                      },
                      onFieldSubmitted: (value) {
                        numberFormKey.currentState!.validate();
                      },
                    ),
                  ),
                  const VerticalSpace(height: 20),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                title: AppLocalizations.of(context)!.proceed,
                showLoader: loading,
                onTap: () async {
                  // if (isFormValidate()) {
                  //   loading = true;
                  //   setState(() {});
                  //   await Future.delayed(const Duration(seconds: 2));
                  //   loading = false;
                  //   setState(() {});
                  //   pushAndRemoveAllRoutesName(RoutesNames.searchLocation);
                  // }
                },
              ),
              if (!(MediaQuery.of(context).padding.bottom > 0))
                SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  bool isFormValidate() {
    bool isValidate = true;
    if (!fullNameFormKey.currentState!.validate()) {
      isValidate = false;
    }
    if (!usernameFormKey.currentState!.validate()) {
      isValidate = false;
    }
    if (!numberFormKey.currentState!.validate()) {
      isValidate = false;
    }

    return isValidate;
  }
}
