import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:welcomestoreapp/Logic%20Builder/Product%20Logic/productsstates.dart';
import 'package:welcomestoreapp/Logic%20Builder/Varients%20Logic/varientcubits.dart';
import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Products%20and%20Varients/varientdetails.dart';
import '../../../Logic Builder/Varients Logic/varientstates.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
  static const String routeName = "varients";
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return MediaQuery(
      data: query.copyWith(textScaleFactor: 1),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Product Varient",
                style: GoogleFonts.montserrat(
                    color: Colors.indigoAccent, fontSize: 22),
              )),
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
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 16.0,
                        sigmaY: 16.0,
                      ),
                      child: LiquidPullToRefresh(
                        showChildOpacityTransition: false,
                        color: Colors.white.withOpacity(0.1),
                        backgroundColor: Colors.white,
                        onRefresh: () async {
                          BlocProvider.of<VarientCubits>(context);
                        },
                        child: BlocBuilder<VarientCubits, VarientStates>(
                          builder: (context, state) {
                            if (state is VarientLoadingStates &&
                                state.productvarients.isEmpty) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is VarientErrorStates &&
                                state.productvarients.isEmpty) {
                              return Center(
                                child: Text(state.message),
                              );
                            } else if (state.productvarients.isEmpty) {
                              return Center(
                                child: Text(
                                  "No Product Varients Available",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            } else if (state is ProductLoadedState &&
                                state.productvarients.isEmpty) {
                              return const Center(
                                child: Text("No Product Varients Available"),
                              );
                            }
                            return ListView.builder(
                              itemCount: state.productvarients.length,
                              itemBuilder: (context, index) {
                                final varientText =
                                    state.productvarients[index];
                                return FittedBox(
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      constraints:
                                          const BoxConstraints(maxHeight: 260),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "${varientText.title}",
                                                    style: TextStyles
                                                        .heading_medium
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ),
                                                CupertinoButton(
                                                  onPressed: () {},
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    alignment: Alignment.center,
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        FontAwesomeIcons.heart,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        "${varientText.mrp}",
                                                        // "mrp",
                                                        style: TextStyles
                                                            .heading_medium
                                                            .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      Text(
                                                        "MRP",
                                                        style: TextStyles
                                                            .heading_medium
                                                            .copyWith(
                                                                color: Colors
                                                                    .white),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        "${varientText.savings}",
                                                        // "savings",
                                                        style: TextStyles
                                                            .heading_medium
                                                            .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      Text(
                                                        "Savings",
                                                        style: TextStyles
                                                            .heading_medium
                                                            .copyWith(
                                                                color: Colors
                                                                    .white),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        "${varientText.price}",
                                                        // "price",
                                                        style: TextStyles
                                                            .heading_medium
                                                            .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      Text(
                                                        "Price",
                                                        style: TextStyles
                                                            .heading_medium
                                                            .copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: CupertinoButton(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context,
                                                        VarientDetails
                                                            .routeName,
                                                        arguments: varientText);
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              24),
                                                      child: Text(
                                                        "Explore More",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
