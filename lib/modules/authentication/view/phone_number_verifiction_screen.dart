import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jammybread/common_widgets/app.bar.dart';
import 'package:jammybread/common_widgets/custom_button.dart';
import 'package:jammybread/modules/authentication/controller/phone_verification_controller.dart';
import 'package:jammybread/utilities/colors.dart';
import 'package:jammybread/utilities/strings.dart';
import 'package:jammybread/utilities/textstyles.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class PhoneVerification extends StatefulWidget {
  static const String routeName = '/phone-verification';
  final String phoneNo;
  const PhoneVerification({super.key, required this.phoneNo});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final controller = Get.put(PhoneVerificationController());

  bool? isDisabled = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConatraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConatraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: IntrinsicHeight(
                child: Form(
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Verify Phone Number',
                              style:
                                  blackWeight500size22().copyWith(fontSize: 30),
                              overflow: TextOverflow.fade,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                                'We have sent you a 6 digit code. Please enter here to Verify your Number.',
                                style: greyWeight400size17(),
                                overflow: TextOverflow.fade),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 8),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(35)),
                                      color: light80),
                                  child: Text(
                                    widget.phoneNo,
                                    style: darkWeight400size14(),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(115),
                                        color: peach60),
                                    child: SvgPicture.asset(Strings.edit2),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 50),
                            SizedBox(
                              height: 60,
                              child: OtpTextField(
                                // fieldWidth: 62,
                                numberOfFields: 6,
                                margin: const EdgeInsets.only(right: 18),

                                filled: true,
                                fillColor: light80,
                                borderRadius: BorderRadius.circular(10),
                                borderWidth: 1,
                                textStyle: blackWeight500size17(),
                                showFieldAsBox: true,

                                onSubmit: (code) {
                                  otp = code;
                                  PhoneVerificationController.instance
                                      .verifyPhoneNumber(otp);
                                  //  showDialog(
                                  //   context: context,
                                  //   builder: (context) {
                                  //     return AlertDialog(
                                  //       title: const Text("Verification Code"),
                                  //       content: Text('Code entered is $verificationCode'),
                                  //     );
                                  //   });
                                }, // end onSubmit
                              ),
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  text: "Didn't receive code? ",
                                  style: darkWeight400size16(),
                                  children: [
                                    TextSpan(
                                        text: "Resend code",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                        style: darkWeight400size16().copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                            color: pink100)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 45),
                          ],
                        ),
                      ),
                      PrimaryButton(
                        onPressed: () {
                          print(otp);
                          PhoneVerificationController.instance
                              .verifyPhoneNumber(otp);
                        },
                        buttonText: 'Verify and Continue',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
