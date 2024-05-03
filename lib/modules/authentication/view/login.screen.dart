import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jammybread/common_widgets/custom_button.dart';
import 'package:jammybread/common_widgets/text_field.dart';
import 'package:jammybread/modules/authentication/controller/login_controller.dart';
import 'package:jammybread/modules/authentication/models/user_model.dart';
import 'package:jammybread/utilities/colors.dart';
import 'package:jammybread/utilities/strings.dart';
import 'package:jammybread/utilities/textstyles.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = Get.put(LoginController());

  bool? isDisabled = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                    InputField(
                      labelText: 'Password',
                      controller: controller.passwordController,
                      suffixIcon: true,
                      onChanged: (value) {
                        controller.onChanged(value);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: darkWeight400size14().copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(height: 38),
                    Row(children: [
                      Text(
                        'Or Login Using:  ',
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
                    // const Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() {
              return PrimaryButton(
                isLoading: controller.isLoading.value,
                isDisabled: controller.isDisabled.value,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    controller.login(
                        controller.emailController.value.text.trim(),
                        controller.passwordController.value.text.trim());
                  }
                },
                buttonText: 'Login',
              );
            })
          ],
        ),
      ),
    );
  }
}
