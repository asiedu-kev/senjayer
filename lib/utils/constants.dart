import 'package:flutter/material.dart';
import 'package:senjayer/utils/hexConverter.dart';

class AppConstants {
  final appTheme = ThemeData(
    primaryColor: HexColor.fromHex("#1FCC79"),
    secondaryHeaderColor: HexColor.fromHex("#FF6464"),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: HexColor.fromHex("#2E3E5C"),
      ),
      subtitle1: const TextStyle(
        color: Colors.black,
      ),
      headline2: TextStyle(
        color: HexColor.fromHex("#9FA5C0"),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide(
          color: HexColor.fromHex("#9FA5C0"),
        ),
      ), /* 
      filled: true,
      fillColor: HexColor.fromHex("#F4F5F7"), */
    ),
    scaffoldBackgroundColor: Colors.white,
  );
  final Color pink = HexColor.fromHex("#EF5DA8");
  final Color purple = HexColor.fromHex("#3A0078");
  final Color shadowColor = HexColor.fromHex("#0B2C6629");

  final Color grey = HexColor.fromHex("#C4C4C4");
}
