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
          color: Themes().light80, borderRadius: const BorderRadius.all(Radius.circular(14))),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: SvgPicture.asset(
              Strings.searchIcon,
              height: 24,
              width: 24,
            ),
            hintText: hintText,
            hintStyle: TextStyles().greyWeight400size17()),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String image;
  final String label;

  const CategoryItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Themes().peach100.withOpacity(0.12),
      radius: 51,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.asset(image),
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: TextStyles().blackWeight500size16(),
          )
        ],
      ),
    );
  }
}
