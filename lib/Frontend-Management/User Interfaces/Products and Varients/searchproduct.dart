import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Products%20and%20Varients/varientdetails.dart';

import '../../../Data Management/Models/varients.dart';
import '../../../Logic Builder/Search Logic/searchlogic.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({Key? key}) : super(key: key);
  static const String routeName = "SearchBar";
  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();
    final query = MediaQuery.of(context);
    return MediaQuery(
      data: query.copyWith(textScaleFactor: 1),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Search Products",
            style: GoogleFonts.montserrat(
                fontSize: 18, color: Colors.indigoAccent),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
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
                      spreadRadius: -17,
                      color: Colors.black26),
                ],
              ),
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white.withOpacity(0.1)),
                            child: TextFormField(
                              onChanged: (query) {
                                searchCubit.search(query);
                              },
                              keyboardType: TextInputType.text,
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                hintText: "Enter Product Name",
                                focusColor: Colors.white,
                                prefixIcon: const Icon(
                                  FontAwesomeIcons.magnifyingGlass,
                                  color: Colors.white,
                                ),
                                fillColor: Colors.white,
                                labelText: "Search any product",
                                hintStyle: GoogleFonts.montserrat(
                                    fontSize: 14, color: Colors.white),
                                labelStyle: GoogleFonts.montserrat(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                          BlocBuilder<SearchCubit, List<VarientModel>>(
                            builder: (context, searchResults) {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: searchResults.length,
                                  itemBuilder: (context, index) {
                                    final item = searchResults[index];
                                    return CupertinoButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VarientDetails(
                                                      varients: item)),
                                        );
                                      },
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        constraints: const BoxConstraints(
                                            maxHeight: 170),

                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color:
                                                Colors.white.withOpacity(0.1)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                item.title ?? '',
                                                style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 32,
                                                    color: Colors.white),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        item.price
                                                                ?.toString() ??
                                                            '',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 28,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                      Text(
                                                        "Price",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        item.savings
                                                                ?.toString() ??
                                                            '',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 28,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                      Text(
                                                        "Savings",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        item.mrp?.toString() ??
                                                            '',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 28,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                      Text(
                                                        "MRP",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        // Add more widgets to display other details
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
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
  }
}
