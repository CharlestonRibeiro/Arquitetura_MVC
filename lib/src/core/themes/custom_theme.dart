
import 'package:arquitetura_mvc/src/core/colors/custom_colors.dart';
import 'package:flutter/material.dart';

ThemeData customTheme() {
  ColorScheme.fromSeed(seedColor: Colors.deepPurple);

  return ThemeData(
    textTheme: TextTheme(

      displaySmall: TextStyle(
        fontFamily: 'Metrophobic',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: CustomColors.black,
      ),

      titleMedium: TextStyle(
        fontFamily: 'Metrophobic',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: CustomColors.black,
      ),

      titleSmall: TextStyle(
        fontFamily: 'Metrophobic',
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: CustomColors.gray,
      ),

        titleLarge: TextStyle(
        fontFamily: 'Metrophobic',
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: CustomColors.black,
      ),
      
    
    ),
  );
}