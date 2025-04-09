import 'package:flutter/material.dart';
import 'package:lms_project/core/route/route_names.dart';
import 'package:lms_project/features/authentication/presentation/presentation/forgot_password/create_new_password.dart';
import 'package:lms_project/features/authentication/presentation/presentation/forgot_password/forgot_password_page.dart';
import 'package:lms_project/features/authentication/presentation/presentation/forgot_password/send_code.dart';
import 'package:lms_project/features/authentication/presentation/presentation/on_borading/first_splash_page.dart';
import 'package:lms_project/features/authentication/presentation/presentation/on_borading/on_boarding_page.dart';
import 'package:lms_project/features/authentication/presentation/presentation/sign_in/login.dart';
import 'package:lms_project/features/authentication/presentation/presentation/sign_in/sign_in.dart';

import '../../features/authentication/presentation/presentation/sign_up/sign_up.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.signIn:
        return MaterialPageRoute(builder: (_) => SignIn());

      case RouteNames.signUp:
        return MaterialPageRoute(builder: (_) => SignUp());
      case RouteNames.firstSplashPage:
        return MaterialPageRoute(builder: (_) => FirstSplashPage());
      case RouteNames.onBoarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => Login());
      case RouteNames.forgotPasswordPage:
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case RouteNames.sendCodePage:
        return MaterialPageRoute(builder: (_) => SendCodePage());
      case RouteNames.createNewPassword:
        return MaterialPageRoute(builder: (_) => CreateNewPassword());

      default:
        return _defaultRoute();
    }
  }
}

Route<dynamic> _defaultRoute() {
  return MaterialPageRoute(
    builder: (_) => Scaffold(body: Center(child: Text("Error Route"))),
  );
}
