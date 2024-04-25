import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammybread/common_widgets/app.bar.dart';
import 'package:jammybread/modules/authentication/models/user_model.dart';
import 'package:jammybread/modules/profile/controllers/profile_controller.dart';
import 'package:jammybread/utilities/colors.dart';
import 'package:jammybread/common_widgets/custom_button.dart';
import 'package:jammybread/common_widgets/text_field.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = '/edit-profile';

  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final controller = Get.put(ProfileController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light100,
      appBar: const CustomAppBar(
        title: 'Edit Profile',
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel userdata = snapshot.data as UserModel;
              return LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints viewportConatraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: viewportConatraints.maxHeight),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 20, right: 20),
                      child: IntrinsicHeight(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    InputField(
                                      initialValue: userdata.email,
                                      labelText: 'Email Address',
                                      // controller: controller.emailController,
                                      onChanged: (value) {
                                        controller.onChanged(value);
                                      },
                                    ),
                                    InputField(
                                      initialValue: userdata.fullName,

                                      labelText: 'Full Name',
                                      // controller: controller.fullNameController,
                                    ),
                                    InputField(
                                      initialValue: userdata.phoneNo,

                                      labelText: 'Phone Number',
                                      // controller: controller.fullNameController,
                                    ),
                                    InputField(
                                      initialValue: userdata.password,

                                      labelText: 'Password',

                                      // controller: controller.fullNameController,
                                    ),
                                    const SizedBox(height: 38),
                                  ],
                                ),
                              ),
                              Obx(() {
                                return PrimaryButton(
                                  isDisabled: controller.isDisabled.value,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      // final user = UserModel(
                                      //     fullName: controller
                                      //         .fullNameController.value.text,
                                      //     email: controller
                                      //         .emailController.value.text
                                      //         .trim(),
                                      //     phoneNo: controller.phoneNumber.value
                                      //         .trim(),

                                      //         );
                                      // print(
                                      //     'final number: ${controller.phoneNumber.value.trim()}');
                                      // SignUpController.instance
                                      //     .createUserWithPhoneverification(
                                      //         user);
                                    }
                                    // print(
                                    //     'final number: ${controller.phoneNumber.value.trim()}');
                                    // SignUpController.instance.phoneAuthentication(
                                    //     controller.phoneNumber.value.trim());
                                    // Get.toNamed(PhoneVerification.routeName,
                                    //     arguments: {controller.phoneNumber.value});
                                  },
                                  buttonText: 'Sign Up',
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        future: controller.getUserData(),
      ),
    );
  }
}
