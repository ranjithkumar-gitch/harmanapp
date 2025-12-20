import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/ProfilePages/MyCreatorProfile.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

enum Menu { preview, share, remove }

class _MyAccountState extends State<MyAccount> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: const Color(0xFF0F0F0F),
          endDrawer: _endDrawer(),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      CoverImage(
                        'assets/sources/profiles/lucas-sankey.jpg',
                        'Peeter Hain',
                      ),
                      ProfileImage(
                        'assets/sources/profiles/lucas-sankey.jpg',
                        'Peeter Hain',
                      ),
                      Divider(),
                      //SizedBox(height: 15),
                      const TabBar(
                        indicatorColor: Color(0xFFDAA520),
                        indicatorWeight: 4,
                        labelColor: Color(0xFFDAA520),
                        unselectedLabelColor: Colors.white54,
                        tabs: [
                          Tab(icon: Icon(Icons.apps, size: 28)),
                          Tab(icon: Icon(Icons.video_library_sharp, size: 28)),
                          Tab(icon: Icon(Icons.live_tv, size: 28)),
                          Tab(icon: Icon(Icons.person_2_outlined, size: 28)),
                          //Tab(icon: Icon(Icons.shopping_bag_outlined, size: 28)),
                        ],
                      ),
                    ],
                  ),
                ),
              ];
            },
            //),
            body: const TabBarView(
              children: [
                ImagesTab(),
                ReelsTab(),
                ImagesTab(),
                EmptyTab(),
                //Mycreatorsmarketplace(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CoverImage(String imagePath, String Name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath), // AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.black54,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      icon: Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 0.0,
                          top: 2.0,
                          bottom: 2.0,
                        ),
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                      color: Colors.white,
                    ),

                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.black54,
                        ),
                      ),

                      onPressed: () {
                        _scaffoldKey.currentState?.openEndDrawer();
                      },

                      icon: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.menu),
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //SizedBox(width: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.transparent,
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.black54,
                      ),
                    ),
                    onPressed: () {},
                    icon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.mode_edit_rounded, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget ProfileImage(String imagePath, String name) {
    return Container(
      transform: Matrix4.translationValues(0.0, -80.0, 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 42,
                  backgroundImage: AssetImage(imagePath),
                ),
              ),
              const SizedBox(width: 8),
              Row(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 30),
                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '@ ${name}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 50),
              SizedBox(width: 60),
              _editDropdownmenu(),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Digital Artist | Content Creator | Photographer | Travel Enthusiast',
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.email, color: Colors.white, size: 15),
                  Text(
                    'peeter_hain@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'o',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 4,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.calendar_month, color: Colors.white, size: 15),
                  Text('14/05/1989', style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white, size: 15),
                  Text('Circular Quay,', style: TextStyle(color: Colors.white)),
                  SizedBox(width: 2),
                  Text('Australia', style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),

          SizedBox(height: 10),
          Row(
            children: [
              const Row(
                children: [
                  Text(
                    '14',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Post',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5),
              const Text(
                'o',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 3,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 5),
              const Row(
                children: [
                  Text(
                    '12',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 5),

                  Text(
                    'Media',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5),
              const Text(
                'O',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 3,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 5),
              const Row(
                children: [
                  Text(
                    '20',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Stars',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  SizedBox(width: 8),
                  Text('|', style: TextStyle(color: Colors.grey, fontSize: 20)),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/google1.png', width: 26, height: 25),

                    GestureDetector(
                      onTap: () {
                        //print("Apple login tapped");
                      },

                      child: Icon(Icons.apple, color: Colors.white),
                    ),

                    Image.asset('assets/facebook.png', width: 20, height: 20),

                    Icon(
                      FontAwesomeIcons.xTwitter,
                      color: Colors.white,
                      size: 20,
                    ),

                    Icon(
                      FontAwesomeIcons.twitch,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _editDropdownmenu() {
    return Column(
      children: <Widget>[
        PopupMenuButton<Menu>(
          color: Colors.black,
          popUpAnimationStyle: AnimationStyle(
            curve: Easing.emphasizedDecelerate,
            duration: Duration(seconds: 3),
          ),
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onSelected: (Menu item) {},
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
            PopupMenuItem<Menu>(
              value: Menu.preview,
              child: ListTile(
                leading: Icon(Icons.edit, color: Colors.white),
                title: Text(
                  'Edit Profile',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
            PopupMenuItem<Menu>(
              value: Menu.share,
              child: ListTile(
                leading: Icon(Icons.share_outlined, color: Colors.white),
                title: Text(
                  'Share Profile',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),

            const PopupMenuDivider(),
            PopupMenuItem<Menu>(
              value: Menu.remove,
              child: ListTile(
                leading: Icon(Icons.delete_outline, color: Colors.white),
                title: Text(
                  'Delete account',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _endDrawer() {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Harman App',
                style: GoogleFonts.greatVibes(
                  textStyle: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF5D778),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Settings',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              'Privacy & Policy',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              'Terms & Conditions',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              'Logout',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
