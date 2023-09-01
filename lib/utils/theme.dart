import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Themes {
  Color primaryColor = const Color(0xffF36F21);
  Color secondaryColor = const Color(0xff333333);
  Color tetiaryColor = const Color(0xff888888);
  Color greenColor = Colors.green;
  Color blackColor = Colors.black;
  Color backgroundColor = Colors.white;
  Color whiteColor = Colors.white;
}

class TextStyles {
  TextStyle defaultText(final double? fontSize, final FontWeight? weight,
          final Color color) =>
      GoogleFonts.inter(
        color: color,
        fontWeight: weight ?? FontWeight.w500,
        fontSize: fontSize ?? 19,
      );

  //Green Text

  TextStyle greenTextStyle400() => GoogleFonts.inter(
        color: Themes().greenColor,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        decoration: TextDecoration.underline
      );

  TextStyle blackTextStyle(final double? fontSize, final FontWeight? weight) =>
      GoogleFonts.inter(
        color: Themes().secondaryColor,
        fontWeight: weight ?? FontWeight.w500,
        fontSize: fontSize ?? 16,
      );

  TextStyle purpleTextStyle() {
    return GoogleFonts.inter(
      color: Themes().tetiaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );
  }

  //Black style

  TextStyle blackTextStyle400() {
    return GoogleFonts.inter(
      color: Themes().blackColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  TextStyle blackTextStyle700() {
    return GoogleFonts.inter(
      color: Themes().blackColor,
      fontWeight: FontWeight.w700,
      fontSize: 19,
    );
  }

  //Grey

  TextStyle greyTextStyle400() {
    return GoogleFonts.inter(
      color: Themes().tetiaryColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  TextStyle greyTextStyle700() {
    return GoogleFonts.inter(
      color: Themes().tetiaryColor,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    );
  }

  TextStyle darkGreyTextStyle400() {
    return GoogleFonts.inter(
      color: Themes().secondaryColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  TextStyle darkGreyTextStyle700() {
    return GoogleFonts.inter(
      color: Themes().secondaryColor,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    );
  }
}
