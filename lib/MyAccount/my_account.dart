//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0F0F0F),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ), // Placeholder for alignment
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'My Account',
                                style: GoogleFonts.poppins(
                                  color: Color(0xFFF5D778),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 30), // Placeholder for alignment
                    ],
                  ),
                  SizedBox(height: 15),
                  _profileCard(),
                  _watchSctream_memberTwoCard(),
                  _splitGallary_OrdersTwoCard(),
                  _splitSetting_LogoutTwoCard(),

                  SizedBox(height: 40),
                  _ElevaterdButton(),
                  SizedBox(height: 20),
                  // Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileCard() {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => Mycreatorprofile(usrName: "Srikanth Natarajan"),
          transition: Transition.zoom,
          duration: const Duration(seconds: 1),
        );
      },
      child: Card.outlined(
        color: Colors.transparent, //grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  'assets/sources/profiles/foto-sushi.jpg',
                ),
              ),
              //SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Srikanth Natarajan',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '   @SrikanthNatarajan',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  //size: 30,
                ),
                onPressed: () {
                  Get.to(
                    () => Mycreatorprofile(usrName: "Srikanth Natarajan"),
                    transition: Transition.rightToLeft,
                    duration: const Duration(seconds: 1),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _watchSctream_memberTwoCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Card.outlined(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Icon(Icons.ondemand_video, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      'Watch Stream',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Card.outlined(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Icon(Icons.card_membership, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      'Membership',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _splitGallary_OrdersTwoCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Card.outlined(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Icon(Icons.photo_library, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      'Gallery',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Card.outlined(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Icon(Icons.shopping_bag, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      'Orders',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _splitSetting_LogoutTwoCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Card.outlined(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Icon(Icons.settings, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      'Settings',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Card.outlined(
              color: Colors.transparent, //grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Icon(Icons.logout, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      'Logout',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ElevaterdButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Color(0xFFF5D778)),
        ),
      ),
      child: Text(
        'Upgrade to Premium',
        style: GoogleFonts.poppins(
          color: Color(0xFFF5D778),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
