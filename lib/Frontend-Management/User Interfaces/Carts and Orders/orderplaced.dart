import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({super.key});
  static const String routeName = "OrderPlaced";

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  // void startingPage() {
  //   OrderState orderState = BlocProvider.of<OrderCubits>(context).state;

  //   if (orderState is OrderLoadedState) {
  //     Navigator.popUntil(context, (route) => route.isFirst);
  //     Navigator.pushReplacementNamed(context, Dashboard.routeName);
  //   } else if (orderState is Userlogoutstate) {
  //     Navigator.popUntil(context, (route) => route.isFirst);
  //     Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  //   } else if (orderState is Usererrorstate) {
  //     Navigator.popUntil(context, (route) => route.isFirst);
  //     Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  //   }
  // }

  // @override
  // void initState() {
  //   Timer(const Duration(milliseconds: 1000), () {
  //     startingPage();
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Order hasbeen placed",
          style: GoogleFonts.montserrat(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).colorScheme.onPrimary,
        child: Lottie.asset("assets/lottie/ordersplease.json"),
      ),
    );
  }
}
