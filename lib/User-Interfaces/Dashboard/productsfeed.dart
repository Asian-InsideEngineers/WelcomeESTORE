import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:welcomestoreapp/Logic%20Builder/Product%20Logic/productcubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/Product%20Logic/productsstates.dart';

import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';

import 'Stock Detailing/product_details.dart';

class ProductFeeds extends StatefulWidget {
  const ProductFeeds({super.key});

  @override
  State<ProductFeeds> createState() => _ProductFeedsState();
}

class _ProductFeedsState extends State<ProductFeeds> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductsStates>(builder: (context, State) {
      if (State is ProductLoadingState && State.clientProducts.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (State is ProductErrorState && State.clientProducts.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Search",
                          style: TextStyles.heading_small,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: AppColors.primary,
                            ))
                      ],
                    ),
                  ),
                )),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: State.clientProducts.length,
                itemBuilder: (context, index) {
                  final producttext = State.clientProducts[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 23,
                              spreadRadius: -13,
                              color: Colors.black26),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [Colors.indigo, Colors.indigoAccent]),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 17),
                                    blurRadius: 23,
                                    spreadRadius: -13,
                                    color: Colors.black26),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 15,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    (("${producttext.title}")),
                                    style: GoogleFonts.montserrat(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        FontAwesomeIcons.heart,
                                        color: AppColors.common,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "${producttext.price}",
                                            style: TextStyles.heading_medium,
                                          ),
                                          Text(
                                            "Price",
                                            style: TextStyles.heading_small,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "${producttext.savings}/-",
                                            style: TextStyles.heading_medium,
                                          ),
                                          Text(
                                            "Savings",
                                            style: TextStyles.heading_small
                                                .copyWith(color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "${producttext.mRP}",
                                            style: TextStyles.heading_medium,
                                          ),
                                          Text(
                                            "MRP",
                                            style: TextStyles.heading_small,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: CupertinoButton(
                                    color: Colors.indigoAccent,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, StockInformation.routeName,
                                          arguments: producttext);
                                    },
                                    child: Text(
                                      "Select Varients",
                                      style: TextStyles.heading_small
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.circleInfo,
                                      color: AppColors.primary,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
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