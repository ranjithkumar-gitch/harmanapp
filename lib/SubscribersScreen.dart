import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:harmanapp/helper.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/subScriberProfile.dart';

class SubscribersScreen extends StatefulWidget {
  const SubscribersScreen({super.key});

  @override
  State<SubscribersScreen> createState() => _SubscribersScreenState();
}

class _SubscribersScreenState extends State<SubscribersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: InstagramTopBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(color: Colors.white12, height: 1),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 350,
              child: SearchBar(
                hintText: "Search subscribers...",
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

  Widget subscriberCard(
    BuildContext context,
    UserPostModel user,
    Color color,
    String tier,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (_) => const Subscriberprofile()),
        );
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
  }

  Widget subscriberList(
    BuildContext context,
    List<UserPostModel> list, {
    required String tier,
    required Color color,
  }) {
    return Column(
      children: list.map((user) {
        return subscriberCard(context, user, color, tier);
      }).toList(),
    );
  }
}
