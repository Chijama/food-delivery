import 'package:flutter/material.dart';
import 'package:food_delivery/utils/strings.dart';
import 'package:food_delivery/utils/theme.dart';
import 'package:food_delivery/utils/widgets.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget({super.key});

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: 
          
          
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  const SizedBox(height: 70),
                Text(
                  Strings.enterCode,
                  style: TextStyles().greenTextStyleBig600(),
                ),
                const SizedBox(height: 20),
                Text(
                  Strings.emailCode,
                  style: TextStyles().greenTextStyle400(),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OtpInput(_fieldOne, true, TextInputAction.next),
                    const SizedBox(width: 24),
                    OtpInput(_fieldTwo, false, TextInputAction.next),
                    const SizedBox(width: 24),
                    OtpInput(_fieldThree, false, TextInputAction.next),
                    const SizedBox(width: 24),
                    OtpInput(_fieldFour, false, TextInputAction.done),
                    const SizedBox(width: 24),
                  ],
                ),
                const SizedBox(height: 40),
                MyButton(
                  text: Strings.verify,
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                Text(
                  Strings.resendOtp,
                  style: TextStyles().greenTextStyle400Underline(),
                ),
              ],
            ),
         
      )),
    );
  }
}


