import 'dart:ui';

import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/usercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/userstates.dart';

import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';
import 'package:welcomestoreapp/Project%20Theme/widgets/distance_widget.dart';
import 'package:welcomestoreapp/Project%20Theme/widgets/primarybutton.dart';
import 'package:welcomestoreapp/Frontend-Management/Authentication/providers/login_provider.dart';
import 'package:welcomestoreapp/Frontend-Management/Authentication/signup_Screen.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Profile/feedback.dart';
import 'package:welcomestoreapp/Frontend-Management/splash_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  static const String routeName = "loginscreen";
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final provider = Provider.of<LoginProvider>(context);
    return BlocListener<UserCubits, UserState>(
      listener: (context, state) {
        if (State is Userloggedinstate) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, SplashScreen.routeName);
        }
      },
      child: MediaQuery(
        data: query.copyWith(textScaleFactor: 1),
        child: SafeArea(
          child: Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 15.0,
                        sigmaY: 15.0,
                      ),
                      child: FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Lets'Shop",
                                  style: GoogleFonts.badScript(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            const DistanceWidget(),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(0.1),
                                ),
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                child: Form(
                                  key: provider.loginformkey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                "SIGN IN,",
                                                style: TextStyles.heading_large
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 38),
                                              ),
                                            ),
                                            CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.white,
                                              child: IconButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context,
                                                        CustomerFeedback
                                                            .routeName);
                                                  },
                                                  icon: const Icon(
                                                    FontAwesomeIcons.circleInfo,
                                                    color: Colors.indigo,
                                                    size: 15,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        (provider.error != "")
                                            ? Text(
                                                provider.error,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              )
                                            : const SizedBox(),
                                        const DistanceWidget(),
                                        const DistanceWidget(),
                                        TextFormField(
                                          style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          controller: provider.emailcontroller,
                                          cursorColor: Colors.white,
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return "Email address is required";
                                            }
                                            if (!EmailValidator.validate(
                                                value.trim())) {
                                              return "Invalid email";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Enter your Email",
                                            focusColor: Colors.white,
                                            prefixIcon: const Icon(
                                              FontAwesomeIcons.envelope,
                                              color: Colors.white,
                                            ),
                                            fillColor: Colors.white,
                                            labelText: "Email",
                                            hintStyle: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                color: Colors.white),
                                            labelStyle: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                color: Colors.white),
                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        ),
                                        const DistanceWidget(),
                                        // const DistanceWidget(),
                                        TextFormField(
                                          style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          obscureText: _isObscure,
                                          controller:
                                              provider.passwordcontroller,
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return "Password is required";
                                            }

                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Enter your Password",
                                            prefixIcon: const Icon(
                                              FontAwesomeIcons.key,
                                              color: Colors.white,
                                            ),
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _isObscure = !_isObscure;
                                                });
                                              },
                                              child: changetoggle(),
                                            ),
                                            labelText: "Password",
                                            hintStyle: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                color: Colors.white),
                                            labelStyle: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                color: Colors.white),
                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white,
                                                    style: BorderStyle.solid),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                        ),
                                        const DistanceWidget(),
                                        // const DistanceWidget(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    CustomerFeedback.routeName);
                                              },
                                              child: Text("Forgotten Pasword?",
                                                  style: TextStyles
                                                      .textbuttonstyle
                                                      .copyWith(
                                                          color: Colors.white)),
                                            ),
                                          ],
                                        ),
                                        const DistanceWidget(),
                                        PrimaryButton(
                                          buttonname: (provider.isloading)
                                              ? "Processing..."
                                              : 'log in',
                                          onPressed: provider.login,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Don't have an account? ",
                                              textAlign: TextAlign.center,
                                              style: TextStyles.heading_small
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    SignupScreen.routeName);
                                              },
                                              child: Text("Sign up",
                                                  style: TextStyles
                                                      .textbuttonstyle
                                                      .copyWith(
                                                          color: Colors.white)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Icon changetoggle() {
    if (_isObscure) {
      return const Icon(
        FontAwesomeIcons.eye,
        color: Colors.white,
      );
    } else {
      return const Icon(
        FontAwesomeIcons.eyeSlash,
        color: Colors.white,
      );
    }
  }
}
