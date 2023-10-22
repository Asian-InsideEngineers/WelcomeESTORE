import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';
import 'package:welcomestoreapp/Logic%20Builder/Order%20Logic/ordercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/Order%20Logic/orderstate.dart';
import 'package:welcomestoreapp/Project%20Theme/widgets/distance_widget.dart';
import 'package:welcomestoreapp/Services/moneyformatter.dart';

import '../../../Project Theme/Project_Colors.dart';

class FetchOrders extends StatefulWidget {
  const FetchOrders({super.key});
  static const String routeName = "fetchorders";
  @override
  State<FetchOrders> createState() => _FetchOrdersState();
}

class _FetchOrdersState extends State<FetchOrders> {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MediaQuery(
        data: query.copyWith(textScaleFactor: 1),
        child: BlocBuilder<OrderCubits, OrderState>(
          builder: (context, state) {
            if (OrderState is OrderLoadingState && state.orders.isEmpty) {
              return const CircularProgressIndicator();
            } else if (OrderState is OrderErrorState) {
              Lottie.asset("assets/lottie/splash_Screen.json");
            } else if (OrderState is OrderLoadedState && state.orders.isEmpty) {
              return Center(
                child: Text(
                  "No Orders Found!",
                  style:
                      GoogleFonts.montserrat(fontSize: 16, color: Colors.white),
                ),
              );
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
                child: Container(
                  decoration: const BoxDecoration(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 16.0,
                      sigmaY: 16.0,
                    ),
                    child: ListView.builder(
                      itemCount: state.orders.length,
                      itemBuilder: (context, index) {
                        final ordertext = state.orders[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: FittedBox(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white.withOpacity(0.1)),
                              constraints: const BoxConstraints(maxHeight: 220),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FittedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Order Status: ${ordertext.status}",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 24,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            (ordertext.createdon != null)
                                                ? Formatter.formateDate(
                                                    ordertext.createdon!)
                                                : '',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: ordertext.items?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        final item = ordertext.items?[index];

                                        // Handle the case where item or its properties are null
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${item!.varients!.title}",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 26,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "QTY : ${item.quantity}",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 26,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const DistanceWidget(),
                                              FittedBox(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: Colors.white
                                                          .withOpacity(0.1)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Column(
                                                          children: [
                                                            Text(
                                                              "${item.varients!.mrp}",
                                                              style: TextStyles
                                                                  .heading_medium
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          32),
                                                            ),
                                                            Text(
                                                              "MRP",
                                                              style: TextStyles
                                                                  .heading_small
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          22),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              "${item.varients!.price}",
                                                              style: TextStyles
                                                                  .heading_medium
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          32),
                                                            ),
                                                            Text(
                                                              "Price",
                                                              style: TextStyles
                                                                  .heading_small
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          22),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              "${item.varients!.price! * item.quantity!}",
                                                              style: TextStyles
                                                                  .heading_medium
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          32),
                                                            ),
                                                            Text(
                                                              "Total",
                                                              style: TextStyles
                                                                  .heading_small
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          22),
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
                                        );
                                      })
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
