import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialmediaConnect extends StatefulWidget {
  const SocialmediaConnect({super.key});

  @override
  State<SocialmediaConnect> createState() => _SocialmediaConnectState();
}

class _SocialmediaConnectState extends State<SocialmediaConnect> {
  final List<Map<String, dynamic>> mediaMap = [
    {
      "name": "Instagram",
      "image":
          "https://e7.pngegg.com/pngimages/672/312/png-clipart-instagram-logo-icon-others-text-photography.png",
    },
    {
      "name": "TikTok",
      "image":
          "https://e7.pngegg.com/pngimages/672/312/png-clipart-instagram-logo-icon-others-text-photography.png",
    },
    {
      "name": "YouTube",
      "image":
          "https://e7.pngegg.com/pngimages/672/312/png-clipart-instagram-logo-icon-others-text-photography.png",
    },
    {
      "name": "Twich",
      "image":
          "https://e7.pngegg.com/pngimages/672/312/png-clipart-instagram-logo-icon-others-text-photography.png",
    },
    {
      "name": "X",
      "image":
          "https://e7.pngegg.com/pngimages/672/312/png-clipart-instagram-logo-icon-others-text-photography.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "HM",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
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
              // gridView(),
              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle_outline, color: Colors.white),
                    Expanded(child: Container(height: 2, color: Colors.white)),
                    Icon(Icons.link, color: Colors.grey),
                    Text(
                      "Social Media Connection",
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(child: Container(height: 1, color: Colors.grey)),
                    Icon(Icons.phone, color: Colors.grey),
                    Expanded(child: Container(height: 1, color: Colors.grey)),
                    Icon(Icons.qr_code_2, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Connect Social Media Accounts",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Once verified, each account will be publicly displayed on your profile, except for Discord.",
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 30),
              const SizedBox(height: 6),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text.rich(
                      // textAlign: TextAlign.center,
                      TextSpan(
                        text:
                            "Connect at least one of your most active sicial media accounts.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  //},
                  //),
                ],
              ),
              //Row(children: const [grid_View(icon: Icons.apple)]),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.instagram,
                            size: 30,
                            color: Colors.white,
                          ),

                          Text(
                            'Instagram',
                            style: TextStyle(color: Colors.white),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(width: 1, color: Colors.grey),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {},
                            child: Text('Connect'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.tiktok,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text('TikTok', style: TextStyle(color: Colors.white)),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(width: 1, color: Colors.grey),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {},
                            child: Text('Connect'),
                          ),
                          //Text('data', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.youtube,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text(
                            'YouTube',
                            style: TextStyle(color: Colors.white),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(width: 1, color: Colors.grey),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {},
                            child: Text('Connect'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.twitch,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text('Twich', style: TextStyle(color: Colors.white)),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(width: 1, color: Colors.grey),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {},
                            child: Text('Connect'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.xTwitter,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text('X', style: TextStyle(color: Colors.white)),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.white70,
                                ),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {},
                            child: Text('Connect'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //gridCall();
                ],
              ),
            ],
          ),
        ),
      ),
      //],
      //),
    );
  }
}
