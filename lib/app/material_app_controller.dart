import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_boat/utils/constants.dart';
import 'package:my_boat/utils/helper.dart';

class MaterialAppController extends GetxController {
  static const materialAppBuilderKey = 'materialAppBuilderKey';
  static const progressIndicatorBuilderKey = 'progressKey';
  Locale locale = Constants.locale;
  ThemeMode themeMode = Constants.themeMode;
  bool isThemeChangingProcess = false;
  String progressIndicatorValue = '';
  setLightTheme() async {
    themeMode = ThemeMode.light;
    await removeKeyFromLocal(key: 'dark-theme-mode');
    isThemeChangingProcess = true;
    globalKey = GlobalKey<NavigatorState>();
    update([materialAppBuilderKey]);
  }

  setDarkTheme() async {
    themeMode = ThemeMode.dark;
    await saveToLocal('dark-theme-mode', true);
    isThemeChangingProcess = true;
    globalKey = GlobalKey<NavigatorState>();
    update([materialAppBuilderKey]);
  }

  updateProgressIndicatorValue(String value) async {
    progressIndicatorValue = value;
    update([progressIndicatorBuilderKey]);
  }

  updateLocale(String languageCode) {
    locale = Locale(languageCode);
    update([materialAppBuilderKey]);
  }

  Future<void> initilizeMaterialApp() async {
    if (await getFromLocal('dark-theme-mode') != null) {
      themeMode = ThemeMode.dark;
      update([materialAppBuilderKey]);
    }
  }
}
