import 'package:flutter/material.dart';
import 'package:senjayer/utils/hex_converter.dart';

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
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide(
          color: HexColor.fromHex("#3A0078"),
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
  final Color pink = HexColor.fromHex("#EF5DA8");
  final Color purple = HexColor.fromHex("#3A0078");
  final Color mediumPurple = HexColor.fromHex("#9B51E0");
  final Color lightPurple = HexColor.fromHex("#E2DAEA");
  final Color shadowColor = HexColor.fromHex("#0B2C6629");
  final Color grey = HexColor.fromHex("#C4C4C4");
  final Color lightyellow = HexColor.fromHex("#FEE488");
  final Color yellow = HexColor.fromHex("#E8B500");
  final Color lightGreen = HexColor.fromHex("#BDFBAD");
  final Color green = HexColor.fromHex("#0D9353");
  final Color lightRed = HexColor.fromHex("#FAC6C6");
  final Color red = HexColor.fromHex("#F92A2A");
  final Color purpleAccent = HexColor.fromHex("#9B51E0");
  final LinearGradient shimmerGradient = const LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
}

//eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYzhkMjMxNjgxN2Q0MTg3YWYzZjhlNDExYTY4NTMwYzFkYWMyYTM3MGIzOTIyNGZiNWM5OTc0OGYyMzNkYTM0ZDMzNzgwM2U2OGZmYzNkNmMiLCJpYXQiOjE2NjkxOTkyNTYsIm5iZiI6MTY2OTE5OTI1NiwiZXhwIjoxNzAwNzM1MjU2LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.paF3HHm0DTpwSYJkkQcODb86WAI385dFsVEPWKFPrVyaBoYAen4iWHJm5dGKkYyplKnXYtc4dtqdiWklNaaKP26tJ8vfSRzkp5Go9GJxDZv2W4bzIyUKvAyeAtte-gsq_832BaRXpbG_WfVtVNDt2bQCmwLs-D9bZz0n7rqInJT5SHJiqngsShxvnLKQKqpGu0Fy06Yo8TrAcgke78_48Sqr8YS_TcmZ_B-kOG-8zec53y_ifw4LRO8QadxnIyHUAH0E_Sn9BGhONT5shm1E_OqQGaC15vTynNpB_ESL8tU6FWHxNi0zZeKMq5Ocp-j8R80sGzeOi-mv643cPA0UydrOHL2IOqGocJqSVk5PhRr8dhXRyPixyQNo6J025_grIudvv-15wmMBi3aJx1KVVb2ehxz_Nn3zXgL2HvE60gX_YrnY5b0W644QzVUb-dj71d28dGtfxOzY3An5v4EqS1nmXrZ48FeEZhCt4124IbDcXpNlxbgsfoUGiuZaiV7QwhcmLgai-rrCIkxtMqdUGB4bt4HBKoo6jfRtTIcMX-tCzedhg5pU-1_B6SAJgTO4lh9igltzvvxC_h6TYJpOHmtidJ40l_6t56bIJpjm5cllOanRiznQkVG1ucJRH-d1l9cFSbR7v7b8-sX9y3Fy7zxH-bgseoZbqKFS-6RxkEI