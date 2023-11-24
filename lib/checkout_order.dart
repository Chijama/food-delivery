import 'package:flutter/material.dart';
import 'package:food_delivery/utils/theme.dart';
import 'package:food_delivery/utils/widgets.dart';
class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes().backgroundColor,
      appBar: buildAppBar2(context, 'Checkout Order', false),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding:  const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Themes().whiteBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(8)),


              ),
              child: Column(children: [
Text('Delivery Location', style: TextStyles().blackTextStyle600(),),
const SizedBox(height: 20),
SizedBox(
  height: 40,
  child:   Row(children: [
  
    CircleAvatar(child: Container(child: const Icon(Icons.location_on_rounded)),),
  const SizedBox(width: 10,),
    Column(
      children: [
        Row(children: [
          Text('Home', style:TextStyles().blackTextStyle500(),), Text('Default', style: TextStyles().orangeTextStyle500(),)
        ],),
        Text('Banana Island, Lagos', style: TextStyles().greyTextStyle400(),)
      ],
    ), 
    IconButton(icon: const Icon(Icons.arrow_forward_ios_rounded), onPressed: () {
      
    },)
  
  ],),
)

                
              ],),
            )
          ],
        ),
      )),
      
    );
  }
}