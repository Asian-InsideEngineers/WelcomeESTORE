import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:welcomestoreapp/Data%20Management/Models/categories.dart';
import 'package:welcomestoreapp/Data%20Management/Models/products.dart';
import 'package:welcomestoreapp/Data%20Management/Models/varients.dart';
import 'package:welcomestoreapp/Logic%20Builder/CategoryProductLogic/categoryproductcubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/Varients%20Logic/varientcubits.dart';
import 'package:welcomestoreapp/Frontend-Management/Authentication/login_Screen.dart';
import 'package:welcomestoreapp/Frontend-Management/Authentication/providers/login_provider.dart';
import 'package:welcomestoreapp/Frontend-Management/Authentication/providers/signup_provider.dart';
import 'package:welcomestoreapp/Frontend-Management/Authentication/signup_Screen.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Legal%20Documents/privacy.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Legal%20Documents/terms.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Carts%20and%20Orders/fetchorders.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Carts%20and%20Orders/myorders.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Carts%20and%20Orders/orderplaced.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Profile/feedback.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Profile/settings.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Profile/storelocation.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Carts%20and%20Orders/useraddress.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Carts%20and%20Orders/cartscreen.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Products%20and%20Varients/product_details.dart';

import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Products%20and%20Varients/varientdetails.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Product%20Category/cpvproducts.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/dashboard.dart';

import 'package:welcomestoreapp/Frontend-Management/splash_Screen.dart';

import '../Frontend-Management/User Interfaces/Products and Varients/searchproduct.dart';

class Routes {
  static Route? systemRoutes(RouteSettings settings) {
    switch (settings.name) {
      case ProductDetails.routeName:
        return CupertinoPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      VarientCubits(settings.arguments as ProductModel),
                  child: const ProductDetails(),
                ));
      case CpvProducts.routeName:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
              create: (context) =>
                  CategoryProductCubits(settings.arguments as CategoryModel),
              child: const CpvProducts()),
        );
      case MyOrders.routeName:
        return CupertinoPageRoute(
          builder: (context) => const MyOrders(),
        );
      case CustomerFeedback.routeName:
        return CupertinoPageRoute(
          builder: (context) => const CustomerFeedback(),
        );
      case Privacy.routeName:
        return CupertinoPageRoute(
          builder: (context) => const Privacy(),
        );
      case Terms.routeName:
        return CupertinoPageRoute(
          builder: (context) => const Terms(),
        );
      case MySettings.routeName:
        return CupertinoPageRoute(
          builder: (context) => const MySettings(),
        );
      case FetchOrders.routeName:
        return CupertinoPageRoute(
          builder: (context) => const FetchOrders(),
        );
      case OrderPlaced.routeName:
        return CupertinoPageRoute(
          builder: (context) => const OrderPlaced(),
        );
      case SearchProduct.routeName:
        return CupertinoPageRoute(
          builder: (context) => const SearchProduct(),
        );
      case VarientDetails.routeName:
        return CupertinoPageRoute(
          builder: (context) => VarientDetails(
            varients: settings.arguments as VarientModel,
          ),
        );

      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());

      case Dashboard.routeName:
        return CupertinoPageRoute(builder: (context) => const Dashboard());
      case UserAddressDetails.routeName:
        return CupertinoPageRoute(
            builder: (context) => const UserAddressDetails());
      case GoogleMap.routeName:
        return CupertinoPageRoute(builder: (context) => const GoogleMap());
      case CartScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const CartScreen());
      case LoginScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => LoginProvider(context),
            child: const LoginScreen(),
          ),
        );
      case SignupScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => SignupProvider(context),
            child: const SignupScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
