import 'package:flutter/material.dart';
import 'package:jammybread/common_widgets/custom_button.dart';
import 'package:jammybread/common_widgets/text_field.dart';



class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
              onPressed: () {
                 if (formKey.currentState!.validate()) {
                      
                      }
              },
              buttonText: 'Login',
            )
          ],
        ),
      ),
    );
  }
}
