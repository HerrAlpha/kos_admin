import 'package:flutter/material.dart';

class Colours {
  static const Color antiFlashWhite = Color(0xFFF0F0F0);

  ///Green Color Family
  static const Color greenPrimary = Color(0xFF0FC2C0);
  static const Color greenPrimary1 = Color(0xFF0CABA8);
  static const Color greenPrimary2 = Color(0xFF008F8C);
  static const Color greenPrimary3 = Color(0xFFCDE0E2);
  static const Color greenPrimary4 = Color(0xFF015958);
  static const Color greenPrimary5 = Color(0xFF023535);
  static const Color greenPrimary6 = Color(0xFF0A817F);

  ///Orange Color Family
  static const Color orangeSecondary = Color(0xFFEDB077);
  static const Color orangeSecondary1 = Color(0xFFF4BA84);
  static const Color orangeSecondary2 = Color(0xFFF2D1B2);
  static const Color orangeSecondary3 = Color(0xFFF7E0CC);
  static const Color orangeSecondary4 = Color(0xFFFBF0E5);
  static const Color orangeSecondary5 = Color(0xFFFFFFFF);
  static const Color orangeSecondary6 = Color(0xFFCBE16A);

  /// purple
  static const Color purplePrimary = Color(0xFF8077ED);

  ///Tosca Color Family
  static const Color toscaPrimary = Color(0xFF4BD09F);

  ///MonoCrome
  static const Color black = Color(0xFF18181A);
  static const Color white = Color(0xFFFFFFFF);

  ///Red
  static const Color red = Color(0xFFFF3838);

  ///Grey
  static const Color grey1 = Color(0xFF343B3C);
  static const Color grey2 = Color(0xFF676C6D);
  static const Color grey3 = Color(0xFFB5B8BE);
  static const Color grey4 = Color(0xFFE3E5E5);

  static const Color danger = Color(0xFFD2222D);
  static const Color warning = Color(0xFFFFBF00);
  static const Color good = Color(0xFF238823);

  ///Gradient
  static const LinearGradient blackGreen = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF053636),
      Color(0xFF076765),
    ],
  );

  static const LinearGradient shimmerGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Colours.grey1,
      Colours.grey4,
    ],
  );
  static const RadialGradient greenRadialGradient = RadialGradient(
    center: Alignment(0, 0),
    radius: 3,
    focalRadius: 0,
    colors: [
      Colours.greenPrimary2,
      Colours.white,
    ],
  );
  Colours._();
}
