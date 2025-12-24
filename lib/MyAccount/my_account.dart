import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Login/LoginScreen.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

enum Menu { preview, share, remove }

class _MyAccountState extends State<MyAccount> {
  String selectedCard = "";
  @override
  void initState() {
    selectedCard = "";
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xFF0F0F0F),
        endDrawer: _endDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 290,
              child: Stack(
                children: [
                  CoverImage(
                    'assets/sources/profiles/lucas-sankey.jpg',
                    'Peeter Hain',
                  ),
                  ProfileImage(
                    'assets/sources/profiles/lucas-sankey.jpg',
                    'Peeter Hain',
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: [
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
                          Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            '14/05/1989',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            'Circular Quay,',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 2),
                          Text(
                            'Australia',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  _optionCard(
                    icon: Icons.card_membership_outlined,
                    title: 'Memberships',
                    subtitle: 'Checkout all my membership list',
                    isSelected: selectedCard == "Memberships",
                    onTap: () => setState(() => selectedCard = "Memberships"),
                  ),
                  SizedBox(height: 12),
                  _optionCard(
                    icon: Icons.checklist_sharp,
                    title: 'Orders',
                    subtitle: 'Checkout all my orders',
                    isSelected: selectedCard == "Orders",
                    onTap: () => setState(() => selectedCard = "Orders"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CoverImage(String imagePath, String Name) {
    return Stack(
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
                      color: Color(0xFFDAA520),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 10,
          child: IconButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black54),
            ),
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(Icons.mode_edit_rounded, color: Color(0xFFDAA520)),
            ),
          ),
        ),
      ],
    );
  }

  Widget ProfileImage(String imagePath, String name) {
    return Container(
      // height: 200,
      transform: Matrix4.translationValues(0.0, 170.0, 0.0),
      padding: const EdgeInsets.only(left: 14.0, right: 14),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      CupertinoColors.systemOrange,
                      CupertinoColors.systemRed,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CupertinoColors.white,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '@ $name',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),

              _editDropdownmenu(),
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
            duration: Duration(seconds: 2),
          ),
          icon: const Icon(Icons.more_vert, color: Color(0xFFDAA520)),
          onSelected: (Menu item) {},
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
            PopupMenuItem<Menu>(
              value: Menu.preview,
              child: ListTile(
                leading: Icon(Icons.edit, color: Color(0xFFDAA520)),
                title: Text(
                  'Edit Profile',
                  style: GoogleFonts.poppins(color: Color(0xFFDAA520)),
                ),
              ),
            ),
            PopupMenuItem<Menu>(
              value: Menu.share,
              child: ListTile(
                leading: Icon(Icons.share_outlined, color: Color(0xFFDAA520)),
                title: Text(
                  'Share Profile',
                  style: GoogleFonts.poppins(color: Color(0xFFDAA520)),
                ),
              ),
            ),

            const PopupMenuDivider(),
            PopupMenuItem<Menu>(
              value: Menu.remove,
              child: ListTile(
                leading: Icon(Icons.delete_outline, color: Color(0xFFDAA520)),
                title: Text(
                  'Delete account',
                  style: GoogleFonts.poppins(color: Color(0xFFDAA520)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _endDrawer() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        backgroundColor: Colors.black,

        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Harman App',
                    style: GoogleFonts.greatVibes(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF5D778),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Settings',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
              ),
            ),
            ListTile(
              title: Text(
                'Privacy & Policy',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
              ),
            ),
            ListTile(
              title: Text(
                'Terms & Conditions',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginscreen()),
                );
              },
              child: ListTile(
                title: Text(
                  'Logout',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _optionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Color(0xFFF5D778) : Color(0xFFFFFFFF),
            width: isSelected ? 2 : 1,
          ),
          color: Colors.white.withOpacity(isSelected ? 0.07 : 0.03),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: isSelected
                  ? Color(0xFFF5D778) //Color(0xFF1A1A1A)
                  : Colors.white.withOpacity(0.2),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(isSelected ? 0xFFF5D778 : 0xFFFFFFFF),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Color(0xFFF5D778) : Colors.white54,
            ),
          ],
        ),
      ),
    );
  }
}
