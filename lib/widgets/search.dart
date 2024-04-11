import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jammybread/utilities/strings.dart';
import 'package:jammybread/utilities/textstyles.dart';
import 'package:jammybread/utilities/colors.dart';

class Search extends StatelessWidget {
  final String hintText;

  const Search({super.key, required this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: light80,
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: IconButton(
              iconSize: 22,
              onPressed: () {},
              icon: SvgPicture.asset(
                Strings.searchIcon,
              ),
            ),
            hintText: hintText,
            hintStyle: greyWeight400size17()),
      ),
    );
  }
}
