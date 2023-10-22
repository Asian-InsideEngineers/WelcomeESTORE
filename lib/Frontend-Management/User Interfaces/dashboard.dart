import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:welcomestoreapp/Logic%20Builder/Cart%20Logic/cartcubits.dart';
import 'package:welcomestoreapp/Logic%20Builder/Cart%20Logic/cartstates.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/usercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/userstates.dart';
import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Carts%20and%20Orders/fetchorders.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Responsive/responsive.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Carts%20and%20Orders/cartscreen.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Product%20Category/categoryfeed.dart';

import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Profile/profile.dart';
import 'package:welcomestoreapp/Frontend-Management/splash_Screen.dart';

import 'Products and Varients/productsfeed.dart';
import 'Products and Varients/searchproduct.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();

  static const String routeName = "dashboard";
}

class _DashboardState extends State<Dashboard> {
  int currentindex = 1;

  List<Widget> screens = const [
    ProductFeeds(),
    CategoriesFeed(),
    Profile(),
    FetchOrders(),
  ];
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Responsive(
      maxwidthscreen: BlocListener<UserCubits, UserState>(
        listener: (context, state) {
          if (state is Userlogoutstate) {
            Navigator.pushReplacementNamed(context, SplashScreen.routeName);
          }
          if (state is Usererrorstate) {
            Navigator.pushReplacementNamed(context, SplashScreen.routeName);
          }
        },
        child: MediaQuery(
          data: query.copyWith(textScaleFactor: 1),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 16.0,
                      sigmaY: 16.0,
                    ),
                    child: SafeArea(
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        appBar: AppBar(
                          elevation: 10,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          title: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 22),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Let's Shop,",
                                    style: GoogleFonts.badScript(
                                        fontSize: 32,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      CupertinoButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, CartScreen.routeName);
                                        },
                                        padding: const EdgeInsets.all(0),
                                        child:
                                            BlocBuilder<CartCubits, CartState>(
                                                builder: (context, state) {
                                          return Badge(
                                            label: Text(
                                              "${state.cartitems.length}",
                                            ),
                                            isLabelVisible:
                                                (state is CartLoadingstate)
                                                    ? false
                                                    : true,
                                            backgroundColor: Colors.deepPurple,
                                            textColor: Colors.white,
                                            child: Icon(
                                              FontAwesomeIcons.bagShopping,
                                              size: 25,
                                              color: AppColors.common,
                                            ),
                                          );
                                        }),
                                      ),
                                      CupertinoButton(
                                        padding: const EdgeInsets.all(0),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, SearchProduct.routeName);
                                        },
                                        child: const Icon(
                                          FontAwesomeIcons.magnifyingGlass,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        bottomNavigationBar: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white12,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: GNav(
                              onTabChange: (index) {
                                setState(() {
                                  currentindex = index;
                                });
                              },
                              selectedIndex: currentindex,
                              backgroundColor: Colors.transparent,
                              activeColor: AppColors.common,
                              gap: 10,
                              tabBackgroundColor: Colors.white.withOpacity(0.2),
                              tabs: [
                                GButton(
                                  style: GnavStyle.google,
                                  icon: FontAwesomeIcons.star,
                                  iconSize: 25,
                                  iconColor: Colors.white,
                                  text: "Trendings",
                                  textStyle: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  padding: const EdgeInsets.all(10),
                                ),
                                GButton(
                                  textColor: Colors.black26,
                                  icon: FontAwesomeIcons.bagShopping,
                                  iconSize: 25,
                                  iconColor: Colors.white,
                                  text: "Categories",
                                  textStyle: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  padding: const EdgeInsets.all(10),
                                ),
                                GButton(
                                  style: GnavStyle.google,
                                  icon: FontAwesomeIcons.user,
                                  iconColor: Colors.white,
                                  iconSize: 25,
                                  text: "Profile",
                                  textStyle: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  padding: const EdgeInsets.all(10),
                                ),

                                GButton(
                                  style: GnavStyle.google,
                                  icon: FontAwesomeIcons.firstOrder,
                                  iconSize: 25,
                                  iconColor: Colors.white,
                                  text: "My Orders",
                                  textStyle: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  padding: const EdgeInsets.all(10),
                                ),
                                // GButton(
                                //   style: GnavStyle.google,
                                //   icon: FontAwesomeIcons.magnifyingGlass,
                                //   iconSize: 25,
                                //   iconColor: AppColors.secondary,
                                //   text: "Search",
                                //   textStyle: GoogleFonts.montserrat(
                                //       fontSize: 18,
                                //       color: Colors.white,
                                //       fontWeight: FontWeight.bold),
                                //   padding: const EdgeInsets.all(10),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        body: screens[currentindex],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      minwidthscreen: BlocListener<UserCubits, UserState>(
        listener: (context, state) {
          if (state is Userlogoutstate) {
            Navigator.pushReplacementNamed(context, SplashScreen.routeName);
          }
        },
        child: MediaQuery(
          data: query.copyWith(textScaleFactor: 1),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
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
                  child: SafeArea(
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        title: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Hello,",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 44,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                CupertinoButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, CartScreen.routeName);
                                  },
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.deepPurple,
                                            Colors.deepPurpleAccent
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        )),
                                    child: BlocBuilder<CartCubits, CartState>(
                                        builder: (context, state) {
                                      return Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  CartScreen.routeName);
                                            },
                                            icon: Badge(
                                              label: Text(
                                                "${state.cartitems.length}",
                                              ),
                                              isLabelVisible:
                                                  (state is CartLoadingstate)
                                                      ? false
                                                      : true,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              child: Icon(
                                                FontAwesomeIcons.bagShopping,
                                                size: 25,
                                                color: AppColors.common,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Cart",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      bottomNavigationBar: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white12,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: GNav(
                            onTabChange: (index) {
                              setState(() {
                                currentindex = index;
                              });
                            },
                            selectedIndex: currentindex,
                            backgroundColor: Colors.transparent,
                            activeColor: AppColors.common,
                            gap: 10,
                            tabBackgroundGradient:
                                const LinearGradient(colors: [
                              Colors.deepPurple,
                              Colors.deepPurpleAccent,
                            ]),
                            tabs: [
                              GButton(
                                style: GnavStyle.google,
                                icon: FontAwesomeIcons.star,
                                iconSize: 25,
                                iconColor: Colors.deepPurpleAccent,
                                text: "Trendings",
                                textStyle: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                padding: const EdgeInsets.all(10),
                              ),
                              GButton(
                                textColor: Colors.black26,
                                icon: FontAwesomeIcons.bagShopping,
                                iconSize: 25,
                                iconColor: Colors.deepPurpleAccent,
                                text: "Categories",
                                textStyle: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                padding: const EdgeInsets.all(10),
                              ),
                              GButton(
                                style: GnavStyle.google,
                                icon: FontAwesomeIcons.heart,
                                iconColor: Colors.deepPurpleAccent,
                                iconSize: 25,
                                text: "Favourites",
                                textStyle: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                padding: const EdgeInsets.all(10),
                              ),

                              GButton(
                                style: GnavStyle.google,
                                icon: FontAwesomeIcons.user,
                                iconSize: 25,
                                iconColor: Colors.deepPurpleAccent,
                                text: "Profile",
                                textStyle: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                padding: const EdgeInsets.all(10),
                              ),
                              // GButton(
                              //   style: GnavStyle.google,
                              //   icon: FontAwesomeIcons.magnifyingGlass,
                              //   iconSize: 25,
                              //   iconColor: AppColors.secondary,
                              //   text: "Search",
                              //   textStyle: GoogleFonts.montserrat(
                              //       fontSize: 18,
                              //       color: Colors.white,
                              //       fontWeight: FontWeight.bold),
                              //   padding: const EdgeInsets.all(10),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      body: screens[currentindex],
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
}
