import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'package:lottie/lottie.dart';
import 'package:welcomestoreapp/Logic%20Builder/Category%20Logic/categorycubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/Category%20Logic/categorystate.dart';

import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Product%20Category/cpvproducts.dart';

class CategoriesFeed extends StatefulWidget {
  const CategoriesFeed({super.key});

  @override
  State<CategoriesFeed> createState() => _CategoriesFeedState();
}

class _CategoriesFeedState extends State<CategoriesFeed> {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return MediaQuery(
      data: query.copyWith(textScaleFactor: 1),
      child: LiquidPullToRefresh(
        showChildOpacityTransition: false,
        color: Colors.white.withOpacity(0.1),
        backgroundColor: Colors.white,
        onRefresh: () async {
          BlocProvider.of<CategoryCubit>(context);
        },
        child: BlocBuilder<CategoryCubit, CategoryStates>(
          builder: (context, state) {
            if (CategoryStates is CategoryLoadingState) {
              return const CircularProgressIndicator();
            } else if (CategoryStates is CategoryErrorState) {
              Lottie.asset("assets/lottie/splash_Screen.json");
            }
            return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 16.0,
                          sigmaY: 16.0,
                        ),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 2,
                            ),
                            itemCount: state.categories.length,
                            itemBuilder: (context, index) {
                              final catetorytext = state.categories[index];
                              return CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, CpvProducts.routeName,
                                      arguments: catetorytext);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          fit: FlexFit.tight,
                                          child: CachedNetworkImage(
                                            width: 200, // Set the desired width
                                            height:
                                                150, // Set the desired height
                                            imageUrl: "${catetorytext.image}",
                                            fit: BoxFit.cover,
                                          )),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            ("${catetorytext.title}"),
                                            style: GoogleFonts.montserrat(
                                                fontSize: 24,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}

// return GFListTile(
//               color: Colors.white,
//               shadow: BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 4,
//                 blurRadius: 7,
//                 offset: const Offset(2, 4), // changes position of shadow
//               ),
//               title: Text(
//                 ("${catetorytext.title}"),
//                 style: TextStyles.heading_medium,
//               ),
//               subTitle: Text(("${catetorytext.description}")),
//               icon: Icon(
//                 FontAwesomeIcons.angleRight,
//                 color: AppColors.primary,
//               ),
//               subTitleText: ("${catetorytext.description}"),
//             );