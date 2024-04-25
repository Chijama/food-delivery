import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jammybread/modules/profile/controllers/profile_controller.dart';
import 'package:jammybread/modules/profile/view/edit.profile.screen.dart';
import 'package:jammybread/utilities/strings.dart';
import 'package:jammybread/utilities/textstyles.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/profile';

  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
  final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(title: Text('Profile',style: blackWeight500size17(),),centerTitle: true,),
      body:Padding(
        padding: const EdgeInsets.only(
          left: 30,
          // horizontal: 48,
          top: 60,
        ),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 37,
                    backgroundColor: Colors.red,
                  ),
                  const SizedBox(height: 10),
                  Text('Blessing Asukwo', style: blackWeight500size14()),
                ],
              ),
            ),
            const SizedBox(height: 40),
            DrawerTile(
              label: 'Edit Profile',
              onTap: () => Get.toNamed(EditProfile.routeName),
              icon: Strings.frame,
            ),
            const DrawerTile(
              label: 'Settings',
              icon: Strings.setting,
            ),
            const DrawerTile(label: 'Invite and earn', icon: Strings.moneys),
            const DrawerTile(label: 'Visit Our Blog', icon: Strings.global),
            const DrawerTile(label: 'Contact Us', icon: Strings.messages3),
            const DrawerTile(label: 'FAQs', icon: Strings.messageQuestion),
            const DrawerTile(label: 'Rate Us', icon: Strings.star),
            DrawerTile(label: 'Log Out', icon: Strings.logout, onTap:()=> controller.logOut(),)
          ],
        ), 
    ));
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });
  final String label;
  final String icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
          title: Text(
            label,
            style: blackWeight400size14(),
          ),
          leading: SvgPicture.asset(icon)),
    );
  }
}