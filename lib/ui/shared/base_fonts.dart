import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseFonts {
  // static TextStyle Function() style = GoogleFonts.poppins;

  static TextStyle extraLargeTitle(
      {Color color = Colors.black, double fontSize = 55}) {
    return GoogleFonts.poppins(
        color: color, fontWeight: FontWeight.w800, fontSize: fontSize);
  }

  static TextStyle largeTitle(
      {Color color = Colors.black, double fonSize = 34}) {
    return GoogleFonts.poppins(
        color: color, fontWeight: FontWeight.bold, fontSize: fonSize);
  }

  static TextStyle title1({Color color = Colors.black}) {
    return GoogleFonts.poppins(
        color: color, fontWeight: FontWeight.bold, fontSize: 28);
  }

  static TextStyle title2({Color color = Colors.black}) {
    return GoogleFonts.poppins(
        color: color, fontWeight: FontWeight.bold, fontSize: 22);
  }

  static TextStyle title3({Color color = Colors.black}) {
    return GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );
  }

  static TextStyle title4({Color color = Colors.black, double fontSize = 32}) {
    return GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
    );
  }

  static TextStyle title5({Color color = Colors.black, double fontSize = 32}) {
    return GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
    );
  }

  static TextStyle headline(
      {Color color = Colors.black, double fontSize = 18}) {
    return GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
    );
  }

  static TextStyle headline2(
      {Color color = Colors.black, double fontSize = 17}) {
    return GoogleFonts.poppins(
        color: color, fontWeight: FontWeight.w500, fontSize: fontSize);
  }

  static TextStyle headline3({Color color = Colors.black}) {
    return GoogleFonts.poppins(
        color: color, fontWeight: FontWeight.w500, fontSize: 16);
  }

  static TextStyle body({Color color = Colors.black, double fontSize = 16}) {
    return GoogleFonts.poppins(
        color: color, fontWeight: FontWeight.normal, fontSize: fontSize);
  }

  static TextStyle subHead({
    Color color = Colors.black,
    double fontSize = 14,
    bool underLine = false,
  }) {
    return GoogleFonts.poppins(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        decoration: underLine ? TextDecoration.underline : null);
  }

  static TextStyle subHeadBold(
      {Color color = Colors.black,
      double fontSize = 14,
      bool lineTrough = false}) {
    return GoogleFonts.poppins(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        decoration: lineTrough ? TextDecoration.lineThrough : null);
  }

  static TextStyle footNote({Color color = Colors.black}) {
    return GoogleFonts.poppins(
        color: color, fontWeight: FontWeight.w500, fontSize: 13);
  }

  static TextStyle footNote2(
      {Color color = Colors.black, double fontSize = 13}) {
    return GoogleFonts.poppins(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        letterSpacing: 0.5,
        wordSpacing: 1.4);
  }

  static TextStyle caption({Color color = Colors.black}) {
    return GoogleFonts.poppins(
        color: color, fontWeight: FontWeight.w500, fontSize: 11);
  }
}
