import 'dart:developer';

import 'package:my_boat/app/material_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_boat/app/app.dart';

late MaterialAppController materialAppController;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  materialAppController = Get.put(MaterialAppController(), permanent: true);
  try {
    await materialAppController.initilizeMaterialApp();
  } catch (e) {
    log("Main Error: $e");
  }

  runApp(const MyApp());
}