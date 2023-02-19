import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dimensions.dart';
import 'text_theme_style_x.dart';

// onPrimary white
// shadow black

class CustomStyle {
  CustomStyle.internal();
  static final CustomStyle _customStyle = CustomStyle.internal();
  static get customStyleInstance => _customStyle;

  static TextStyle headingBoldText = GoogleFonts.roboto(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  final textFieldStyle = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    color: useContext().color.shadow,
  );

  //? Onboard Screen
  final onboardSkipStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
    color: useContext().color.shadow,
  );

  final onboardTitleStyle = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.bold,
    color: useContext().color.shadow,
  );

  final onboardDescriptionStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
    color: useContext().color.shadow.withOpacity(0.8),
  );

  //? Home Screen
  final homeSearchStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    color: useContext().color.shadow,
  );

  //? Product Details Screen
  final regularPrice = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    color: useContext().color.shadow,
    decoration: TextDecoration.lineThrough,
  );

  final sellingPrice = TextStyle(
    fontSize: Dimensions.bigTextSize,
    color: useContext().color.shadow,
    fontWeight: FontWeight.bold,
  );

  final productDetailsTitleStyle = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    color: useContext().color.shadow,
    fontWeight: FontWeight.bold,
  );

  final productAvialableStyle = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    color: useContext().color.shadow,
  );
}
