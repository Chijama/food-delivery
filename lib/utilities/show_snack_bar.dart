import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowSnackBar extends StatelessWidget {
  final String message;
  const ShowSnackBar({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return GetSnackBar(
      message: message,
    );
  }
}
