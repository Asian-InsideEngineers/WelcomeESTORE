import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/usercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/userstates.dart';
import 'package:welcomestoreapp/main.dart';

class SignupProvider extends ChangeNotifier {
  final BuildContext context;
  final GlobalKey<FormState> signupformkey = GlobalKey<FormState>();
  SignupProvider(this.context) {
    cubittracker();
  }

  bool isloading = false;
  String error = "";

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController cpasswordcontroller = TextEditingController();

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
      } else {
        isloading = false;

        error = "";
        notifyListeners();
      }
    });
  }

  void signup() async {
    if (!signupformkey.currentState!.validate()) return;

    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();

    BlocProvider.of<UserCubits>(context)
        .createAccount(email: email, password: password);
  }

  @override
  void dispose() {
    _usersubscription?.cancel();
    super.dispose();
  }
}
