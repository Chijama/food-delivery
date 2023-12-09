import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jammybread/utilities/strings.dart';
import 'package:jammybread/utilities/theme.dart';

class Search extends StatelessWidget {
  final String hintText;

  const Search({super.key, required this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors().light80,
          borderRadius: const BorderRadius.all(Radius.circular(14))),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: IconButton(
              iconSize: 24,
              onPressed: () {},
              icon: SvgPicture.asset(
                Strings.searchIcon,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyles().greyWeight400size17()),
      ),
    );
  }
}