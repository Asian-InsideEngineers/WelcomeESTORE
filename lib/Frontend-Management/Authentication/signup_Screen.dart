import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:welcomestoreapp/Frontend-Management/Authentication/login_Screen.dart';
import 'package:welcomestoreapp/Frontend-Management/Authentication/providers/signup_provider.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Profile/feedback.dart';

import '../../Project Theme/Project_Colors.dart';
import '../../Project Theme/widgets/distance_widget.dart';
import '../../Project Theme/widgets/primarybutton.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();

  static const String routeName = "signup";
}

class _SignupScreenState extends State<SignupScreen> {
  bool isObscure1 = true;
  bool isObscure2 = true;
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final provider = Provider.of<SignupProvider>(context);
    return LiquidPullToRefresh(
      backgroundColor: Colors.white,
      color: Colors.white.withOpacity(0.1),
      showChildOpacityTransition: false,
      onRefresh: () async {
        provider.signup();
      },
      child: SafeArea(
        child: MediaQuery(
          data: query.copyWith(textScaleFactor: 1),
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
                        sigmaX: 16.0,
                        sigmaY: 16.0,
                      ),
                      child: ListView(
                        children: [
                          FittedBox(
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white.withOpacity(0.1),
                              ),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: Form(
                                key: provider.signupformkey,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "BECOME A MEMBER,",
                                        style: TextStyles.heading_medium
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      // height: 10,
                                    ),
                                    (provider.error != "")
                                        ? Text(
                                            provider.error,
                                            style: const TextStyle(
                                                color: Colors.red),
                                          )
                                        : const SizedBox(),
                                    const DistanceWidget(),
                                    const DistanceWidget(),
                                    TextFormField(
                                      style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      controller: provider.emailcontroller,
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
                                        prefixIcon: const Icon(
                                          FontAwesomeIcons.envelope,
                                          color: Colors.white,
                                        ),
                                        labelText: "Email",
                                        hintText: "Enter your Email",
                                        hintStyle: GoogleFonts.montserrat(
                                            fontSize: 14, color: Colors.white),
                                        labelStyle: GoogleFonts.montserrat(
                                            fontSize: 14, color: Colors.white),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    const DistanceWidget(),
                                    const DistanceWidget(),
                                    TextFormField(
                                      obscureText: isObscure1,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      controller: provider.passwordcontroller,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return "Password is required";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isObscure1 = !isObscure1;
                                            });
                                          },
                                          child: passwordchangetoggle(),
                                        ),
                                        prefixIcon: const Icon(
                                          FontAwesomeIcons.key,
                                          color: Colors.white,
                                        ),
                                        labelText: "Password",
                                        hintText: "Enter your Password",
                                        hintStyle: GoogleFonts.montserrat(
                                            fontSize: 14, color: Colors.white),
                                        labelStyle: GoogleFonts.montserrat(
                                            fontSize: 14, color: Colors.white),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    const DistanceWidget(),
                                    const DistanceWidget(),
                                    TextFormField(
                                      obscureText: isObscure2,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      controller: provider.cpasswordcontroller,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return "Password is required";
                                        }

                                        if (value.trim() !=
                                            provider.passwordcontroller.text
                                                .trim()) {
                                          return "password do not match";
                                        }

                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isObscure2 = !isObscure2;
                                            });
                                          },
                                          child: repeatpasswordchangetoggle(),
                                        ),
                                        prefixIcon: const Icon(
                                          FontAwesomeIcons.key,
                                          color: Colors.white,
                                        ),
                                        hintText: "Again Repeat Your Password",
                                        labelText: "Repeat Password",
                                        hintStyle: GoogleFonts.montserrat(
                                            fontSize: 14, color: Colors.white),
                                        labelStyle: GoogleFonts.montserrat(
                                            fontSize: 14, color: Colors.white),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    const DistanceWidget(),
                                    const DistanceWidget(),
                                    PrimaryButton(
                                      buttonname: (provider.isloading)
                                          ? "Processing..."
                                          : 'Create Account',
                                      onPressed: provider.signup,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Already! have an account !",
                                          textAlign: TextAlign.center,
                                          style: TextStyles.heading_small,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, LoginScreen.routeName);
                                          },
                                          child: Text("Log In",
                                              style: TextStyles.textbuttonstyle
                                                  .copyWith(
                                                      color: Colors.white)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Any Problem?",
                                          textAlign: TextAlign.center,
                                          style: TextStyles.heading_small
                                              .copyWith(fontSize: 14),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context,
                                                CustomerFeedback.routeName);
                                          },
                                          child: Text("Click Here!",
                                              style: TextStyles.textbuttonstyle
                                                  .copyWith(
                                                      fontSize: 16,
                                                      color: Colors.white)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
    );
  }

  Icon passwordchangetoggle() {
    if (isObscure1) {
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

  Icon repeatpasswordchangetoggle() {
    if (isObscure2) {
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
