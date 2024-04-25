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
      body: FutureBuilder<UserModel>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Make sure to handle any errors here
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            UserModel userdata = snapshot.data!;
            // Data from TextFields
            final TextEditingController emailController =
                TextEditingController(text: userdata.email);
            final TextEditingController passwordController =
                TextEditingController(text: userdata.password);
            final TextEditingController fullNameController =
                TextEditingController(text: userdata.fullName);
            final TextEditingController phoneController =
                TextEditingController(text: userdata.phoneNo);

            // Build your widgets here using userdata
            return LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConatraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConatraints.maxHeight),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
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
                                    labelText: 'Email Address',
                                    controller: emailController,
                                    onChanged: (value) {
                                      controller.onChanged(value);
                                    },
                                  ),
                                  InputField(
                                    labelText: 'Full Name',
                                    controller: fullNameController,
                                    onChanged: (value) {
                                      controller.onChanged(value);
                                    },
                                  ),
                                  InputField(
                                    labelText: 'Phone Number',
                                    controller: phoneController,
                                    onChanged: (value) {
                                      controller.onChanged(value);
                                    },
                                  ),
                                  InputField(
                                    suffixIcon: true,
                                    labelText: 'Password',
                                    controller: passwordController,
                                    onChanged: (value) {
                                      controller.onChanged(value);
                                    },
                                  ),
                                  const SizedBox(height: 38),
                                ],
                              ),
                            ),
                            Obx(() {
                              return PrimaryButton(
                                isDisabled: controller.isDisabled.value,
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    final userData = UserModel(
                                      id: userdata.id,
                                        fullName: fullNameController.value.text,
                                        email:
                                            emailController.value.text.trim(),
                                        phoneNo:
                                            phoneController.value.text.trim(),
                                        password:
                                            passwordController.value.text);
                                    await controller.updateRecord(userData);
                                    //         );
                                    // debugPrint(
                                    //     'final number: ${controller.phoneNumber.value.trim()}');
                                    // SignUpController.instance
                                    //     .createUserWithPhoneverification(
                                    //         user);
                                  }
                               
                                },
                                buttonText: 'Save Changes',
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
          } else {
            return const Center(child: Text('No user data available'));
          }
        },
        future: controller.getUserData(),
      ),
    );
  }
}
