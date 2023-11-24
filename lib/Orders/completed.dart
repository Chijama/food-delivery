import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/strings.dart';
import 'package:food_delivery/utils/theme.dart';
import 'package:food_delivery/utils/widgets.dart';

class CompletedOrders extends StatefulWidget {
  @override
  _CompletedOrdersState createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 50,
            itemBuilder: (context, index) {
              return OrderItem(isCancelled: false,);
              // Container(
              //   margin: EdgeInsets.only(bottom: 15),
              //   height: 178,
              // decoration: BoxDecoration(
              //     color: Themes().whiteBackgroundColor,
              //     borderRadius: BorderRadius.only(
              //         bottomLeft: Radius.circular(5),
              //         bottomRight: Radius.circular(5),
              //         topRight: Radius.circular(5))),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [OrderItem(isCancelled: false,), Padding(
              //     padding: const EdgeInsets.only(left: 10,right: 15),
              //     child: Row(children: [

              //     ],),
              //   )],
              // ),
              // );
            },
          ))),
    );
  }
}


