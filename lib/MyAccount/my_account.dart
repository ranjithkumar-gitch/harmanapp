//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/ProfilePages/MyCreatorProfile.dart';

//import 'package:harmanapp/ProfilePages/allCreatorsProfile.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();

  //List<Widget> operator [](Container other) {}
}

enum Menu { preview, share, remove }

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF0F0F0F),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text(
                    'Right-to-Left Drawer Header',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                ListTile(
                  title: Text('Item 1'),
                  // Add navigation logic here
                ),
                ListTile(
                  title: Text('Item 2'),
                  // Add navigation logic here
                ),
              ],
            ),
          ),
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
                        Get.to(
                          () => //EndDrawerButton(onPressed: () {}),
                              User_Sidemenu(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(seconds: 1),
                        );
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

          //SizedBox(height: 5),
          SizedBox(height: 10),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          popUpAnimationStyle: AnimationStyle(
            curve: Easing.emphasizedDecelerate,
            duration: Duration(seconds: 3),
          ),
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onSelected: (Menu item) {},
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
            const PopupMenuItem<Menu>(
              value: Menu.preview,
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Profile'),
              ),
            ),
            const PopupMenuItem<Menu>(
              value: Menu.share,
              child: ListTile(
                leading: Icon(Icons.share_outlined),
                title: Text('Share Profile'),
              ),
            ),
            // const PopupMenuItem<Menu>(
            //   value: Menu.getLink,
            //   child: ListTile(
            //     leading: Icon(Icons.link_outlined),
            //     title: Text('Get link'),
            //   ),
            // ),
            const PopupMenuDivider(),
            const PopupMenuItem<Menu>(
              value: Menu.remove,
              child: ListTile(
                leading: Icon(Icons.delete_outline),
                title: Text('Delete'),
              ),
            ),
            // const PopupMenuItem<Menu>(
            //   value: Menu.download,
            //   child: ListTile(
            //     leading: Icon(Icons.download_outlined),
            //     title: Text('Download'),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }

  Widget EndDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Right-to-Left Drawer Header',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            // Add navigation logic here
          ),
          ListTile(
            title: Text('Item 2'),
            // Add navigation logic here
          ),
        ],
      ),
    );
    // ),
    // body: const Center(
    //   child: Text('Swipe from the right edge or tap the icon to open the menu.'),
    // ),
  }
}

class User_Sidemenu extends StatelessWidget {
  const User_Sidemenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RTL Hamburger Menu'),
        // The default hamburger icon will now appear on the right side
        // because of the Directionality widget and the use of endDrawer.
      ),
      // Use the endDrawer property to place the drawer on the right side
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Right-to-Left Drawer Header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              // Add navigation logic here
            ),
            ListTile(
              title: Text('Item 2'),
              // Add navigation logic here
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Swipe from the right edge or tap the icon to open the menu.',
        ),
      ),
    );
  }
}
