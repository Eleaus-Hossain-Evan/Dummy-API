import 'package:dummy_api/presentation/styles/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class KTextTheme {
  static TextStyle tagTextStyle = GoogleFonts.oswald(
    fontWeight: FontWeight.w500,
    color: KColor.primaryColor,
  );
  static TextStyle nameTextStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    color: KColor.blackColor,
  );
  static TextStyle textTextStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.normal,
    color: KColor.blackColor,
  );
}
