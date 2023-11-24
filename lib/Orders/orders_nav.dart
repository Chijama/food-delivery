import 'package:flutter/material.dart';
import 'package:food_delivery/Orders/cancelled.dart';
import 'package:food_delivery/Orders/completed.dart';
import 'package:food_delivery/utils/strings.dart';
import 'package:food_delivery/utils/theme.dart';
import 'package:food_delivery/utils/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Themes().backgroundColor,
      appBar: AppBar(
        // leading: GestureDetector(
        //     onTap: () {
        //       Navigator.of(context).pop();
        //     },
        //     child: Icon(
        //       Icons.arrow_back_rounded,
        //       color: Themes().blackColor,
        //       size: 17,
        //     )),
        bottom: TabBar(
            labelPadding: const EdgeInsets.only(left: 20, right: 20),
            labelColor: Themes().primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.transparent,
            controller: tabController,
            labelStyle: TextStyles().blackTextStyle500(),
            tabs: const [
              Tab(
                text: Strings.active,
              ),
              Tab(
                text: Strings.completed,
              ),
              Tab(
                text: Strings.cancelled,
              )
            ]),
        actions: [
          GestureDetector(
            child: Icon(
              Icons.search_rounded,
              color: Themes().tetiaryColor,
            ),
          )
        ],
        title: Text('Orders',
            style: GoogleFonts.inter(
              color: Themes().blackColor,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            )),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: TabBarView(
        controller: tabController,
        children: [
          Text('Active'),
          CompletedOrders(),
          CancelledOrders()
        ],
      )),
    );
  }
}
