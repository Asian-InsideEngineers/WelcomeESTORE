import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:input_quantity/input_quantity.dart';

import 'package:logger/logger.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Carts%20and%20Orders/useraddress.dart';

import 'package:welcomestoreapp/Logic%20Builder/Cart%20Logic/cartcubits.dart';
import 'package:welcomestoreapp/Logic%20Builder/Cart%20Logic/cartstates.dart';

import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';
import 'package:welcomestoreapp/Project%20Theme/widgets/distance_widget.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Carts%20and%20Orders/myorders.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Responsive/responsive.dart';

import '../../../Services/billingcalculator.dart';
import '../../../Services/moneyformatter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  static const String routeName = "CartScreen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyles.heading_medium,
        ),
      ),
      body: const Responsive(
        maxwidthscreen: CartUiMaxWidth(),
        minwidthscreen: CartUiMinWidth(),
      ),
    );
  }
}

class CartUiMaxWidth extends StatelessWidget {
  const CartUiMaxWidth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CartCubits, CartState>(
        builder: (context, state) {
          if (state is CartLoadingstate && state.cartitems.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartErrorState && state.cartitems.isEmpty) {
            return Center(
              child: Text(state.cartMessage),
            );
          } else if (state.cartitems.isEmpty) {
            return Center(
                child: Text(
              "NO! Products found",
              style: GoogleFonts.montserrat(fontSize: 16),
            ));
          } else if (state is CartLoadedState && state.cartitems.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight),
                    ),
                    width: MediaQuery.of(context).size.width,
                    constraints: const BoxConstraints(maxHeight: 130),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Units: ${state.cartitems.length}",
                                  style: TextStyles.heading_small.copyWith(
                                      color: Colors.white, fontSize: 22),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  Formatter.formatPrice(
                                      BillingCalculation.cartTotal(
                                          state.cartitems)),
                                  style: TextStyles.heading_medium.copyWith(
                                      color: Colors.white, fontSize: 44),
                                ),
                              ],
                            ),
                          ),
                          const StyledVerticalDivider(
                            color: Colors.white,
                            thickness: 2,
                            lineStyle: DividerLineStyle.solid,
                            indent: 20,
                            endIndent: 20,
                          ),
                          CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              Navigator.pushNamed(context, MyOrders.routeName);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            UserAddressDetails.routeName);
                                      },
                                      icon: const Icon(
                                        FontAwesomeIcons.bagShopping,
                                        size: 35,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FittedBox(
                                  child: Text(
                                    "Confirm Order",
                                    style: TextStyles.heading_small
                                        .copyWith(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      itemCount: state.cartitems.length,
                      itemBuilder: (context, index) {
                        final itemText = state.cartitems[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                constraints:
                                    const BoxConstraints(maxHeight: 270),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.deepPurple,
                                          Colors.deepPurpleAccent,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight)),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: Text(
                                              "${itemText.varients!.title}",
                                              style: TextStyles.heading_medium
                                                  .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 32,
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
                                                  title: "Delete Cart Item",
                                                  desc:
                                                      "are you sure want to Delete",
                                                  btnOkOnPress: () {
                                                    BlocProvider.of<CartCubits>(
                                                      context,
                                                    ).removetocart(
                                                        itemText.varients!);
                                                  },
                                                  btnCancelOnPress: () {
                                                    return;
                                                  }).show();
                                            },
                                            child: Container(
                                              color:
                                                  Colors.white.withOpacity(0.1),
                                              alignment: Alignment.center,
                                              // width:
                                              // MediaQuery.of(context).size.width / 4,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      AwesomeDialog(
                                                          context: context,
                                                          dialogType:
                                                              DialogType.info,
                                                          animType:
                                                              AnimType.topSlide,
                                                          title:
                                                              "Delete Cart Item",
                                                          desc:
                                                              "are you sure want to Delete",
                                                          btnOkOnPress: () {
                                                            BlocProvider.of<
                                                                CartCubits>(
                                                              context,
                                                            ).removetocart(
                                                                itemText
                                                                    .varients!);
                                                          },
                                                          btnCancelOnPress: () {
                                                            return;
                                                          }).show();
                                                    },
                                                    icon: Icon(
                                                      FontAwesomeIcons.trash,
                                                      color: AppColors.common,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const DistanceWidget(),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Column(
                                                children: [
                                                  Text(
                                                    "${itemText.varients!.mrp}",
                                                    style: TextStyles
                                                        .heading_medium
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 32),
                                                  ),
                                                  Text(
                                                    "MRP",
                                                    style: TextStyles
                                                        .heading_small
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 32),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "${itemText.varients!.price}",
                                                    style: TextStyles
                                                        .heading_medium
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 32),
                                                  ),
                                                  Text(
                                                    "Price",
                                                    style: TextStyles
                                                        .heading_small
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 32),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "${itemText.varients!.price! * itemText.quantity!}",
                                                    style: TextStyles
                                                        .heading_medium
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 32),
                                                  ),
                                                  Text(
                                                    "Total",
                                                    style: TextStyles
                                                        .heading_small
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 32),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const DistanceWidget(),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Select Quantity",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      InputQty(
                                                        splashRadius: 10,
                                                        btnColor1:
                                                            Colors.indigo,
                                                        btnColor2:
                                                            Colors.indigo,
                                                        maxVal: 20,
                                                        initVal:
                                                            itemText.quantity!,
                                                        minVal: 0,
                                                        isIntrinsicWidth: true,
                                                        borderShape:
                                                            BorderShapeBtn
                                                                .circle,
                                                        boxDecoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        steps: 1,
                                                        onQtyChanged: (value) {
                                                          Logger().d(value);
                                                          BlocProvider.of<
                                                                      CartCubits>(
                                                                  context)
                                                              .addToCart(
                                                                  value as int,
                                                                  itemText
                                                                      .varients!);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox()
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CartUiMinWidth extends StatelessWidget {
  const CartUiMinWidth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CartCubits, CartState>(
        builder: (context, state) {
          if (state is CartLoadingstate && state.cartitems.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartErrorState && state.cartitems.isEmpty) {
            return Center(
              child: Text(state.cartMessage),
            );
          } else if (state.cartitems.isEmpty) {
            return Center(
                child: Text(
              "NO! Products found",
              style: GoogleFonts.montserrat(fontSize: 16),
            ));
          } else if (state is CartLoadedState && state.cartitems.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: Text(
                                  "Units: ${state.cartitems.length}",
                                  style: TextStyles.heading_small.copyWith(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Text(
                                  Formatter.formatPrice(
                                      BillingCalculation.cartTotal(
                                          state.cartitems)),
                                  style: TextStyles.heading_medium.copyWith(
                                      color: Colors.white, fontSize: 44),
                                ),
                              ),
                            ],
                          ),
                          const StyledVerticalDivider(
                            color: Colors.white,
                            thickness: 2,
                            lineStyle: DividerLineStyle.solid,
                            indent: 20,
                            endIndent: 20,
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: CupertinoButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        FontAwesomeIcons.bagShopping,
                                        size: 35,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      "Confirm Order",
                                      style: TextStyles.heading_small
                                          .copyWith(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: state.cartitems.length,
                      itemBuilder: (context, index) {
                        final itemText = state.cartitems[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.deepPurple,
                                          Colors.deepPurpleAccent
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight)),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: Text(
                                              "${itemText.varients!.title}",
                                              style: TextStyles.heading_medium
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 32,
                                              ),
                                            ),
                                          ),
                                          CupertinoButton(
                                            padding: const EdgeInsets.all(0),
                                            onPressed: () {},
                                            child: Container(
                                              alignment: Alignment.center,
                                              // width:
                                              // MediaQuery.of(context).size.width / 4,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      BlocProvider.of<
                                                          CartCubits>(
                                                        context,
                                                      ).removetocart(
                                                          itemText.varients!);
                                                    },
                                                    icon: Icon(
                                                      FontAwesomeIcons.trash,
                                                      color: AppColors.common,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const DistanceWidget(),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Column(
                                                  children: [
                                                    Text(
                                                      "${itemText.varients!.mrp}",
                                                      style: TextStyles
                                                          .heading_medium
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 32),
                                                    ),
                                                    Text(
                                                      "MRP",
                                                      style: TextStyles
                                                          .heading_small
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 32),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "${itemText.varients!.price}",
                                                      style: TextStyles
                                                          .heading_medium
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 32),
                                                    ),
                                                    Text(
                                                      "Price",
                                                      style: TextStyles
                                                          .heading_small
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 32),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "${itemText.varients!.price! * itemText.quantity!}",
                                                      style: TextStyles
                                                          .heading_medium
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 32),
                                                    ),
                                                    Text(
                                                      "Total",
                                                      style: TextStyles
                                                          .heading_small
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 32),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const DistanceWidget(),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              fit: FlexFit.loose,
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Select Quantity",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      InputQty(
                                                        splashRadius: 20,
                                                        btnColor1:
                                                            Colors.indigo,
                                                        btnColor2:
                                                            Colors.indigo,
                                                        maxVal: 20,
                                                        initVal:
                                                            itemText.quantity!,
                                                        minVal: 1,
                                                        isIntrinsicWidth: true,
                                                        borderShape:
                                                            BorderShapeBtn
                                                                .circle,
                                                        boxDecoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        steps: 1,
                                                        onQtyChanged: (value) {
                                                          if (value ==
                                                              itemText
                                                                  .quantity) {
                                                            Logger().d(
                                                                "We are not upading data");
                                                            return;
                                                          }
                                                          Logger().d(value);
                                                          BlocProvider.of<
                                                                      CartCubits>(
                                                                  context)
                                                              .addToCart(
                                                                  value as int,
                                                                  itemText
                                                                      .varients!);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox()
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
