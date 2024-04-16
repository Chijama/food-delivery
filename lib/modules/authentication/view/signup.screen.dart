import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jammybread/modules/authentication/controller/sign_up_controller.dart';
import 'package:jammybread/modules/authentication/view/phone_number_verifiction_screen.dart';
import 'package:jammybread/services/firebase_auth_methods.dart';
import 'package:jammybread/utilities/colors.dart';
import 'package:jammybread/common_widgets/custom_button.dart';
import 'package:jammybread/common_widgets/text_field.dart';
import 'package:jammybread/utilities/strings.dart';
import 'package:jammybread/utilities/textstyles.dart';

class SignUp extends StatefulWidget {
  static const String routeName = '/sign-up';

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final controller = Get.put(SignUpController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light100,
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            EmailTextField(
              labelText: 'Email Address',
              controller: controller.emailController,
              onChanged: (value) {
                controller.onChanged(value);
              },
            ),
            Text('Phone Number', style: blackWeight400size14()),
            const SizedBox(height: 8),
            IntlPhoneField(
              dropdownIconPosition: IconPosition.trailing,
              decoration: InputDecoration(
                filled: true,
                fillColor: light80,
                hintText: '000 000 0000',
                hintStyle: TextStyle(color: dark60),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: dark100, width: 1.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: dark100, width: 1.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 2.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 2.0),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.phone,

              initialCountryCode: 'NG', // Initial selection of the country code
              onChanged: (phone) {
                controller.phoneNumber.value = phone.completeNumber;
                print(controller.phoneNumber);
                controller.onChanged(controller.phoneNumber.value.trim());
              },
              // onSubmitted: (phone) {
              //   controller.phoneNumber = phone;
              // },
            ),
            InputField(
              labelText: 'Password',
              controller: controller.passwordController,
              suffixIcon: true,
              onChanged: (value) {
                controller.onChanged(value);
              },
            ),
            const SizedBox(height: 38),
            Row(children: [
              Text(
                'Or Sign Up Using:  ',
                style: darkWeight400size14(),
              ),
              const Expanded(
                child: Divider(
                  color: light60,
                ),
              )
            ]),
            const SizedBox(
              height: 28,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  border: Border.all(color: light60, width: 1.5)),
              child: Image.asset(Strings.google),
            ),
            const Spacer(),
            Obx(() {
              return PrimaryButton(
                isDisabled: controller.isDisabled.value,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print(
                        'final number: ${controller.phoneNumber.value.trim()}');
                    SignUpController.instance.phoneAuthentication(
                        controller.phoneNumber.value.trim());
                    Get.toNamed(PhoneVerification.routeName,
                        arguments: controller.phoneNumber.value);
                  }
                },
                buttonText: 'Sign Up',
              );
            })
          ],
        ),
      ),
    );
  }
}
