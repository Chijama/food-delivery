import 'package:flutter/material.dart';
import 'package:jammybread/utilities/theme.dart';


class CategoryItem extends StatelessWidget {
  final String image;
  final String label;

  const CategoryItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors().peach100.withOpacity(0.12),
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
