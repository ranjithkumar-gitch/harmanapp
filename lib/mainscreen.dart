import 'dart:math';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/explore/explore_tab.dart';
import 'package:harmanapp/homescreen.dart';
import 'package:harmanapp/subscribers.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController(initialPage: 0);

  final NotchBottomBarController _controller = NotchBottomBarController(
    index: 0,
  );

  int maxCount = 5;
  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    HomeScreen(),
    ExploreScreen(),
    Subscribers(),
    const Center(
      child: Text('Reels', style: TextStyle(color: Colors.white)),
    ),
    const Center(child: Text('Reels')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),
      extendBody: false,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: Colors.grey,
              showLabel: true,
              textOverflow: TextOverflow.clip,
              maxLine: 1,
              shadowElevation: 5,

              kBottomRadius: 28.0,
              notchShader:
                  const SweepGradient(
                    startAngle: 0,
                    endAngle: pi / 2,
                    colors: [Color(0xFFDAA520), Colors.orange, Colors.white],
                    tileMode: TileMode.mirror,
                  ).createShader(
                    Rect.fromCircle(center: Offset.zero, radius: 10.0),
                  ),
              notchColor: Color(0xFFDAA520),

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: false,
              durationInMilliSeconds: 300,

              itemLabelStyle: const TextStyle(fontSize: 10),

              elevation: 1,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(Icons.home_filled, color: Colors.white),
                  activeItem: Icon(Icons.home_filled, color: Colors.black),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.explore, color: Colors.white),
                  activeItem: Icon(Icons.explore, color: Colors.black),
                  itemLabel: 'Explore',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.group, color: Colors.white),
                  activeItem: Icon(Icons.group, color: Colors.black),
                  itemLabel: 'Subscriptions',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.group_add, color: Colors.white),
                  activeItem: Icon(Icons.group_add, color: Colors.black),
                  itemLabel: 'Creators',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.storefront, color: Colors.white),
                  activeItem: Icon(Icons.storefront, color: Colors.black),
                  itemLabel: 'Marketplace',
                ),
              ],
              onTap: (index) {
                // log('current selected index $index');
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}
