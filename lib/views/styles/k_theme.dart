import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';


class KThemeData {
  

  static final ThemeData mainTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffE5E5E5),
    primarySwatch:  const MaterialColor(0xffA975FF, KColor.mapColor),
  );
 

  static TextStyle headingBoldText = GoogleFonts.roboto(
    textStyle: Theme.of(Get.context!).textTheme.headline5!.copyWith(
          fontWeight: FontWeight.bold,
        ),
  );
}
