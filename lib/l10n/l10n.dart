import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_boat/utils/enums.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/helper.dart';

abstract class L10n {
  static const supportedLocales = [
    Locale('en'), //English
  ];

  static const appDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static LayoutDirection get getLayoutDirection {
    switch (AppLocalizations.of(globalKey.currentState!.context)!.localeName) {
      case 'en':
        return LayoutDirection.ltr;
      default:
        return LayoutDirection.ltr;
    }
  }

  static bool get isLtr {
    if (getLayoutDirection == LayoutDirection.ltr) {
      return true;
    } else {
      return false;
    }
  }

  static bool get isRtl {
    if (getLayoutDirection == LayoutDirection.ltr) {
      return true;
    } else {
      return false;
    }
  }
}
