import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:food_delivery/create_account.dart';
import 'package:food_delivery/utils/strings.dart';
import 'package:food_delivery/utils/theme.dart';
import 'package:food_delivery/utils/widgets.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _pageIndex = 0;

  PageController pageViewcontroller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Themes().whiteBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * 0.65,
                  padding: const EdgeInsets.all(20),
                  child: PageView(
                    allowImplicitScrolling: true,
                    scrollDirection: Axis.horizontal,
                    controller: pageViewcontroller,
                    children: <Widget>[
                      slided(Strings.imgKebab, Strings.orderFood,
                          Strings.shortLorem),
                      slided(Strings.imgFries, Strings.orderFood,
                          Strings.shortLorem),
                      slided(Strings.imgRicsxChicken, Strings.orderFood,
                          Strings.shortLorem),
                    ],
                    onPageChanged: (int index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                  ),
                ),
                CustDotIndicator(
                  currentPage: _pageIndex,
                  count: 3,
                  custMaiN: MainAxisAlignment.start,
                  //  custCross: CrossAxisAlignment.start,
                ),
                const SizedBox(height: 50),
                MyButton(
                  onPressed: () {
                    pageViewcontroller.nextPage(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.linearToEaseOut);
                    if (_pageIndex == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute<Widget>(
                              builder: (BuildContext context) =>
                                  const CreateAccount()));
                    }
                  },
                  text: Strings.next,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                            builder: (BuildContext context) =>
                                const CreateAccount()));
                  },
                  child: Text(
                    Strings.skip,
                    style: TextStyles().greenTextStyle400Underline(),
                  ),
                )
              ]),
        ),
      )),
    );
  }

  Widget slided(String image, String text1, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          // flex: 6,
          child: CircleAvatar(
            radius: 90,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          text1,
          style: TextStyles().blackTextStyle700(),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: TextStyles().blackTextStyle400(),
        ),
        const SizedBox(height: 13.5),
      ],
    );
  }
}

class CustDotIndicator extends StatelessWidget {
  const CustDotIndicator({
    required this.count,
    required this.custMaiN,
    //  required this.custCross,
    required this.currentPage,
    Key? key,
  }) : super(key: key);
  final int count;
  final int currentPage;
  final MainAxisAlignment custMaiN;
  // final CrossAxisAlignment custCross;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      reversed: false,
      mainAxisAlignment: custMaiN,
      dotsCount: count,
      position: currentPage,
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeSize: const Size(16, 16),
          spacing: const EdgeInsets.fromLTRB(3.0, 10, 3, 10),
          size: const Size(16, 16),
          activeColor: Themes().primaryColor,
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Themes().primaryColor, width: 2))),
    );
  }
}
