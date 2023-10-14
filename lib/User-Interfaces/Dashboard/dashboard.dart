import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';
import 'package:welcomestoreapp/User-Interfaces/Dashboard/Stock%20Detailing/cartscreen.dart';

import 'package:welcomestoreapp/User-Interfaces/Dashboard/favourites.dart';
import 'package:welcomestoreapp/User-Interfaces/Dashboard/categoryfeed.dart';
import 'package:welcomestoreapp/User-Interfaces/Dashboard/profile.dart';
import 'package:welcomestoreapp/User-Interfaces/Dashboard/productsfeed.dart';
import 'package:welcomestoreapp/User-Interfaces/Dashboard/searchproduct.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();

  static const String routeName = "dashboard";
}

class _DashboardState extends State<Dashboard> {
  int current_Index = 1;

  List<Widget> screens = const [
    ProductFeeds(),
    CategoriesFeed(),
    Favourites(),
    profiles(),
    SearchProduct(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Hi, Welcome",
                  style: GoogleFonts.montserrat(
                      fontSize: 24,
                      color: AppColors.primarytextcolor,
                      fontWeight: FontWeight.bold)),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                icon: Badge(
                  label: const Text("2"),
                  isLabelVisible: true,
                  backgroundColor: Colors.indigoAccent,
                  textColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.bagShopping,
                    size: 25,
                    color: AppColors.primarytextcolor,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              onTabChange: (index) {
                setState(() {
                  current_Index = index;
                });
              },
              selectedIndex: current_Index,
              backgroundColor: AppColors.common,
              activeColor: AppColors.common,
              gap: 10,
              tabBackgroundGradient: const LinearGradient(colors: [
                Colors.indigo,
                Colors.indigoAccent,
              ]),
              tabs: [
                GButton(
                  style: GnavStyle.google,
                  icon: FontAwesomeIcons.solidStar,
                  iconSize: 25,
                  iconColor: Colors.indigoAccent,
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
                  iconColor: Colors.indigoAccent,
                  text: "Categories",
                  textStyle: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  padding: const EdgeInsets.all(10),
                ),
                GButton(
                  style: GnavStyle.google,
                  icon: FontAwesomeIcons.solidHeart,
                  iconColor: Colors.indigoAccent,
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
                  icon: FontAwesomeIcons.solidUser,
                  iconSize: 25,
                  iconColor: Colors.indigoAccent,
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
        body: screens[current_Index],
      ),
    );
  }
}
