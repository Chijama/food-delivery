import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Themes {
  //pink
  Color pink60 = const Color(0xffFDD3E1);
  Color pink80 = const Color(0xffF69DBB);
  Color pink100 = const Color(0xffF4739E);
  Color pink120 = const Color(0xffD55881);
  Color pink140 = const Color(0xff953756);

  //blue
  Color blue60 = const Color(0xffBBE8FB);
  Color blue80 = const Color(0xff80D1F4);
  Color blue100 = const Color(0xff45B8E9);
  Color blue120 = const Color(0xff3294BD);
  Color blue140 = const Color(0xff1A6C8E);

  //peach
  Color peach60 = const Color(0xffFCE2CF);
  Color peach80 = const Color(0xffF6BA8D);
  Color peach100 = const Color(0xffEA985B);
  Color peach120 = const Color(0xffD47F40);
  Color peach140 = const Color(0xffA4602D);

  //dark
  Color dark60 = const Color(0xffB3BFCB);
  Color dark80 = const Color(0xff6A798A);
  Color dark90 = const Color(0xff46505D);
  Color dark100 = const Color(0xff292D32);
  Color dark120 = const Color(0xff151719);

  //light
  Color light100 = const Color(0xffFFFFFF);
  Color light80 = const Color(0xffEFF2F5);
  Color light60 = const Color(0xffD5DEE7);
}

class TextStyles {
  TextStyle defaultText(final double? fontSize, final FontWeight? weight,
          final Color color) =>
      GoogleFonts.signika(
        color: color,
        fontWeight: weight ?? FontWeight.w500,
        fontSize: fontSize ?? 19,
      );

  //Black Text

  TextStyle blackWeight400size36() {
    return GoogleFonts.signika(
      color: Themes().dark100,
      fontWeight: FontWeight.w400,
      fontSize: 36,
    );
  }

  TextStyle blackWeight400size12() {
    return GoogleFonts.signika(
      color: Themes().dark100,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
  }

  TextStyle blackWeight500size16() {
    return GoogleFonts.signika(
      color: Themes().dark100,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );
  }

  TextStyle blackWeight500size17() {
    return GoogleFonts.signika(
      color: Themes().dark100,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    );
  }

  TextStyle blackWeight500size21() {
    return GoogleFonts.signika(
      color: Themes().dark100,
      fontWeight: FontWeight.w500,
      fontSize: 21,
    );
  }

  //Blue Text
  TextStyle blueWeight500size18() {
    return GoogleFonts.signika(
      color: Themes().blue100,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    );
  }

  // Orange Text
  TextStyle peachWeight400size17() {
    return GoogleFonts.signika(
      color: Themes().peach100,
      fontWeight: FontWeight.w400,
      fontSize: 17,
    );
  }
   //Grey Text
  TextStyle greyWeight400size13() {
    return GoogleFonts.signika(
      color:  const Color(0xff292D3299),
      fontWeight: FontWeight.w400,
      fontSize: 13,
    );
  }
  TextStyle greyWeight400size17() {
    return GoogleFonts.signika(
      color: Themes().dark60,
      fontWeight: FontWeight.w400,
      fontSize: 17,
    );
  }

// White Text
//Pink Text
 
}