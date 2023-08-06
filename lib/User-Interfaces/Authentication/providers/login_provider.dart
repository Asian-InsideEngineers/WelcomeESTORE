import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcomestoreapp/Logic%20Builder/Cubits/usercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/Cubits/userstates.dart';
import 'package:welcomestoreapp/main.dart';

class loginProvider extends ChangeNotifier {
  final BuildContext context;
  loginProvider(this.context) {
    _cubit_Tracker();
  }

  bool isloading = false;
  String error = "";

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  static final loginformkey = GlobalKey<FormState>();
  StreamSubscription? _usersubscription;

  void _cubit_Tracker() {
    log.d("userstate building");
    _usersubscription =
        BlocProvider.of<UserCubits>(context).stream.listen((UserState) {
      if (UserState is Userloadingstate) {
        isloading = true;
        error = "";
        notifyListeners();
      } else if (UserState is Usererrorstate) {
        isloading = false;
        error = UserState.message;
        notifyListeners();
      } else if (UserState is Userloggedinstate) {
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
