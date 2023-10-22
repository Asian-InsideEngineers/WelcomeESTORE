import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:welcomestoreapp/Logic%20Builder/CategoryProductLogic/categoryproductcubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/CategoryProductLogic/categoryproductstate.dart';

import '../Products and Varients/product_details.dart';

class CpvProducts extends StatefulWidget {
  const CpvProducts({super.key});
  static const String routeName = "cpvfeeds";
  @override
  State<CpvProducts> createState() => _CpvProductsState();
}

class _CpvProductsState extends State<CpvProducts> {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final cpvcubits =
        BlocProvider.of<CategoryProductCubits>(context, listen: true);
    return MediaQuery(
      data: query.copyWith(textScaleFactor: 1),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              cpvcubits.categoryid.title!,
              style: GoogleFonts.montserrat(
                  fontSize: 18, color: Colors.indigoAccent),
            ),
          ),
          body: BlocBuilder<CategoryProductCubits, CategoryProductsState>(
              builder: (context, state) {
            if (state is CpvLoadingState && state.cpv.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CpvErrorState && state.cpv.isEmpty) {
              return Center(child: Text(state.message));
            }
            return Container(
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
                      spreadRadius: -17,
                      color: Colors.black26),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          itemCount: state.cpv.length,
                          itemBuilder: (context, index) {
                            final cpvtext = state.cpv[index];
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white.withOpacity(0.2),
                              ),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, ProductDetails.routeName,
                                      arguments: cpvtext);
                                },
                                child: Column(
                                  children: [
                                    Flexible(
                                      child: CachedNetworkImage(
                                        width: 200, // Set the desired width
                                        height: 150, // Set the desired height
                                        imageUrl: "${cpvtext.productimage}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          (("${cpvtext.productname}")),
                                          style: GoogleFonts.montserrat(
                                              fontSize: 26,
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
              ),
            );
          }),
        ),
      ),
    );
  }
}
