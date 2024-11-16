import 'package:flutter/material.dart';
import 'package:my_boat/features/authentication/login/pages/login_page.dart';
import 'package:my_boat/features/authentication/password/pages/create_password_page.dart';
import 'package:my_boat/features/authentication/password/pages/forgot_password_page.dart';
import 'package:my_boat/features/authentication/password/pages/pin_verification_page.dart';
import 'package:my_boat/features/authentication/profile/pages/update_profile_instructions_page.dart';
import 'package:my_boat/features/authentication/profile/pages/update_profile_page.dart';
import 'package:my_boat/features/authentication/registration/pages/register_page.dart';
import 'package:my_boat/features/navbar/views/home_screen/search_screen.dart';
import 'package:my_boat/features/navbar/views/navbar_page.dart';
// import 'package:my_boat/features/splash_screen/splash_screen.dart';
import 'package:my_boat/routes/routes_names.dart';
import 'package:my_boat/utils/params.dart';

abstract class RouteConfiguration {
  // static String getInitialRoute() => RoutesNames.splash;
  static String getInitialRoute() => RoutesNames.splashScreen;

  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    Widget route;
    switch (settings.name) {
      // case RoutesNames.splashScreen:
      //   route = const SplashScreen();
      //   break;
      case RoutesNames.register:
        route = const RegisterPage();
        break;
      case RoutesNames.login:
        route = const LoginPage();
        break;
      case RoutesNames.forgotPassword:
        route = const ForgotPasswordPage();
        break;
      case RoutesNames.createPassword:
        route = const CreatePasswordPage();
        break;
      case RoutesNames.pinVerification:
        route = PinVerificationPage(
            params: settings.arguments as PinVerificationPageParams);
        break;
      case RoutesNames.updateProfile:
        route = const UpdateProfilePage();
        break;
      case RoutesNames.updateProfileInstructions:
        route = const UpdateProfileInstructionsPage();
        break;
      case RoutesNames.navbarPageRoute:
        route = const NavbarPage();
        break;
      case RoutesNames.searchScreen:
        route = const SearchScreen();
        break;
      default:
        route = const LoginPage();
        break;
    }

    // Returning The Route
    return MaterialPageRoute(builder: (context) => route, settings: settings);
  }
}
