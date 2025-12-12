import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/AppBar/AppBar.dart';

import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/ProfilePages/MyCreatorProfile.dart';
import 'package:lottie/lottie.dart';

class MyCreatorsScreen extends StatefulWidget {
  const MyCreatorsScreen({super.key});

  @override
  State<MyCreatorsScreen> createState() => _MyCreatorsScreenState();
}

class _MyCreatorsScreenState extends State<MyCreatorsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isPlaying = false;
  String imageUrl = "";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // play for 5 seconds
    );

    // Listen for completion
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isPlaying = false;
        });
        // Navigate to another page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Mycreatorprofile()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() {
    setState(() {
      isPlaying = true;
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: InstagramTopBar(),
      body: isPlaying
          ? Stack(
              children: [
                Center(
                  child: Lottie.asset(
                    'assets/dots.json', // your Lottie file path
                    controller: _controller,
                    onLoaded: (composition) {
                      // Set controller duration to match Lottie file or override
                      _controller.duration = const Duration(seconds: 5);
                      // _controller.setSpeed(2.0);
                    },
                  ),
                ),
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      imageUrl,
                      height: 170,
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          : ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: 350,
                    child: SearchBar(
                      hintText: "Search Creators...",
                      padding: const WidgetStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      leading: const Icon(Icons.search),
                      onTap: () {
                        // showSearch(context: context, delegate: DataSearch(posts));
                      },
                      onChanged: (value) {
                        // showSearch(context: context, delegate: DataSearch(posts));
                      },
                    ),
                  ),
                ),

                subscriberList(
                  context,
                  posts.where((p) => p.hasStory).take(4).toList(),
                  tier: "Gold",
                  color: const Color(0xffd4af37),
                ),

                subscriberList(
                  context,
                  posts.where((p) => p.hasStory).take(4).toList(),
                  tier: "Silver",
                  color: CupertinoColors.systemGrey,
                ),

                subscriberList(
                  context,
                  posts.where((p) => p.hasStory).take(4).toList(),
                  tier: "Bronze",
                  color: CupertinoColors.systemBrown,
                ),
              ],
            ),
    );
  }

  // Widget subscriberCard(
  //   BuildContext context,
  //   UserPostModel user,
  //   Color color,
  //   String tier,
  // ) {
  //   return ;
  // }

  Widget subscriberList(
    BuildContext context,
    List<UserPostModel> list, {
    required String tier,
    required Color color,
  }) {
    return Column(
      children: list.map((user) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isPlaying = true;
              imageUrl = 'assets/sources/profiles/${user.profileImage}';
            });
            _playAnimation();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: CupertinoColors.darkBackgroundGray,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: color, width: 1.8),
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/sources/profiles/${user.profileImage}",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 12),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 16,
                            fontFamily: "Gilroy",
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "• ${user.category}",
                          style: const TextStyle(
                            color: CupertinoColors.systemGrey2,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      tier,
                      style: TextStyle(
                        color: color,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                const Icon(
                  CupertinoIcons.forward,
                  color: CupertinoColors.systemGrey2,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
