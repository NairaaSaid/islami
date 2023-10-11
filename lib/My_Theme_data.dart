import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primary = Color(0xFFB7935F);
  static const Color blackColor = Color(0xFF242424);
  static Color WhiteColor = Color(0xFFFFFFFF);
  static Color YellowColor = Color(0xFFFACC1D);
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme:IconThemeData(color: primary) ,
          centerTitle: true, elevation: 0, backgroundColor: Colors.transparent),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.elMessiri(
              fontSize: 30, color: blackColor, fontWeight: FontWeight.bold),
          //#################################################
          bodyMedium: GoogleFonts.elMessiri(
              fontSize: 25, color: blackColor, fontWeight: FontWeight.w700),
          //#################################################
          bodySmall: GoogleFonts.elMessiri(
              fontSize: 20,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w100)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(

          type: BottomNavigationBarType.shifting,
          backgroundColor: primary,
          selectedItemColor: blackColor,
          unselectedItemColor: Colors.white));
  static ThemeData darkTheme = ThemeData();
}
