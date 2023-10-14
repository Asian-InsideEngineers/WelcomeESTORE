import 'package:flutter/material.dart';

import '../../Project Theme/Project_Colors.dart';

class profiles extends StatefulWidget {
  const profiles({super.key});

  @override
  State<profiles> createState() => _profilesState();
}

class _profilesState extends State<profiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 11,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.indigo, Colors.indigoAccent]),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 23,
              spreadRadius: -13,
              color: Colors.black26),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "03",
                  style:
                      TextStyles.heading_medium.copyWith(color: Colors.white),
                ),
                Text(
                  "Selected Quantity",
                  style: TextStyles.heading_small.copyWith(color: Colors.white),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "750/-",
                  style:
                      TextStyles.heading_medium.copyWith(color: Colors.white),
                ),
                Text(
                  "Total Billing",
                  style: TextStyles.heading_small.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
