import 'package:flutter/material.dart';
import 'package:food_delivery/utils/theme.dart';


class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: Colors.white,
                backgroundColor: Themes().primaryColor,
                textStyle: const TextStyle(fontSize: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                text,
                style:
                    TextStyles().defaultText(16, FontWeight.w500, Colors.white),
              ),
            ),
          ),
        ],
      );
}



class MyOutlineButton extends StatelessWidget {
  const MyOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                
                backgroundColor: Colors.transparent,
                textStyle: const TextStyle(fontSize: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),side: BorderSide(width: 2,color: Themes().greenColor)
                ),
              ),
              child: Text(
                text,
                style:
                    TextStyles().defaultText(15, FontWeight.w500, Themes().blackColor),
              ),
            ),
          ),
        ],
      );
}