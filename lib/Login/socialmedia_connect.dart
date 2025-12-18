import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harmanapp/Login/verifyPhoneNumber.dart';

class SocialmediaConnect extends StatefulWidget {
  const SocialmediaConnect({super.key});
  @override
  State<SocialmediaConnect> createState() => _SocialmediaConnectState();
}

class _SocialmediaConnectState extends State<SocialmediaConnect> {
  @override
  Widget build(BuildContext context) {
    var selectedRole = "X";
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0F0F0F),
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
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
                    ),
                    // Row(
                    //   children: const [
                    //     Icon(Icons.language, color: Colors.white70),
                    //     SizedBox(width: 6),
                    //     Text(
                    //       "English (US)",
                    //       style: TextStyle(color: Colors.white70),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),

                // const SizedBox(height: 30),
                const SizedBox(height: 25),
                Center(
                  child: const Text(
                    "Connect Social Media Accounts",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 65),

                //GestureDetector(
                //onTap: onTap,
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Verifyphonenumber(),
                //     ),
                //   );
                // },
                //child:
                _socialRow(
                  context,
                  leftIcon: "assets/instagram.jpeg",
                  leftTitle: "Instagram",
                  isSelected: selectedRole == "Instagram",
                  onTap: () => setState(() => selectedRole = "Instagram"),
                  leftInput: true,
                  rightIcon: "assets/tiktok.png",
                  // rightTitle: "TikTok",
                ),

                // ),
                const SizedBox(height: 25),

                _socialRow(
                  context,
                  leftIcon: "assets/youtube.png",
                  leftTitle: "YouTube",
                  isSelected: selectedRole == "YouTube",
                  onTap: () => setState(() => selectedRole = "YouTube"),
                  rightIcon: "assets/twitch.png",
                  // rightTitle: "Twitch",
                ),

                const SizedBox(height: 25),

                _socialRow(
                  context,
                  leftIcon: "assets/x.png",
                  leftTitle: "X",
                  isSelected: selectedRole == "X",
                  onTap: () => setState(() => selectedRole = "X"),
                  rightIcon: null,
                ),

                const SizedBox(height: 30),
              ],
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
    required VoidCallback onTap,
    bool leftInput = false,
    bool isSelected = false,
    // String isSelected="",
    required String? rightIcon,
    String rightTitle = "",
  }) {
    return Row(
      children: [
        Expanded(
          child: _socialCard(
            leftIcon,
            leftTitle,
            isSelected,
            leftInput: leftInput,
          ),
        ),

        const SizedBox(width: 20),

        Expanded(
          child: rightIcon == null
              ? Container()
              : _socialCard(
                  rightIcon,
                  rightTitle,
                  isSelected,
                  leftInput: leftInput,
                  // onTap: () => setState(() => leftTitle = leftTitle),
                ),
        ),
      ],
    );
  }

  Widget _socialCard(
    String icon,
    String title,
    bool isSelected, {
    VoidCallback? onTap,
    bool leftInput = false,
  }) {
    return GestureDetector(
      onTap: () => setState(() => title = "X"),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Color(0xFFF5D778) : Color(0xFFFFFFFF),
                width: isSelected ? 2 : 1,
              ),
              color: Colors.white.withOpacity(isSelected ? 0.07 : 0.03),
            ),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(icon, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 8),
          isSelected
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: Color(0xFFF5D778)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Verifyphonenumber(),
                      ),
                    );
                  },
                  child: Text(
                    'Connect',
                    style: TextStyle(color: Color(0xFFF5D778), fontSize: 15),
                  ),
                )
              : Text(''),

          //const SizedBox(height: 12),
        ],
      ),
    );
  }

  //void setState(String Function() param0) {}
}
