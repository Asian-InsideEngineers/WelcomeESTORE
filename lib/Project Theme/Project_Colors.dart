import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static Color primary = const Color(0xff4361ee);
  static Color secondary = const Color(0xff3f37c9);
  static Color background = const Color(0xffEDF2FB);
  static Color common = const Color(0xffffffff);
  static Color buttoncolor = const Color(0xffffffff);

  static Color primarytextcolor = const Color(0xff343A40);
}

class projectThemes {
  static ThemeData project_Styles = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.common,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.common,
        iconTheme: IconThemeData(
          color: AppColors.primary,
        ),
        titleTextStyle: GoogleFonts.montserrat(
            fontSize: 26, color: AppColors.primarytextcolor),
      ),
      buttonTheme: ButtonThemeData(
          buttonColor: AppColors.primary,
          colorScheme: ColorScheme.light(
              primary: AppColors.primary, secondary: AppColors.secondary)));
}

class TextStyles {
  static TextStyle heading_large = GoogleFonts.montserrat(
    color: AppColors.primarytextcolor,
    fontSize: 36,
  );
  static TextStyle buttontextstyle = GoogleFonts.montserrat(
      color: AppColors.common, fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle heading_medium = GoogleFonts.montserrat(
    color: AppColors.primarytextcolor,
    fontSize: 24,
  );
  static TextStyle heading_small = GoogleFonts.montserrat(
    color: AppColors.primarytextcolor,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  static TextStyle textbuttonstyle = GoogleFonts.montserrat(
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
}
