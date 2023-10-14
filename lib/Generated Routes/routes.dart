import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:welcomestoreapp/Data%20Management/Models/products.dart';

import 'package:welcomestoreapp/User-Interfaces/Authentication/login_Screen.dart';
import 'package:welcomestoreapp/User-Interfaces/Authentication/providers/login_provider.dart';
import 'package:welcomestoreapp/User-Interfaces/Authentication/providers/signup_provider.dart';
import 'package:welcomestoreapp/User-Interfaces/Authentication/signup_Screen.dart';
import 'package:welcomestoreapp/User-Interfaces/Dashboard/Stock%20Detailing/cartscreen.dart';
import 'package:welcomestoreapp/User-Interfaces/Dashboard/Stock%20Detailing/product_details.dart';
import 'package:welcomestoreapp/User-Interfaces/Dashboard/dashboard.dart';
import 'package:welcomestoreapp/User-Interfaces/Dashboard/searchproduct.dart';
import 'package:welcomestoreapp/User-Interfaces/splash_Screen.dart';

class Routes {
  static Route? systemRoutes(RouteSettings settings) {
    switch (settings.name) {
      case StockInformation.routeName:
        return CupertinoPageRoute(
            builder: (context) => StockInformation(
                  productModel: settings.arguments as ProductModel,
                ));

      case SearchProduct.routeName:
        return CupertinoPageRoute(builder: (context) => const SearchProduct());
      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());

      case Dashboard.routeName:
        return CupertinoPageRoute(builder: (context) => const Dashboard());
      case CartScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const CartScreen());
      case LoginScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => loginProvider(context),
            child: const LoginScreen(),
          ),
        );
      case SignupScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => signupprovider(context),
            child: const SignupScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
