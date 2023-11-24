import 'package:flutter/material.dart';
import 'package:food_delivery/log_in.dart';
import 'package:food_delivery/otp.dart';
import 'package:food_delivery/utils/strings.dart';
import 'package:food_delivery/utils/theme.dart';
import 'package:food_delivery/utils/widgets.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute<Widget>(
                                      builder: (BuildContext context) =>
                                          const LogIn()));
                            },
                            child: const Text(Strings.logIn),
                          )),
                      pinned: true,
                      // floating: true,
                      // snap: true,
                      actions: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            Strings.logIn,
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
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            Strings.imHungry,
                            style: TextStyles().greenTextStyleBig600(),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Form(
                            child: Column(children: [
                              const TextBoxWidget(
                                label: Strings.fullName,
                              ),
                              const TextBoxWidget(
                                label: Strings.fullName,
                              ),
                              const TextBoxWidget(
                                label: Strings.fullName,
                              ),
                              MyButton(
                                text: Strings.createNew,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute<Widget>(
                                          builder: (BuildContext context) =>
                                              const OtpWidget()));
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
