import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/AppBar/AppBar.dart';
import 'package:harmanapp/ProfilePages/my_profile_videocover.dart';

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
  String strName = "";
  int tappedIndex = -1;

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

        if (tappedIndex == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Mycreatorprofile(usrName: strName),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Mycreator_videocover(usrName: strName),
            ),
          );
        }
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
      appBar: CustomAppBar(),
      body: isPlaying
          ? Stack(
              children: [
                Center(
                  child: Lottie.asset(
                    'assets/dots.json',
                    controller: _controller,
                    onLoaded: (composition) {
                      _controller.duration = const Duration(seconds: 5);
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
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      hintText: "Search Stars...",
                      padding: const WidgetStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      leading: const Icon(Icons.search),
                      onTap: () {},
                      onChanged: (value) {},
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

  Widget subscriberList(
    BuildContext context,
    List<UserPostModel> list, {
    required String tier,
    required Color color,
  }) {
    return Column(
      children: list.asMap().entries.map((entry) {
        final index = entry.key;
        final user = entry.value;
        return GestureDetector(
          onTap: () {
            setState(() {
              isPlaying = true;
              imageUrl = 'assets/sources/profiles/${user.profileImage}';
              strName = user.name;
              tappedIndex = index;
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
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/sources/profiles/${user.profileImage}",
                      ),
                      fit: BoxFit.cover,
                    ),
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
                    Icon(
                      Icons.star,
                      color: color,
                      size: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                const Spacer(),

                Icon(CupertinoIcons.forward, color: color),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
