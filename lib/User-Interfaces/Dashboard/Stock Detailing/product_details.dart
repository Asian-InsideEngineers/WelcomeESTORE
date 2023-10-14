import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:input_quantity/input_quantity.dart';

import 'package:welcomestoreapp/Data%20Management/Models/products.dart';
import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';

class StockInformation extends StatefulWidget {
  final ProductModel productModel;
  const StockInformation({super.key, required this.productModel});

  @override
  State<StockInformation> createState() => _StockInformationState();
  static const String routeName = "StockInfo";
}

class _StockInformationState extends State<StockInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text("${widget.productModel.title}"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.productModel.varients!.length,
          itemBuilder: (context, index) {
            final varienturl = widget.productModel.varients![index];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.primary,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${varienturl}",
                                  style: TextStyles.heading_medium
                                      .copyWith(color: Colors.white)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    FontAwesomeIcons.heart,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InputQty(
                              splashRadius: 10,
                              btnColor1: AppColors.primary,
                              btnColor2: AppColors.primary,
                              maxVal: 100,
                              initVal: 0,
                              minVal: 0,
                              isIntrinsicWidth: true,
                              borderShape: BorderShapeBtn.circle,
                              boxDecoration: const BoxDecoration(),
                              steps: 1,
                              onQtyChanged: (val) {
                                print(val);
                              },
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.primary),
                              child: CupertinoButton(
                                onPressed: () {},
                                child: Text(
                                  "Add to cart",
                                  style: TextStyles.heading_small
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
