import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/utilities/textstyles.dart';

class ShowSnackBar extends StatelessWidget {
  final String message;
  final bool success;
  const ShowSnackBar({super.key, required this.message, this.success=false});

  @override
  Widget build(BuildContext context) {
    return GetSnackBar(
      message: message,
      backgroundColor: Colors.white.withOpacity(0.4),
      titleText: Text(  message,style: blackWeight500size16().copyWith(color: success ? Colors.green:Colors.red ),),
    );
  }
}
