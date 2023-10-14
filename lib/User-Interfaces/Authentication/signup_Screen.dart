import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:welcomestoreapp/User-Interfaces/Authentication/login_Screen.dart';
import 'package:welcomestoreapp/User-Interfaces/Authentication/providers/signup_provider.dart';

import '../../Project Theme/Project_Colors.dart';
import '../../Project Theme/widgets/distance_widget.dart';
import '../../Project Theme/widgets/primarybutton.dart';
import '../../Project Theme/widgets/textfields.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();

  static const String routeName = "signup";
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<signupprovider>(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        // title: Text('Welcome ESTORE,', style: TextStyles.heading_small),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: signupprovider.signupformkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "BECOME A MEMBER,",
                    style: TextStyles.heading_medium,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // height: 10,
                ),
                (_provider.error != "")
                    ? Text(
                        _provider.error,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                const DistanceWidget(),
                const DistanceWidget(),
                PrimaryTextfield(
                  controller: _provider.emailcontroller,
                  validator: (Value) {
                    if (Value == null || Value.trim().isEmpty) {
                      return "Email address is required";
                    }
                    if (!EmailValidator.validate(Value.trim())) {
                      return "Invalid email";
                    }
                    return null;
                  },
                  icons: Icon(
                    Icons.email,
                    color: AppColors.primary,
                  ),
                  labeltext: "Email",
                ),
                const DistanceWidget(),
                const DistanceWidget(),
                PrimaryTextfield(
                    controller: _provider.passwordcontroller,
                    validator: (Value) {
                      if (Value == null || Value.trim().isEmpty) {
                        return "Password is required";
                      }

                      return null;
                    },
                    icons: Icon(
                      Icons.password,
                      color: AppColors.primary,
                    ),
                    labeltext: "password",
                    obsecuretext: true),
                const DistanceWidget(),
                const DistanceWidget(),
                PrimaryTextfield(
                    controller: _provider.cpasswordcontroller,
                    validator: (Value) {
                      if (Value == null || Value.trim().isEmpty) {
                        return "Password is required";
                      }

                      if (Value.trim() !=
                          _provider.passwordcontroller.text.trim()) {
                        return "password do not match";
                      }

                      return null;
                    },
                    icons: Icon(
                      Icons.confirmation_number,
                      color: AppColors.primary,
                    ),
                    labeltext: "Confirm Password",
                    obsecuretext: true),
                const DistanceWidget(),
                const DistanceWidget(),
                PrimaryButton(
                  buttonname: (_provider.isloading)
                      ? "Processing..."
                      : 'Create Account',
                  onPressed: _provider.signup,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already! have an account ",
                      textAlign: TextAlign.center,
                      style: TextStyles.heading_small,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: Text("Log In", style: TextStyles.textbuttonstyle),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Are you getting someting problem?",
                //       textAlign: TextAlign.center,
                //       style: TextStyles.heading_small,
                //     ),
                //     TextButton(
                //       onPressed: () {},
                //       child: Text("Click Here!",
                //           style: TextStyles.textbuttonstyle),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
