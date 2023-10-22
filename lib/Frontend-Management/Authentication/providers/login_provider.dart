import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/usercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/userstates.dart';
import 'package:welcomestoreapp/Frontend-Management/splash_Screen.dart';
import 'package:welcomestoreapp/main.dart';

class LoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  final BuildContext context;
  LoginProvider(this.context) {
    cubittracker();
  }

  bool isloading = false;
  String error = "";

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  StreamSubscription? _usersubscription;

  void cubittracker() {
    log.d("userstate building");
    _usersubscription =
        BlocProvider.of<UserCubits>(context).stream.listen((userstate) {
      if (userstate is Userloadingstate) {
        isloading = true;
        error = "";
        notifyListeners();
      } else if (userstate is Usererrorstate) {
        isloading = false;
        error = userstate.message;
        notifyListeners();
      } else if (userstate is Userloggedinstate) {
        Navigator.pushNamed(context, SplashScreen.routeName);
        isloading = false;
        error = "";
        notifyListeners();
      }
    });
  }

  void login() async {
    if (!loginformkey.currentState!.validate()) return;

    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();

    BlocProvider.of<UserCubits>(context)
        .signIn(email: email, password: password);
  }

  @override
  void dispose() {
    _usersubscription?.cancel();
    super.dispose();
  }
}
