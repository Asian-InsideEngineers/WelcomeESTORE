import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/usercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/userstates.dart';
import 'package:welcomestoreapp/User-Interfaces/Authentication/login_Screen.dart';
import 'package:welcomestoreapp/User-Interfaces/Dashboard/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  static const String routeName = "splashscreen";
}

class _SplashScreenState extends State<SplashScreen> {
  void startingPage() {
    UserState userstate = BlocProvider.of<UserCubits>(context).state;

    if (userstate is Userloggedinstate) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, Dashboard.routeName);
    } else if (userstate is Userlogoutstate) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } else if (userstate is Usererrorstate) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }

  @override
  void initState() {
    Timer(const Duration(milliseconds: 1000), () {
      startingPage();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubits, UserState>(
      listener: (context, State) {
        startingPage();
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).colorScheme.onPrimary,
        child: Lottie.asset("assets/lottie/splash_Screen.json"),
      ),
    );
  }
}
