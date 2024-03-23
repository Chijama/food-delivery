import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jammybread/modules/discover/view/discover.dart';
import 'package:jammybread/modules/home/view/home.screen.dart';
import 'package:jammybread/modules/restaurant/view/restaurant.menu.screen.dart';
import 'package:jammybread/utilities/strings.dart';
import 'package:jammybread/utilities/theme.dart';
import 'package:jammybread/utilities/colors.dart';

class NavBar extends StatefulWidget {
  static const String routeName = '/nav-bar';
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Discover(),
    const Text('Orders Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const RestaurantMenu(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: Stack(children: [
        BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Strings.homeIcon,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Strings.discoverIcon,
              ),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Strings.receiptIcon,
              ),
              label: 'Orders',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person, color: dark100),
              label: 'Profile',
            ),
          ],
          backgroundColor: light80,
          selectedLabelStyle: blackWeight400size12(),
          unselectedLabelStyle: blackWeight400size12(),
          selectedIconTheme:
              const IconThemeData(opacity: 1, fill: 0.5, color: dark100),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          iconSize: 24,
          onTap: _onItemTapped,
          elevation: 0,
          unselectedItemColor: dark100,
          selectedItemColor: dark100,
        ),
        buildDotIndicator()
      ]),
    );
  }

  Widget buildDotIndicator() {
    return Positioned(
      bottom: 2.0,
      left: (MediaQuery.of(context).size.width / 4) * _selectedIndex +
          (MediaQuery.of(context).size.width / 4 - 8.0) / 2,
      child: Container(
        width: 5.0,
        height: 5.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: dark100,
        ),
      ),
    );
  }
}
