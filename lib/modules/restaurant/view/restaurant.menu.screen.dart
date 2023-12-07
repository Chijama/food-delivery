import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jammybread/utilities/strings.dart';

class RestaurantMenu extends StatelessWidget {
  Widget get appBar => Padding(
        padding: EdgeInsets.all(20),
        child: Row(children: [
          
        ]),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
IconButton(icon: SvgPicture.asset(Strings.moreSquareIcon), iconSize: 36 ,onPressed: (){},)
      ]),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
