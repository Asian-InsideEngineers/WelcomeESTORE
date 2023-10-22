import 'package:flutter/material.dart';
import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';

class PrimaryTextfield extends StatelessWidget {
  const PrimaryTextfield(
      {super.key,
      required this.labeltext,
      required this.fillcolors,
      this.controller,
      this.obsecuretext = false,
      this.validator,
      required this.icons});

  final String labeltext;
  final Color fillcolors;
  final TextEditingController? controller;
  final bool obsecuretext;
  final String? Function(String?)? validator;
  final Widget icons;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecuretext,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: icons,
        labelText: labeltext,
        fillColor: fillcolors,
        labelStyle: TextStyles.heading_small,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
