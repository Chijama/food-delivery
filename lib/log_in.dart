import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/create_account.dart';
import 'package:food_delivery/forgot_passwod.dart';
import 'package:food_delivery/utils/strings.dart';
import 'package:food_delivery/utils/theme.dart';
import 'package:food_delivery/utils/widgets.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isRememberMesaved = false;
  //Remember toggle button function

  void toggleSwitch(bool value) {
    if (isRememberMesaved == false) {
      setState(() {
        isRememberMesaved = true;
      });
      log('Switch Button is ON');
    } else {
      setState(() {
        isRememberMesaved = false;
      });
      log('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SizedBox(
            height: 300,
            child: Image.asset(
              Strings.imgNaan,
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        Scaffold(
            backgroundColor: Themes().whiteBackgroundColor,
            body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      expandedHeight: 200,
                      flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  Colors.black.withOpacity(0.5),
                                  Colors.white.withOpacity(0)
                                ])),
                          ),
                          title: TextButton(
                            onPressed: () {},
                            child: const Text(Strings.signUp),
                          )),
                      pinned: true,
                      // floating: true,
                      // snap: true,
                      actions: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            Strings.signUp,
                            style: TextStyles().whiteTextStyle500(),
                          ),
                        )
                      ],
                    ),
                  ];
                },
                body: Container(
                  // decoration: BoxDecoration( color: Colors.red,
                  //     borderRadius:
                  //         BorderRadius.vertical(top: Radius.circular(70))),
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Strings.welcomeBack,
                            style: TextStyles().greenTextStyleBig600(),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Form(
                            child: Column(children: [
                              const TextBoxWidget(
                                label: Strings.emailAddress,
                              ),
                              const TextBoxWidget(
                                label: Strings.password,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 28,
                                        child: FittedBox(
                                          child: CupertinoSwitch(
                                              value: isRememberMesaved,
                                              onChanged: toggleSwitch),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(Strings.rememberMe,
                                          style:
                                              TextStyles().blackTextStyle400())
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPassword(),
                                        ),
                                      );
                                    },
                                    child: Text(Strings.forgotPassword,
                                        style: TextStyles()
                                            .greenTextStyle400Underline()),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              MyButton(
                                text: Strings.logIn,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute<Widget>(
                                          builder: (BuildContext context) =>
                                              const CreateAccount()));
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MyOutlineButton(
                                text: Strings.signUpWithGoogle,
                                onPressed: () {},
                              )
                            ]),
                          )
                        ]),
                  ),
                ))),
      ],
    );
  }
}
