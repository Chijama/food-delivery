import 'package:flutter/material.dart';
import 'package:jammybread/common_widgets/custom_button.dart';
import 'package:jammybread/common_widgets/text_field.dart';
import 'package:jammybread/services/firebase_auth_methods.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool? isDisabled = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          EmailTextField(
            labelText: 'Email Address',
            controller: emailController,
            onChanged: (val) {
              setState(() {
                if (val.isEmpty) {
                  isDisabled = true;
                } else {
                  isDisabled = false;
                }
              });
            },
          ),
          InputField(
            labelText: 'Password',
            controller: passwordController,
            suffixIcon: true,
            onChanged: (val) {
              setState(() {
                if (val.isEmpty) {
                  isDisabled = true;
                } else {
                  isDisabled = false;
                }
              });
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
          const Spacer(),
          PrimaryButton(
            isDisabled: isDisabled!,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                AuthService().signInWithEmailPassword(
                    emailController.value.text,
                    passwordController.value.text,
                    context);
              }
            },
            buttonText: 'Login',
          )
        ],
      ),
    );
  }
}
