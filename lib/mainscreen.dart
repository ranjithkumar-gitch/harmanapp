import 'dart:math';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/homescreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // int _selectedIndex = 0;
  // void _selectIndex(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
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
    const Center(child: Text('Reels')),
    const Center(child: Text('Reels')),
    const Center(child: Text('Reels')),
    const Center(child: Text('Reels')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

    // CupertinoTabScaffold(
    //   tabBar: CupertinoTabBar(
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Icon(
    //           _selectedIndex == 0
    //               ? CupertinoIcons.house_fill
    //               : CupertinoIcons.home,
    //         ),
    //       ),
    //       const BottomNavigationBarItem(icon: Icon(CupertinoIcons.search)),
    //       BottomNavigationBarItem(
    //         icon: Icon(
    //           _selectedIndex == 2
    //               ? CupertinoIcons.play_rectangle_fill
    //               : CupertinoIcons.play_rectangle,
    //         ),
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(
    //           _selectedIndex == 3
    //               ? CupertinoIcons.bag_fill
    //               : CupertinoIcons.bag,
    //         ),
    //       ),
    //       const BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.profile_circled),
    //       ),
    //     ],
    //     onTap: _selectIndex,
    //     currentIndex: _selectedIndex,
    //     activeColor: CupertinoColors.black,
    //   ),
    //   tabBuilder: (context, index) {
    //     switch (index) {
    //       case 0:
    //         return const HomeScreen();
    //       case 1:
    //         return const Center(child: Text('Search'));
    //       case 2:
    //         return const Center(child: Text('Reels'));
    //       case 3:
    //         return const Center(child: Text('MarketPlace'));
    //       case 4:
    //         return const Center(child: Text('Profile'));
    //       default:
    //         return const SizedBox.shrink();
    //     }
    //   },
    // );
  }
}
