import 'package:dummy_api/views/styles/k_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class KTextTheme {
  static TextStyle tagTextStyle = GoogleFonts.oswald(
    fontWeight: FontWeight.w500,
    color: KThemeData.primaryColor,
  );
  static TextStyle nameTextStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    color: KThemeData.blackColor,
  );
  static TextStyle textTextStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.normal,
    color: KThemeData.blackColor,
  );
}
