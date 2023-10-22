import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:welcomestoreapp/Data%20Management/Models/varients.dart';
import 'package:welcomestoreapp/Logic%20Builder/Cart%20Logic/cartcubits.dart';
import 'package:welcomestoreapp/Project%20Theme/widgets/distance_widget.dart';

class VarientDetails extends StatefulWidget {
  final VarientModel varients;
  const VarientDetails({super.key, required this.varients});
  static const String routeName = "varientdetails";
  @override
  State<VarientDetails> createState() => _VarientDetailsState();
}

class _VarientDetailsState extends State<VarientDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.varients.title}"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FittedBox(
                child: CachedNetworkImage(
                  imageUrl: "${widget.varients.image}",
                  fit: BoxFit.cover,
                ),
              ),
              const DistanceWidget(),
              FittedBox(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                          colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  width: MediaQuery.of(context).size.width,
                  constraints: const BoxConstraints(maxHeight: 250),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Discription",
                      style: GoogleFonts.montserrat(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const DistanceWidget(),
              CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    if (BlocProvider.of<CartCubits>(context)
                        .cartchecking(widget.varients)) {
                      return;
                    }
                    BlocProvider.of<CartCubits>(context)
                        .addToCart(1, widget.varients);
                  },
                  child: FittedBox(
                    child: Container(
                      decoration: BoxDecoration(
                          color: (BlocProvider.of<CartCubits>(context)
                                  .cartchecking(widget.varients))
                              ? Colors.orange
                              : Colors.deepPurple,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          (BlocProvider.of<CartCubits>(context, listen: true)
                                  .cartchecking(widget.varients))
                              ? "Already Added"
                              : "Add to cart",
                          style: GoogleFonts.montserrat(
                              fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
