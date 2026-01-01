import 'package:flutter/material.dart';
import 'package:harmanapp/Login/verifyPhoneNumber.dart';

class SocialmediaConnect extends StatefulWidget {
  const SocialmediaConnect({super.key});

  @override
  State<SocialmediaConnect> createState() => _SocialmediaConnectState();
}

class _SocialmediaConnectState extends State<SocialmediaConnect> {
  String selectedPlatform = "";

  final List<Map<String, String>> socialList = [
    {
      "title": "Instagram",
      "subtitle": "Connect your Instagram account",
      "icon": "assets/instagram.jpeg",
    },
    {
      "title": "Facebook",
      "subtitle": "Connect your Facebook account",
      "icon": "assets/facebook.png",
    },
    {
      "title": "YouTube",
      "subtitle": "Connect your YouTube channel",
      "icon": "assets/youtube.png",
    },
    {
      "title": "Twitch",
      "subtitle": "Connect your Twitch account",
      "icon": "assets/twitch.png",
    },
    {
      "title": "X",
      "subtitle": "Connect your X account",
      "icon": "assets/x.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0F0F0F),
        body: Column(
          children: [
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
                          color: Color(0xFFF5D778),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Icon(Icons.music_note_rounded, color: Colors.white),
                      // const SizedBox(width: 6),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFF5D778)),
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: AssetImage('assets/App_logo_2.jpeg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
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
            const SizedBox(height: 20),
            const Text(
              "Connect Social Media Accounts",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            /// LIST VIEW
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: socialList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 18),
                itemBuilder: (context, index) {
                  final item = socialList[index];
                  final isSelected = selectedPlatform == item["title"];

                  return _socialListCard(
                    title: item["title"]!,
                    subtitle: item["subtitle"]!,
                    icon: item["icon"]!,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        selectedPlatform = item["title"]!;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// SINGLE LIST CARD
  Widget _socialListCard({
    required String title,
    required String subtitle,
    required String icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFF5D778) : Colors.white24,
            width: isSelected ? 2 : 1,
          ),
          color: Colors.white.withOpacity(isSelected ? 0.08 : 0.04),
        ),
        child: Row(
          children: [
            /// ICON
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(icon, fit: BoxFit.cover),
              ),
            ),

            const SizedBox(width: 16),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelected
                          ? const Color(0xFFF5D778)
                          : Colors.white,
                      fontSize: 16,
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

            /// CONNECT BUTTON
            if (isSelected)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Color(0xFFF5D778)),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Verifyphonenumber(), // dashboard later
                    ),
                  );
                },
                child: const Text(
                  "Connect",
                  style: TextStyle(color: Color(0xFFF5D778)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
