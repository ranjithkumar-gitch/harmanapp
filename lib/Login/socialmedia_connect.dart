import 'package:flutter/material.dart';
import 'package:harmanapp/Login/verifyPhoneNumber.dart';

class SocialmediaConnect extends StatelessWidget {
  const SocialmediaConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0F0F0F),
        body: Column(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(Icons.music_note_rounded, color: Colors.white),
                          const SizedBox(width: 6),
                          const Text(
                            "HM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.language, color: Colors.white70),
                          SizedBox(width: 6),
                          Text(
                            "English (US)",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const SizedBox(height: 25),
                  const Text(
                    "Connect Social Media Accounts",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 65),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Verifyphonenumber(),
                        ),
                      );
                    },
                    child: _socialRow(
                      context,
                      leftIcon: "assets/instagram.jpeg",
                      leftTitle: "Instagram",
                      leftInput: true,
                      rightIcon: "assets/tiktok.png",
                      rightTitle: "TikTok",
                    ),
                  ),

                  const SizedBox(height: 25),

                  _socialRow(
                    context,
                    leftIcon: "assets/youtube.png",
                    leftTitle: "YouTube",
                    rightIcon: "assets/twitch.png",
                    rightTitle: "Twitch",
                  ),

                  const SizedBox(height: 25),

                  _socialRow(
                    context,
                    leftIcon: "assets/x.png",
                    leftTitle: "X",
                    rightIcon: null,
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialRow(
    BuildContext context, {
    required String leftIcon,
    required String leftTitle,
    bool leftInput = false,
    required String? rightIcon,
    String rightTitle = "",
  }) {
    return Row(
      children: [
        Expanded(child: _socialCard(leftIcon, leftTitle, leftInput: leftInput)),

        const SizedBox(width: 20),

        Expanded(
          child: rightIcon == null
              ? Container()
              : _socialCard(rightIcon, rightTitle),
        ),
      ],
    );
  }

  Widget _socialCard(String icon, String title, {bool leftInput = false}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(icon, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),

        Text(title, style: const TextStyle(color: Colors.white, fontSize: 15)),
        const SizedBox(height: 12),
      ],
    );
  }
}
