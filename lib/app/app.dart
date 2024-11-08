import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_boat/app/material_app_controller.dart';
import 'package:my_boat/l10n/l10n.dart';
import 'package:my_boat/routes/routes.dart';
import 'package:my_boat/themes/themes.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/helper.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MaterialAppController>(
      assignId: true,
      id: MaterialAppController.materialAppBuilderKey,
      builder: (controller) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: controller.themeMode,
        theme: AppThemeData.theme,
        darkTheme: AppThemeData.theme,
        navigatorKey: globalKey,
        initialRoute: RouteConfiguration.getInitialRoute(),
        onGenerateRoute: RouteConfiguration.onGenerateRoutes,
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
        supportedLocales: L10n.supportedLocales,
        locale: controller.locale,
        localizationsDelegates: L10n.appDelegates,
        builder: (context, child) => MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        ),
      ),
    );
  }
}
