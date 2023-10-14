import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:styled_divider/styled_divider.dart';

import 'package:welcomestoreapp/Logic%20Builder/Cart%20Logic/cartcubits.dart';
import 'package:welcomestoreapp/Logic%20Builder/Cart%20Logic/cartstates.dart';

import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';
import 'package:welcomestoreapp/Project%20Theme/widgets/distance_widget.dart';
import 'package:welcomestoreapp/Services/billingcalculator.dart';
import 'package:welcomestoreapp/Services/moneyformatter.dart';

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
      body: SafeArea(
        child: BlocBuilder<CartCubits, CartState>(
          builder: (context, state) {
            if (state is CartLoadingstate && state.items.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CartErrorState && state.items.isEmpty) {
              return const Center(
                child: Text("Please, Buy something"),
              );
            } else if (state.items.isEmpty) {
              Center(child: Lottie.asset("assets/lottie/error.json"));
            }

            return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  final itemText = state.items[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: AppColors.primary,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 6.5,
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
                                  Text(
                                    "Units: 0${state.items.length}",
                                    style: TextStyles.heading_small
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    "Billing: ${BillingCalculation.cartTotal(state.items)}",
                                    style: TextStyles.heading_medium
                                        .copyWith(color: Colors.white),
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        FontAwesomeIcons.bagShopping,
                                        size: 35,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Confirm Order",
                                    style: TextStyles.heading_small
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 4.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    AppColors.secondary,
                                    AppColors.primary
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.topLeft)),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${itemText.products!.title}",
                                      style: TextStyles.heading_medium.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              FontAwesomeIcons.pencil,
                                              color: AppColors.common,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              FontAwesomeIcons.trash,
                                              color: AppColors.common,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${itemText.products!.description}",
                                      style: TextStyles.heading_small.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox()
                                  ],
                                ),
                                DistanceWidget(),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              "${itemText.quantity}",
                                              style: TextStyles.heading_medium
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                            Text(
                                              "Quantity",
                                              style: TextStyles.heading_small
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            ("${Formatter.formatPrice(itemText.products!.mRP!)}"),
                                            style: TextStyles.heading_medium
                                                .copyWith(color: Colors.white),
                                          ),
                                          Text(
                                            "MRP",
                                            style: TextStyles.heading_small
                                                .copyWith(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            ("${Formatter.formatPrice(itemText.products!.price!)}"),
                                            style: TextStyles.heading_medium
                                                .copyWith(color: Colors.white),
                                          ),
                                          Text(
                                            "Price",
                                            style: TextStyles.heading_small
                                                .copyWith(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            ("${Formatter.formatPrice(itemText.products!.price! * itemText.quantity!)}"),
                                            style: TextStyles.heading_medium
                                                .copyWith(color: Colors.white),
                                          ),
                                          Text(
                                            "Total",
                                            style: TextStyles.heading_small
                                                .copyWith(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
