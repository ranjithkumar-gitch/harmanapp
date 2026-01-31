import 'package:flutter/material.dart';
import 'package:harmanapp/Dashboard/my_stars_list.dart';

import 'package:harmanapp/Dashboard/explore_screen.dart';
import 'package:harmanapp/Dashboard/home_screen.dart';
import 'package:harmanapp/Dashboard/all_stars_list.dart';
import 'package:harmanapp/Dashboard/market_place.dart';
import 'package:harmanapp/btm_nav/curved_navbar.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final _pageController = PageController(initialPage: 0);

  late int currentpage;

  int maxCount = 5;
  @override
  void initState() {
    super.initState();
    currentpage = widget.initialIndex;
  }

  @override
  void dispose() {
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

          color: Brightness.dark == Theme.of(context).brightness
              ? kblackColor
              : kwhiteColor,
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

          onTap: (index) => setState(() => currentpage = index),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = currentpage == index;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 22,
          color: isSelected
              ? kgoldColor
              : Brightness.dark == Theme.of(context).brightness
              ? kwhiteColor
              : kblackColor,
        ),
        if (!isSelected)
          Text(
            label,
            style: TextStyle(
              color: Brightness.dark == Theme.of(context).brightness
                  ? kwhiteColor
                  : kblackColor,

              fontSize: 10,
            ),
          ),
      ],
    );
  }
}
