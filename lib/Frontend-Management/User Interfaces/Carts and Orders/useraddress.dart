import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcomestoreapp/Data%20Management/Models/customers.dart';
import 'package:welcomestoreapp/Frontend-Management/User%20Interfaces/Carts%20and%20Orders/myorders.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/usercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/userstates.dart';
import 'package:welcomestoreapp/Project%20Theme/widgets/distance_widget.dart';

class UserAddressDetails extends StatefulWidget {
  const UserAddressDetails({super.key});
  static const String routeName = "useraddressdetails";
  @override
  State<UserAddressDetails> createState() => _UserAddressDetailsState();
}

class _UserAddressDetailsState extends State<UserAddressDetails> {
  final GlobalKey<FormState> useraddress = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "My Adress Details",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              color: Colors.indigoAccent,
            ),
          ),
        ),
        body: BlocBuilder<UserCubits, UserState>(
          builder: (context, state) {
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
              return editprofile(state.userModel);
            }
            return Center(
              child: Text(
                "Please restart the application",
                style: GoogleFonts.montserrat(fontSize: 16),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget editprofile(CustomerModel usermodel) {
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.1)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Delivery, \nAddress Details",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.normal,
                            fontSize: 26,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const DistanceWidget(),
                  const DistanceWidget(),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.1)),
                    child: TextFormField(
                      initialValue: usermodel.fullname,
                      onChanged: (value) {
                        usermodel.fullname = value;
                      },
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "FullName is required";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your FullName",
                        focusColor: Colors.white,
                        prefixIcon: const Icon(
                          FontAwesomeIcons.user,
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        labelText: "FullName",
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                        labelStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  const DistanceWidget(),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.1)),
                    child: TextFormField(
                      initialValue: usermodel.email,
                      onChanged: (value) {
                        usermodel.email = value;
                      },
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Email is required";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your Email",
                        focusColor: Colors.white,
                        prefixIcon: const Icon(
                          FontAwesomeIcons.envelopeOpen,
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        labelText: "Email",
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                        labelStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  const DistanceWidget(),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.1)),
                    child: TextFormField(
                      initialValue: usermodel.phoneno.toString(),
                      onChanged: (value) {
                        usermodel.phoneno = int.parse(value);
                      },
                      keyboardType: TextInputType.phone,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "phoneno is required";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your phoneno",
                        focusColor: Colors.white,
                        prefixIcon: const Icon(
                          FontAwesomeIcons.phone,
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        labelText: "Phone No.",
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                        labelStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  const DistanceWidget(),
                  const DistanceWidget(),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.1)),
                    child: TextFormField(
                      initialValue: usermodel.state,
                      onChanged: (value) {
                        usermodel.state = value;
                      },
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "State is required";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your State",
                        focusColor: Colors.white,
                        prefixIcon: const Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        labelText: "State",
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                        labelStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  const DistanceWidget(),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.1)),
                    child: TextFormField(
                      initialValue: usermodel.city,
                      onChanged: (value) {
                        usermodel.city = value;
                      },
                      keyboardType: TextInputType.streetAddress,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "City is required";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your City",
                        focusColor: Colors.white,
                        prefixIcon: const Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        labelText: "City",
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                        labelStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  const DistanceWidget(),
                  const DistanceWidget(),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.1)),
                    child: TextFormField(
                      initialValue: usermodel.address,
                      onChanged: (value) {
                        usermodel.address = value;
                      },
                      keyboardType: TextInputType.streetAddress,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "address is required";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your Address",
                        focusColor: Colors.white,
                        prefixIcon: const Icon(
                          FontAwesomeIcons.addressBook,
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        labelText: "Address",
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                        labelStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  const DistanceWidget(),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.1)),
                    child: TextFormField(
                      initialValue: usermodel.pincode.toString(),
                      onChanged: (value) {
                        usermodel.pincode = int.parse(value);
                      },
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Pincode is required";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your Picnode",
                        focusColor: Colors.white,
                        prefixIcon: const Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        labelText: "Pincode",
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                        labelStyle: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  const DistanceWidget(),
                  CupertinoButton(
                    padding: const EdgeInsets.all(8),
                    onPressed: () async {
                      bool success = await BlocProvider.of<UserCubits>(context)
                          .updatedUser(usermodel);

                      if (success) {
                        Navigator.popUntil(context, (route) => route.isFirst);
                        Navigator.pushNamed(context, MyOrders.routeName);
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 12,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Update Adress Details",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
