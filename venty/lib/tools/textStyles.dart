import 'package:flutter/material.dart';
import 'package:venty/tools/theme.dart';

class TextStyles {
  static const TextStyle tileHeaderTextWhite = TextStyle(
      color: Colors.white,
      fontFamily: "Segoe UI",
      fontWeight: FontWeight.w700,
      fontSize: 20);

  static const TextStyle tileHeaderTextDark = TextStyle(
      color: VentyColors.secondaryDark,
      fontFamily: "Segoe UI",
      fontWeight: FontWeight.w700,
      fontSize: 20);

  static const TextStyle tileSubtitleTextWhite = TextStyle(
      color: Colors.white,
      fontFamily: "Segoe UI",
      fontWeight: FontWeight.w400,
      fontSize: 16);

  static const TextStyle tileSubtitleTextDark = TextStyle(
      color: VentyColors.secondaryDark,
      fontFamily: "Segoe UI",
      fontWeight: FontWeight.w400,
      fontSize: 16);

  static const TextStyle tileH1Text = TextStyle(
      color: VentyColors.conseptDark,
      fontFamily: "Segoe UI",
      fontWeight: FontWeight.w600,
      fontSize: 14);

  static const TextStyle tileH2Text = TextStyle(
      color: VentyColors.secondaryDark,
      fontFamily: "Segoe UI",
      fontWeight: FontWeight.w400,
      fontSize: 12);

  static const TextStyle smallItemTextDark = TextStyle(
      color: VentyColors.secondaryDark,
      fontFamily: "Segoe UI",
      fontWeight: FontWeight.w400,
      fontSize: 12);

  static const TextStyle listTileHeader = TextStyle(
    fontSize: 18.0,
    fontFamily: 'Segoe UI',
    fontWeight: FontWeight.bold,
    color: VentyColors.primaryDark,
  );

  static const TextStyle listTileSubtitle = TextStyle(
    fontSize: 16.0,
    fontFamily: 'Segoe UI',
    fontWeight: FontWeight.w600,
    color: VentyColors.secondaryDark,
  );
  static const TextStyle errorTextHeader = TextStyle(
    fontSize: 12.0,
    fontFamily: 'Segoe UI',
    fontWeight: FontWeight.w600,
    color: VentyColors.conseptBlue,
  );
  static const TextStyle errorTextMain = TextStyle(
    fontSize: 16.0,
    fontFamily: 'Segoe UI',
    fontWeight: FontWeight.w600,
    color: VentyColors.primaryRed,
  );
}
