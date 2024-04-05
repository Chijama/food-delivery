import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jammybread/services/firebase_auth_methods.dart';
import 'package:jammybread/utilities/show_snack_bar.dart';
import 'package:jammybread/common_widgets/custom_button.dart';
import 'package:jammybread/common_widgets/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void register() async {
    // get auth service
    final authService = AuthService();
    try {
      await authService.signUpWithEmailPassword(
          emailController.value.text, passwordController.value.text, context);
      print(
        emailController.value.text,
      );
      print(passwordController.value.text);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 24),
            EmailTextField(
              labelText: 'Email Address',
              controller: emailController,
            ),
            InputField(
              labelText: 'Password',
              controller: passwordController,
              suffixIcon: true,
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: register,
              buttonText: 'Sign Up',
            )
          ],
        ),
      ),
    );
  }
}
