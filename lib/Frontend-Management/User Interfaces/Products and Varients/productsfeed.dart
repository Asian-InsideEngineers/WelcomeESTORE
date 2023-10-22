import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:welcomestoreapp/Logic%20Builder/Product%20Logic/productcubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/Product%20Logic/productsstates.dart';

import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Responsive/responsive.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Products%20and%20Varients/product_details.dart';

class ProductFeeds extends StatefulWidget {
  const ProductFeeds({super.key});
  static const String routeName = "ProductFeeds";
  @override
  State<ProductFeeds> createState() => _ProductFeedsState();
}

class _ProductFeedsState extends State<ProductFeeds> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      maxwidthscreen: ProductUiMaxWidth(),
      minwidthscreen: ProductUiMinWidth(),
    );
  }
}

class ProductUiMaxWidth extends StatelessWidget {
  const ProductUiMaxWidth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return MediaQuery(
      data: query.copyWith(textScaleFactor: 1),
      child:
          BlocBuilder<ProductCubit, ProductsStates>(builder: (context, state) {
        if (state is ProductLoadingState && state.clientProducts.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductErrorState && state.clientProducts.isEmpty) {
          return Center(child: Text(state.message));
        }
        return Scaffold(
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
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                              ),
                              itemCount: state.clientProducts.length,
                              itemBuilder: (context, index) {
                                final producttext = state.clientProducts[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  child: CupertinoButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, ProductDetails.routeName,
                                          arguments: producttext);
                                    },
                                    child: Column(
                                      children: [
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: CachedNetworkImage(
                                            width: 200, // Set the desired width
                                            height:
                                                150, // Set the desired height
                                            imageUrl:
                                                "${producttext.productimage}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        FittedBox(
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                (("${producttext.productname}")),
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 26,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ProductUiMinWidth extends StatelessWidget {
  const ProductUiMinWidth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return BlocBuilder<ProductCubit, ProductsStates>(builder: (context, state) {
      if (state is ProductLoadingState && state.clientProducts.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ProductErrorState && state.clientProducts.isEmpty) {
        return Center(child: Text(state.message));
      }
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
                        spreadRadius: -13,
                        color: Colors.black26),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 15),
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: CupertinoButton(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Search",
                                          style: TextStyles.heading_small
                                              .copyWith(color: Colors.black26),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              FontAwesomeIcons.magnifyingGlass,
                                              color: Colors.deepPurple,
                                            ))
                                      ],
                                    ),
                                  )),
                            ),
                            Expanded(
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: state.clientProducts.length,
                                  itemBuilder: (context, index) {
                                    final producttext =
                                        state.clientProducts[index];
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      child: CupertinoButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, ProductDetails.routeName,
                                              arguments: producttext);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              (("${producttext.productname}")),
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 26,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
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
    });
  }
}



//  return GFListTile(
//               avatar: const Icon(FontAwesomeIcons.productHunt),
//               padding: const EdgeInsets.all(20),
//               color: Colors.white,
//               shadow: BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 4,
//                 blurRadius: 7,
//                 offset: const Offset(2, 4), // changes position of shadow
//               ),
//               title: Text(
//                 ("${producttext.title}"),
//                 style: TextStyles.heading_large,
//               ),
//               subTitle: Text(
//                 ("Prices: ${producttext.price} /- "),
//                 style: TextStyles.heading_small,
//               ),
//               icon: Icon(
//                 FontAwesomeIcons.cartShopping,
//                 color: GFColors.DARK,
//               ),
//             );