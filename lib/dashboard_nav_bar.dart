import 'package:flutter/material.dart';
import 'package:food_delivery/Orders/orders_nav.dart';
import 'package:food_delivery/home.dart';

import 'package:food_delivery/utils/strings.dart';
import 'package:food_delivery/utils/theme.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0; //New
  void _onItemTapped(int index) { 
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _pages = <Widget>[
    HomeWidget(),
   Orders(),
    Container(
      width: 400,
      height: 400,
      color: Colors.blue.shade200,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          
          unselectedItemColor: Themes().secondaryColor,
          selectedItemColor: Themes().tetiaryColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: Strings.home),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_rounded), label: Strings.orders),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.home_rounded), label: 'Home'),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: Strings.profile),
          ]),
          body: _pages.elementAt(_selectedIndex),
    );
  }
}
