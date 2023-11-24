
import 'package:flutter/material.dart';

import 'package:food_delivery/utils/widgets.dart';

class CancelledOrders extends StatefulWidget {
  @override
  _CancelledOrdersState createState() => _CancelledOrdersState();
}

class _CancelledOrdersState extends State<CancelledOrders> {
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
              return OrderItem(isCancelled: true,);
          
            },
          ))),
    );
  }
}


