import 'package:flutter/material.dart';

class CustomColor {
  CustomColor._();

  static const Map<int, Color> mapColor = {
    //RGB Color Code (0, 194, 162) Hex: 0xff0095B2
    50: Color.fromRGBO(169, 117, 255, .1),
    100: Color.fromRGBO(169, 117, 255, .2),
    200: Color.fromRGBO(169, 117, 255, .3),
    300: Color.fromRGBO(169, 117, 255, .4),
    400: Color.fromRGBO(169, 117, 255, .5),
    500: Color.fromRGBO(169, 117, 255, .6),
    600: Color.fromRGBO(169, 117, 255, .7),
    700: Color.fromRGBO(169, 117, 255, .8),
    800: Color.fromRGBO(169, 117, 255, .9),
    900: Color.fromRGBO(169, 117, 255, 1),
  };
  static const Color botToastBackgroundColor = Color(0x1F000000);

  static const Color primary = Color(0xff0d1a3f);
  static const Color secondary = Color(0xff5a73c4);
  static const Color error = Color(0xffb00020);

  static const Color black1 = Color(0xff263238);
  static const Color black2 = Color(0xff37474F);
  static const Color black3 = Color(0xff455A64);

  static const Color grey1 = Color(0xFF78909C);
  static const Color grey2 = Color(0xFF90A4AE);
  static const Color grey3 = Color(0xFFB0BEC5);
  static const Color grey4 = Color(0xFFCFD8DC);

  static const Color white1 = Color(0xffFFFFFF);
  static const Color white2 = Color(0xffECEFF1);
  static const Color white3 = Color(0xffD3D2D2);

  static const Color fbColor = Color(0xff0147A5);
  static const Color googleColor = Color(0xffF74134);
}


// white = onSecondary 
// black = shadow