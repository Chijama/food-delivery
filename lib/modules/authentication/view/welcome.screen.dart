import 'package:flutter/material.dart';
import 'package:jammybread/modules/authentication/view/login.screen.dart';
import 'package:jammybread/modules/authentication/view/signup.screen.dart';
import 'package:jammybread/utilities/colors.dart';
import 'package:jammybread/utilities/theme.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
                children: const [Login(), SignUp()],
              ),
            )
          ],
        ),
      ),
    );
  }
}