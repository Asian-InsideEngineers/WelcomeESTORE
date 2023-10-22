import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:logger/logger.dart';

import '../../Data Management/Models/cartmodel.dart';
import '../../Logic Builder/Cart Logic/cartcubits.dart';

import '../Project_Colors.dart';
import 'distance_widget.dart';

class CartListView extends StatelessWidget {
  final List<CartModel> cartitems;
  final bool shrinkwrap;
  final bool noscroll;
  const CartListView(
      {super.key,
      required this.cartitems,
      this.shrinkwrap = false,
      this.noscroll = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkwrap,
      physics: (noscroll) ? const NeverScrollableScrollPhysics() : null,
      itemCount: cartitems.length,
      itemBuilder: (context, index) {
        final itemText = cartitems[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  constraints: const BoxConstraints(maxHeight: 270),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                "${itemText.varients!.title}",
                                style: TextStyles.heading_medium.copyWith(
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
                                    desc: "are you sure want to Delete",
                                    btnOkOnPress: () {
                                      BlocProvider.of<CartCubits>(
                                        context,
                                      ).removetocart(itemText.varients!);
                                    },
                                    btnCancelOnPress: () {
                                      return;
                                    }).show();
                              },
                              child: Container(
                                color: Colors.white.withOpacity(0.1),
                                alignment: Alignment.center,
                                // width:
                                // MediaQuery.of(context).size.width / 4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.info,
                                            animType: AnimType.topSlide,
                                            title: "Delete Cart Item",
                                            desc: "are you sure want to Delete",
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
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: [
                                    Text(
                                      "${itemText.varients!.mrp}",
                                      style: TextStyles.heading_medium.copyWith(
                                          color: Colors.white, fontSize: 32),
                                    ),
                                    Text(
                                      "MRP",
                                      style: TextStyles.heading_small.copyWith(
                                          color: Colors.white, fontSize: 32),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "${itemText.varients!.price}",
                                      style: TextStyles.heading_medium.copyWith(
                                          color: Colors.white, fontSize: 32),
                                    ),
                                    Text(
                                      "Price",
                                      style: TextStyles.heading_small.copyWith(
                                          color: Colors.white, fontSize: 32),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "${itemText.varients!.price! * itemText.quantity!}",
                                      style: TextStyles.heading_medium.copyWith(
                                          color: Colors.white, fontSize: 32),
                                    ),
                                    Text(
                                      "Total",
                                      style: TextStyles.heading_small.copyWith(
                                          color: Colors.white, fontSize: 32),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Select Quantity",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        InputQty(
                                          splashRadius: 10,
                                          btnColor1: Colors.indigo,
                                          btnColor2: Colors.indigo,
                                          maxVal: 20,
                                          initVal: itemText.quantity!,
                                          minVal: 0,
                                          isIntrinsicWidth: true,
                                          borderShape: BorderShapeBtn.circle,
                                          boxDecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          steps: 1,
                                          onQtyChanged: (value) {
                                            Logger().d(value);
                                            BlocProvider.of<CartCubits>(context)
                                                .addToCart(value as int,
                                                    itemText.varients!);
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
          ),
        );
      },
    );
  }
}
