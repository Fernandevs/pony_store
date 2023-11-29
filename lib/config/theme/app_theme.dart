import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorSeed = Colors.amber;
const scaffoldBackgroundColor = Color(0xFFF8F7F7);

class AppTheme {
  static ThemeData get theme => ThemeData(
        ///* General
        useMaterial3: true,
        colorSchemeSeed: colorSeed,

        ///* Texts
        textTheme: TextTheme(
          titleLarge: GoogleFonts.montserratAlternates().copyWith(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.montserratAlternates().copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.montserratAlternates().copyWith(fontSize: 20),
        ),

        ///* Scaffold Background Color
        scaffoldBackgroundColor: scaffoldBackgroundColor,

        ///* Buttons
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              GoogleFonts.montserratAlternates().copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),

        ///* AppBar
        appBarTheme: AppBarTheme(
          elevation: 8,
          centerTitle: true,
          color: scaffoldBackgroundColor,
          titleTextStyle: GoogleFonts.montserratAlternates().copyWith(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );
}
