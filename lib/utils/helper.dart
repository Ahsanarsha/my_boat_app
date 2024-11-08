import 'package:my_boat/utils/regexs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_boat/utils/extensions.dart';
import 'package:my_boat/widgets/loader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

void setStatusBarToWhiteColor() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

Future<void> callTo(String number) async {
  await openNativeUrl('tel:$number');
}

Future<void> emailTo(String email, String subject, String body) async {
  await openNativeUrl("mailto:$email?subject=$subject&body=$body");
}

Future<void> smsTo(String number) async {
  await openNativeUrl('sms:$number');
}

Future<void> openNativeUrl(String url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    'Could not launch $url'.showSnackBar();
  }
}

Future<void> openInAppBrowser(String url) async {
  if (url.contains('https') || url.contains('http')) {
  } else {
    url = 'https://$url';
  }

  await openNativeUrl('https://');
}

Future<void> saveToLocal(String key, var data) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  if (data is String) {
    await sharedPreferences.setString(key, data);
  } else if (data is bool) {
    await sharedPreferences.setBool(key, data);
  } else if (data is int) {
    await sharedPreferences.setInt(key, data);
  } else if (data is double) {
    await sharedPreferences.setDouble(key, data);
  }
}

Future<dynamic> getFromLocal(String key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  return sharedPreferences.get(key);
}

Future<void> removeKeyFromLocal({String? key}) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  if (key == null) {
    await sharedPreferences.clear();
  } else {
    await sharedPreferences.remove(key);
  }
}

popUntil(String routeName) => Navigator.popUntil(
      globalKey.currentState!.context,
      ModalRoute.withName(routeName),
    );

Future pushToName(String routeName, {Object? arguments}) async =>
    await Navigator.pushNamed(
      globalKey.currentState!.context,
      routeName,
      arguments: arguments,
    );

void pushToAndReplaceName(String routeName, {Object? arguments}) async =>
    await Navigator.pushReplacementNamed(
      globalKey.currentState!.context,
      routeName,
      arguments: arguments,
    );

Future pushAndRemoveAllRoutesName(String routeName) async {
  var value = await Navigator.pushNamedAndRemoveUntil(
    globalKey.currentState!.context,
    routeName,
    (route) => false,
  );
  return value;
}

Future pushTo(Widget screen) async {
  var value = await Navigator.push(globalKey.currentState!.context,
      MaterialPageRoute(builder: (context) => screen));
  return value;
}

Future pushToAndReplace(Widget screen) async {
  var value = await Navigator.pushReplacement(globalKey.currentState!.context,
      MaterialPageRoute(builder: (context) => screen));
  return value;
}

Future pushAndRemoveAllRoutes(Widget screen) async {
  var value = await Navigator.pushAndRemoveUntil(
      globalKey.currentState!.context,
      MaterialPageRoute(builder: (context) => screen),
      (routes) => false);
  return value;
}

Future<dynamic> pushToTransparent(Widget screen) async {
  var response = await globalKey.currentState!.push(PageRouteBuilder(
      opaque: false, pageBuilder: (BuildContext context, _, __) => screen));
  return response;
}

hideLoading() {
  goBack();
}

goBack() {
  Navigator.pop(globalKey.currentState!.context);
}

Future<void> showLoading({bool showProgress = false}) async {
  showDialog(
    barrierDismissible: false,
    context: globalKey.currentState!.context,
    builder: (BuildContext context) {
      return const Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: SizedBox(height: 100, width: 100, child: AppLoader()),
      );
    },
  );
}

List<TextInputFormatter> nameInputFormatters = [
  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
  LengthLimitingTextInputFormatter(20),
];

List<TextInputFormatter> phoneNumberInputFormatters = [
  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
  // LengthLimitingTextInputFormatter(11),
];

bool containsUppercaseAndLowercase(String input) {
  // Check if the string contains at least one uppercase letter
  bool hasUppercase = input.contains(RegExp(r'[A-Z]'));

  // Check if the string contains at least one lowercase letter
  bool hasLowercase = input.contains(RegExp(r'[a-z]'));

  // Return true if both conditions are met
  return hasUppercase && hasLowercase;
}

class CanadianPhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;
    final buffer = StringBuffer();
    int selectionIndex = newValue.selection.end;

    if (newText.isNotEmpty) {
      buffer.write('+1 ');
      selectionIndex += 3;

      if (newText.length > 2) {
        buffer.write('(');
        selectionIndex++;
      }
      for (int i = 0; i < newText.length; i++) {
        if (i == 2) {
          buffer.write(')');
          selectionIndex++;
        } else if (i == 5) {
          buffer.write('-');
          selectionIndex++;
        }
        buffer.write(newText[i]);
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

checkPasswordStrength(String password) {
  int validConditions = 0;

  if (password.length >= 8) validConditions++;
  if (password.contains(RegExp(AppRegexs.oneSepecialCharacterRegex))) {
    validConditions++;
  }
  if (password.contains(RegExp(AppRegexs.oneNumberRegex))) {
    validConditions++;
  }

  String strength;
  if (validConditions == 1) {
    strength = "Weak";
  } else if (validConditions == 2) {
    strength = "Medium";
  } else if (validConditions == 3) {
    strength = "Strong";
  } else {
    strength = "";
  }

  return strength;
}
