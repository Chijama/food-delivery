import 'package:flutter/material.dart';

class AppColors {
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
      TextStyle(
        fontFamily: 'Everett',
        color: color,
        fontWeight: weight ?? FontWeight.w500,
        fontSize: fontSize ?? 19,
      );

  //Black Text

  TextStyle blackWeight400size33() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().dark100,
      fontWeight: FontWeight.w400,
      fontSize: 33,
    );
  }

  TextStyle blackWeight400size24() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().dark100,
      fontWeight: FontWeight.w400,
      fontSize: 24,
    );
  }

  TextStyle blackWeight400size14() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().dark100,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  TextStyle blackWeight400size12() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().dark100,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
  }

  TextStyle blackWeight400size17() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().dark100,
      fontWeight: FontWeight.w400,
      fontSize: 17,
    );
  }

  TextStyle blackWeight500size16() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().dark100,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );
  }

  TextStyle blackWeight500size14() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().dark100,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
  }

  TextStyle blackWeight500size17() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().dark100,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    );
  }

  TextStyle blackWeight500size21() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().dark100,
      fontWeight: FontWeight.w500,
      fontSize: 21,
    );
  }

  TextStyle blackWeight400size16() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().dark100,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );
  }

  //Blue Text
  TextStyle blueWeight500size18() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().blue100,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    );
  }

  TextStyle blueWeight600size16() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().blue100,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );
  }

  // Orange Text
  TextStyle peachWeight400size15() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().peach100,
      fontWeight: FontWeight.w400,
      fontSize: 15,
    );
  }

  //Grey Text
  TextStyle greyWeight400size13() {
    return const TextStyle(
      fontFamily: 'Everett',
      color: Color(0xff292d3299),
      fontWeight: FontWeight.w400,
      fontSize: 13,
    );
  }

  TextStyle greyWeight400size17() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().dark60,
      fontWeight: FontWeight.w400,
      fontSize: 17,
    );
  }

// White Text
  TextStyle whiteWeight500size14() {
    return TextStyle(
      fontFamily: 'Everett',
      color: AppColors().light100,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
  }
//Pink Text

// Blue
}
