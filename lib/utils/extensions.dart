import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/helper.dart';

class SnackBarController extends GetxController {
  bool isShowing = false;
  hide() {
    isShowing = false;
  }

  show() {
    isShowing = true;
  }
}

extension ContextExtensions on BuildContext {
  void removeFocus() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  String get currentLocale =>
      AppLocalizations.of(globalKey.currentState!.context)!.localeName;
}

extension StringExtensions on String {
  void print() {
    log(this);
  }

  void showToast() {
    Fluttertoast.showToast(msg: this);
  }

  void showSnackBar(
      {String? btnText,
      Color btnColor = const Color(0xff36abd6),
      VoidCallback? onTap}) {
    SnackBarController snackBarController = Get.put(SnackBarController());
    if (snackBarController.isShowing) {
      return;
    }
    snackBarController.show();
    ScaffoldMessenger.of(globalKey.currentState!.context)
        .showSnackBar(
          SnackBar(
            content: Text(this),
            action: SnackBarAction(
              label: btnText ??
                  AppLocalizations.of(globalKey.currentState!.context)!.dismiss,
              onPressed: onTap ??
                  () {
                    ScaffoldMessenger.of(globalKey.currentContext!)
                        .hideCurrentSnackBar();
                  },
            ),
          ),
        )
        .closed
        .then((value) {
      snackBarController.hide();
    });
  }

  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String lowerCaseFirstLetter() {
    return "${this[0].toLowerCase()}${substring(1)}";
  }

  bool containsUpperCaseLetter() {
    return contains(RegExp(r'[A-Z]'));
  }

  bool containsLowerCaseLetter() {
    return contains(RegExp(r'[a-z]'));
  }

  bool containsUpperAndLowerCase() {
    return containsUpperCaseLetter() && containsLowerCaseLetter();
  }

  bool containsSpecialCharacter() {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this);
  }
}

extension NullCheckExtension on String {
  // ignore: unnecessary_null_comparison
  bool get isNull => (this == null ||
      toString().toLowerCase() == 'null' ||
      toString().trim().isEmpty);
}
