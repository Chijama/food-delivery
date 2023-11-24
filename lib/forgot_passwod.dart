import 'package:flutter/material.dart';
import 'package:food_delivery/log_in.dart';
import 'package:food_delivery/utils/strings.dart';
import 'package:food_delivery/utils/theme.dart';
import 'package:food_delivery/utils/widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController controller = TextEditingController();

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
                  Strings.forgotPassword,
                  style: TextStyles().greenTextStyleBig600(),
                ),
                const SizedBox(height: 20),
                Text(
                  Strings.shortLorem,
                  style: TextStyles().greenTextStyle400(),
                ),
                const SizedBox(height: 50),
                TextFormField(controller: controller,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_rounded,
                          color: Themes().primaryColor,
                        ),
                        focusColor: Colors.black,
                        hintText: 'Email')),
                const SizedBox(height: 30),
                MyButton(
                  text: Strings.verify,
                  onPressed: () {},
                ),
              ],
            ),
          
      )),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  const OtpInput(this.controller, this.autoFocus, this.textInputAction,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
          color: Themes().seaShellColor,
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: TextField(
        textInputAction: textInputAction,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.white,
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
