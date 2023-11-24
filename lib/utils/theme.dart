import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Themes {
  Color primaryColor = const Color(0xffF36F21);
  Color secondaryColor = const Color(0xff333333);
  Color tetiaryColor = const Color(0xff888888);
  Color greenColor = const Color(0xff305029);
  Color seaShellColor = const Color(0xffFFF3E7);

  Color blackColor = Colors.black;
  Color whiteBackgroundColor = Colors.white;
  Color backgroundColor = const Color(0xffFAFAFA);

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

  TextStyle greenTextStyle400Underline() => GoogleFonts.inter(
      color: Themes().greenColor,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      decoration: TextDecoration.underline);
  TextStyle greenTextStyle400() => GoogleFonts.inter(
        color: Themes().greenColor,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );
  TextStyle greenTextStyle600() => GoogleFonts.inter(
        color: Themes().greenColor,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  TextStyle greenTextStyleBig600() => GoogleFonts.inter(
        color: Themes().greenColor,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      );

  TextStyle blackTextStyle(final double? fontSize, final FontWeight? weight) =>
      GoogleFonts.inter(
        color: Themes().blackColor,
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
  //White style

  TextStyle whiteTextStyle500() {
    return GoogleFonts.inter(
      color: Themes().whiteColor,
      fontWeight: FontWeight.w500,
      fontSize: 13,
    );
  }
    TextStyle whiteTextStyle400() {
    return GoogleFonts.inter(
      color: Themes().whiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
  }

  TextStyle whiteTextStyle700() {
    return GoogleFonts.inter(
      color: Themes().whiteColor,
      fontWeight: FontWeight.w700,
      fontSize: 22,
    );
  }
  //Orange style

  TextStyle orangeTextStyle400() {
    return GoogleFonts.inter(
      color: Themes().primaryColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  TextStyle orangeTextStyle500() {
    return GoogleFonts.inter(
      color: Themes().primaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
  }

  TextStyle orangeTextStyle600() {
    return GoogleFonts.inter(
      color: Themes().primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );
  }

  TextStyle orangeTextStyle700() {
    return GoogleFonts.inter(
      color: Themes().primaryColor,
      fontWeight: FontWeight.w700,
      fontSize: 19,
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
TextStyle blackTextStyle500() {
    return GoogleFonts.inter(
      color: Themes().blackColor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
  }
  TextStyle blackTextStyle600() {
    return GoogleFonts.inter(
      color: Themes().blackColor,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );
  }

    TextStyle black17TextStyle600() {
    return GoogleFonts.inter(
      color: Themes().blackColor,
      fontWeight: FontWeight.w600,
      fontSize: 19,
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
