import 'package:flutter/material.dart';
import 'package:my_boat/features/authentication/login/pages/login_method_selection_page.dart';
import 'package:my_boat/features/authentication/login/pages/login_page.dart';
import 'package:my_boat/features/authentication/password/pages/create_password_page.dart';
import 'package:my_boat/features/authentication/password/pages/forgot_password_page.dart';
import 'package:my_boat/features/authentication/password/pages/pin_verification_page.dart';
import 'package:my_boat/features/authentication/profile/pages/update_profile_instructions_page.dart';
import 'package:my_boat/features/authentication/profile/pages/update_profile_page.dart';
import 'package:my_boat/features/authentication/registration/pages/register_page.dart';
import 'package:my_boat/features/navbar/views/navbar_page.dart';
import 'package:my_boat/routes/routes_names.dart';
import 'package:my_boat/utils/params.dart';

abstract class RouteConfiguration {
  static String getInitialRoute() => RoutesNames.splash;

  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    Widget route;
    switch (settings.name) {
      case RoutesNames.register:
        route = const RegisterPage();
        break;
      case RoutesNames.loginMethodSelection:
        route = const LoginMethodSelectionPage();
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
      default:
        route = const LoginPage();
        break;
    }

    // Returning The Route
    return MaterialPageRoute(builder: (context) => route, settings: settings);
  }
}
