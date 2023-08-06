import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:welcomestoreapp/Logic%20Builder/Cubits/usercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/Cubits/userstates.dart';
import 'package:welcomestoreapp/User-Interfaces/Authentication/login_Screen.dart';
import 'package:welcomestoreapp/User-Interfaces/Dashboard/dashboard.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
  static const String routeName = "splashscreen";
}

class _SplashscreenState extends State<Splashscreen> {
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
    Timer(const Duration(milliseconds: 5000), () {
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