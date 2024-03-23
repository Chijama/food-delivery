import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jammybread/utilities/colors.dart';
import 'package:jammybread/utilities/theme.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final Color buttonColor;

  final String buttonText;
  final void Function()? onPressed;
  final Widget? label;
  final bool isDisabled;
  final bool isLoading;
  const PrimaryButton({
    super.key,
    this.width = double.infinity,
    this.buttonColor = blue100,
    required this.onPressed,
    required this.buttonText,
    this.label,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: isLoading
            ? null
            : isDisabled
                ? null
                : onPressed,
        child: Container(
          width: width,
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isLoading
                ? blue100
                : isDisabled
                    ? blue60
                    : buttonColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: isLoading
              ? const CupertinoActivityIndicator()
              : label ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buttonText,
                        style: whiteWeight500size14().copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: light100,
                        size: 22,
                      )
                    ],
                  ),
        ),
      ),
    );
  }
}

// class CustomBackButton extends StatelessWidget {
//   const CustomBackButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         CustomNavigator.pop(context);
//       },
//       icon: SvgPicture.asset(SvgAssetPath.arrow),
//     );
//   }
// }
