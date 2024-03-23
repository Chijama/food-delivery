import 'package:flutter/material.dart';
import 'package:jammybread/utilities/colors.dart';
import 'package:jammybread/utilities/theme.dart';
import 'package:jammybread/utilities/widgets/custom_button.dart';
import 'package:jammybread/utilities/widgets/text_field.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Welcome!',
              style: blackWeight500size22().copyWith(fontSize: 36),
            ),
            Text(
              'Sign up or Login to your Account',
              style: greyWeight400size17(),
            ),
            const SizedBox(
              height: 21,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90.0),
                color: pink60.withOpacity(0.4),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorWeight: 2,
                indicatorColor: pink100,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: whiteWeight400size17(),
                labelColor: light100,
                unselectedLabelColor: pink100,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  color: pink100,
                ),
                dividerHeight: 0,
                tabs: const [
                  Tab(text: 'Login'),
                  Tab(text: 'Sign Up'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [Login(), Text('sign up')],
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
              onPressed: () {},
              buttonText: 'Login',
            )
          ],
        ),
      ),
    );
  }
}
