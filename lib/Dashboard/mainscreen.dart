import 'package:flutter/material.dart';
import 'package:harmanapp/Dashboard/MyCreatorsScreen.dart';

import 'package:harmanapp/Dashboard/explore_screen.dart';
import 'package:harmanapp/Dashboard/homescreen.dart';
import 'package:harmanapp/Dashboard/AllCreatorsscreen.dart';
import 'package:harmanapp/Dashboard/marketplace_screen.dart';
import 'package:harmanapp/btm_nav/curvednavbar.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController(initialPage: 0);

  int currentpage = 0;

  int maxCount = 5;
  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    HomeScreen(),
    ExploreScreen(),
    MyCreatorsScreen(),
    AllCreatorsScreen(),
    MarketplaceScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblackColor,
      body: bottomBarPages[currentpage],

      extendBody: true,

      bottomNavigationBar: Theme(
        data: Theme.of(
          context,
        ).copyWith(iconTheme: IconThemeData(color: kgoldColor)),
        child: CurvedNavigationBar(
          buttonBackgroundColor: Brightness.dark == Theme.of(context).brightness
              ? kblackColor
              : kwhiteColor,

          height: 75,

          index: currentpage,

          color: Colors.transparent,
          backgroundColor: Brightness.dark == Theme.of(context).brightness
              ? kblackColor
              : kwhiteColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          items: <Widget>[
            _buildNavItem(Icons.home_filled, "Home", 0),
            _buildNavItem(Icons.explore, "Explore", 1),
            _buildNavItem(Icons.group, "My Stars", 2),
            _buildNavItem(Icons.group_add, "Global Stars", 3),
            _buildNavItem(Icons.storefront, "Store", 4),
          ],

          onTap: (index) => setState(() => this.currentpage = index),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = currentpage == index;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 22, color: isSelected ? kgoldColor : Colors.white),
        if (!isSelected)
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
      ],
    );
  }
}
