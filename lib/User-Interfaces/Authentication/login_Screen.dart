import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/usercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/userstates.dart';

import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';
import 'package:welcomestoreapp/Project%20Theme/widgets/distance_widget.dart';
import 'package:welcomestoreapp/Project%20Theme/widgets/primarybutton.dart';
import 'package:welcomestoreapp/Project%20Theme/widgets/textfields.dart';
import 'package:welcomestoreapp/User-Interfaces/Authentication/providers/login_provider.dart';
import 'package:welcomestoreapp/User-Interfaces/Authentication/signup_Screen.dart';
import 'package:welcomestoreapp/User-Interfaces/splash_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  static const String routeName = "loginscreen";
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<loginProvider>(context);
    return BlocListener<UserCubits, UserState>(
      listener: (context, State) {
        if (State is Userloggedinstate) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, SplashScreen.routeName);
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            // title: Text('Welcome ESTORE,', style: TextStyles.heading_large),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: loginProvider.loginformkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "SIGN IN,",
                            style: TextStyles.heading_large,
                          ),
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.indigoAccent,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesomeIcons.circleInfo,
                                color: Colors.white,
                                size: 15,
                              )),
                        ),
                      ],
                    ),
                    (_provider.error != "")
                        ? Text(
                            _provider.error,
                            style: const TextStyle(color: Colors.indigo),
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
                    // const DistanceWidget(),
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
                    // const DistanceWidget(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(),
                        TextButton(
                          onPressed: () {},
                          child: Text("Forgotten Paswword?",
                              style: TextStyles.textbuttonstyle),
                        ),
                      ],
                    ),
                    const DistanceWidget(),
                    PrimaryButton(
                      buttonname:
                          (_provider.isloading) ? "Processing..." : 'log in',
                      onPressed: _provider.login,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          textAlign: TextAlign.center,
                          style: TextStyles.heading_small,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignupScreen.routeName);
                          },
                          child: Text("Sign up",
                              style: TextStyles.textbuttonstyle),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
