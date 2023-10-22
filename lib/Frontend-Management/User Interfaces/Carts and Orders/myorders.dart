import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:welcomestoreapp/Logic%20Builder/Cart%20Logic/cartcubits.dart';
import 'package:welcomestoreapp/Logic%20Builder/Cart%20Logic/cartstates.dart';
import 'package:welcomestoreapp/Logic%20Builder/Order%20Logic/ordercubit.dart';
import 'package:welcomestoreapp/Project%20Theme/widgets/cartlistview.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Carts%20and%20Orders/useraddress.dart';

import '../../../Data Management/Models/customers.dart';
import '../../../Logic Builder/User Logic/usercubit.dart';
import '../../../Logic Builder/User Logic/userstates.dart';
import '../../../Project Theme/Project_Colors.dart';
import '../../../Services/billingcalculator.dart';
import '../../../Services/moneyformatter.dart';
import 'orderplaced.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});
  static const String routeName = "myorders";

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Orders",
          style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.indigoAccent),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 16.0,
              sigmaY: 16.0,
            ),
            child: ListView(
              children: [
                BlocBuilder<UserCubits, UserState>(builder: (context, state) {
                  if (state is Userloadingstate) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is Usererrorstate) {
                    return Center(
                      child: Text(
                        state.message,
                        style: GoogleFonts.montserrat(fontSize: 16),
                      ),
                    );
                  } else if (state is Userloggedinstate) {
                    CustomerModel user = state.userModel;
                    return Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    constraints:
                                        const BoxConstraints(maxHeight: 350),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white.withOpacity(0.2)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Place your Order,",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              CupertinoButton(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context,
                                                      UserAddressDetails
                                                          .routeName);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),

                                                  alignment: Alignment.center,
                                                  // width:
                                                  // MediaQuery.of(context).size.width / 4,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          UserAddressDetails
                                                              .routeName);
                                                    },
                                                    icon: Icon(
                                                      FontAwesomeIcons.pen,
                                                      color: AppColors.common,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${user.fullname}",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Membership Id: ${user.id}",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Gmail: ${user.email}",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Phone: ${user.phoneno}",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Delivery Address",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "${user.address}",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Pincode: ${user.pincode}",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Default Payment Method",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Cash on Delivery",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          BlocBuilder<CartCubits, CartState>(
                                              builder: (context, state) {
                                            if (state is CartErrorState) {
                                              return Text(
                                                "Something went wrong!",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              );
                                            }
                                            return Text(
                                              Formatter.formatPrice(
                                                  BillingCalculation.cartTotal(
                                                      state.cartitems)),
                                              style: TextStyles.heading_medium
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 44),
                                            );
                                          })
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
                  }
                  return Center(
                    child: Text(
                      "Please restart the application",
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                  );
                }),
                BlocBuilder<CartCubits, CartState>(
                  builder: (context, state) {
                    if (state is CartLoadingstate) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CartErrorState) {
                      return Center(
                        child: Text(
                          state.cartMessage,
                          style: GoogleFonts.montserrat(fontSize: 16),
                        ),
                      );
                    }
                    return Column(
                      children: [
                        CartListView(
                            cartitems: state.cartitems,
                            shrinkwrap: true,
                            noscroll: true),
                      ],
                    );
                  },
                ),
                CupertinoButton(
                  padding: const EdgeInsets.all(15),
                  onPressed: () async {
                    bool success = await BlocProvider.of<OrderCubits>(context)
                        .createOrders(
                            items: BlocProvider.of<CartCubits>(context)
                                .state
                                .cartitems);

                    if (success) {
                      Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.pushNamed(context, OrderPlaced.routeName);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 12,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadiusDirectional.circular(12)),
                      alignment: Alignment.center,
                      // width:
                      // MediaQuery.of(context).size.width / 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Place Order",
                          style: GoogleFonts.montserrat(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
