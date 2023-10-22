import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:welcomestoreapp/Data%20Management/Models/customers.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/usercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/userstates.dart';
import 'package:welcomestoreapp/Project%20Theme/widgets/distance_widget.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Profile/feedback.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Profile/settings.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Carts%20and%20Orders/useraddress.dart';

import 'package:welcomestoreapp/Frontend-Management/splash_Screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      showChildOpacityTransition: false,
      color: Colors.white.withOpacity(0.1),
      backgroundColor: Colors.white,
      onRefresh: () async {
        BlocProvider.of<UserCubits>(context);
      },
      child: BlocBuilder<UserCubits, UserState>(builder: (context, state) {
        if (state is Userloadingstate) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Usererrorstate) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sorry for the inconvenience \n an Technical Error Occur",
                    style: GoogleFonts.montserrat(
                        fontSize: 16, color: Colors.white),
                  ),
                  const DistanceWidget(),
                  CupertinoButton(
                    color: Colors.white.withOpacity(0.1),
                    onPressed: () {
                      Navigator.pushNamed(context, SplashScreen.routeName);
                    },
                    child: Text(
                      "Fault Reset",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is Userloggedinstate) {
          return userprofile(state.userModel);
        }
        return Center(
          child: Text(
            "Please restart the application",
            style: GoogleFonts.montserrat(fontSize: 16),
          ),
        );
      }),
    );
  }

  Widget userprofile(CustomerModel customermodel) {
    final query = MediaQuery.of(context);
    return MediaQuery(
      data: query.copyWith(textScaleFactor: 1),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 17),
                      blurRadius: 23,
                      spreadRadius: -17,
                      color: Colors.black26),
                ],
              ),
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: Colors.black26),
                      ],
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 16.0,
                        sigmaY: 16.0,
                      ),
                      child: ListView(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            constraints: const BoxConstraints(maxHeight: 250),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: FittedBox(
                                alignment: Alignment.center,
                                fit: BoxFit.fitWidth,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hello,",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      customermodel.fullname ?? 'Welcome',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Membership Id: ${customermodel.id}",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                    Text(
                                      "Gmail: ${customermodel.email}",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const DistanceWidget(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // CupertinoButton(
                              //   padding: const EdgeInsets.all(0),
                              //   onPressed: () {
                              //     Navigator.pushNamed(
                              //         context, FetchOrders.routeName);
                              //   },
                              //   child: Padding(
                              //     padding:
                              //         const EdgeInsets.symmetric(vertical: 5),
                              //     child: Container(
                              //       width: MediaQuery.of(context).size.width,
                              //       height:
                              //           MediaQuery.of(context).size.height / 12,
                              //       alignment: Alignment.centerLeft,
                              //       decoration: BoxDecoration(
                              //           color: Colors.white.withOpacity(0.2),
                              //           borderRadius: BorderRadius.circular(8)),
                              //       child: Padding(
                              //         padding: const EdgeInsets.all(12),
                              //         child: Row(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.start,
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.center,
                              //           children: [
                              //             const Icon(
                              //               FontAwesomeIcons.bagShopping,
                              //               color: Colors.white,
                              //             ),
                              //             const SizedBox(
                              //               width: 15,
                              //             ),
                              //             Text(
                              //               "My Orders",
                              //               style: GoogleFonts.montserrat(
                              //                   fontSize: 18,
                              //                   color: Colors.white),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, UserAddressDetails.routeName);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 12,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.addressCard,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "Delivery Address Details",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, MySettings.routeName);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 12,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.gear,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "Settings",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {},
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 12,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.map,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "Get Store Location",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, CustomerFeedback.routeName);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 12,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.userCheck,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "Customer Care Support",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.info,
                                      animType: AnimType.topSlide,
                                      title: "Hey! What Happen",
                                      desc: "are you sure want to logout",
                                      btnOkOnPress: () {
                                        BlocProvider.of<UserCubits>(context)
                                            .signout();
                                      },
                                      btnCancelOnPress: () {
                                        return;
                                      }).show();
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 12,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.doorClosed,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "Sign-out",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 3.8),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
