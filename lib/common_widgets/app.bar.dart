import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jammybread/utilities/strings.dart';
import 'package:jammybread/utilities/theme.dart';
import 'package:jammybread/utilities/colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      this.moreOnPressed,
      this.searchOnPressed,
      this.shoppingOnPressed,
      this.exportOnPressed})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final void Function()? exportOnPressed;

  final void Function()? moreOnPressed;
  final void Function()? searchOnPressed;
  final void Function()? shoppingOnPressed;

  @override
  final Size preferredSize;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        widget.exportOnPressed != null
            ? IconButton(
                icon: SvgPicture.asset(Strings.moreSquareIcon),
                iconSize: 36,
                onPressed: widget.exportOnPressed)
            : Container(),
        widget.moreOnPressed != null
            ? IconButton(
                icon: SvgPicture.asset(Strings.moreSquareIcon),
                iconSize: 36,
                onPressed: widget.moreOnPressed)
            : Container(),
        widget.searchOnPressed != null
            ? IconButton(
                icon: SvgPicture.asset(Strings.searchBlackIcon),
                iconSize: 36,
                onPressed: () {},
              )
            : Container(),
        widget.shoppingOnPressed != null
            ? IconButton(
                icon: SvgPicture.asset(Strings.shoppingBagIcon),
                iconSize: 36,
                onPressed: () {},
              )
            : Container(),
      ],
      leading: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            iconSize: 24,
            color: dark100,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // SizedBox(width: 5,),
          Text(
            'Back',
            style: blackWeight500size14(),
          ),
        ],
      ),
      leadingWidth: 100,
    );
  }
}
