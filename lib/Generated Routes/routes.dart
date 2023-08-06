import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:welcomestoreapp/User-Interfaces/Authentication/login_Screen.dart';
import 'package:welcomestoreapp/User-Interfaces/Authentication/providers/login_provider.dart';
import 'package:welcomestoreapp/User-Interfaces/Authentication/providers/signup_provider.dart';
import 'package:welcomestoreapp/User-Interfaces/Authentication/signup_Screen.dart';
import 'package:welcomestoreapp/User-Interfaces/Dashboard/dashboard.dart';
import 'package:welcomestoreapp/User-Interfaces/splash_Screen.dart';

class Routes {
  static Route? systemRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Splashscreen.routeName:
        return CupertinoPageRoute(builder: (context) => const Splashscreen());
      case Dashboard.routeName:
        return CupertinoPageRoute(builder: (context) => const Dashboard());
      case LoginScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => loginProvider(context),
              child: const LoginScreen()),
        );
      case SignupScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => signupprovider(context),
                child: const SignupScreen()));
      default:
        return null;
    }
  }
}
