import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget maxwidthscreen;
  final Widget minwidthscreen;

  const Responsive({
    super.key,
    required this.maxwidthscreen,
    required this.minwidthscreen,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 480 && constraints.maxWidth > 320) {
        return maxwidthscreen;
      } else if (constraints.maxWidth < 320 && constraints.maxWidth < 480) {
        return minwidthscreen;
      }
      return maxwidthscreen;
    });
  }
}
