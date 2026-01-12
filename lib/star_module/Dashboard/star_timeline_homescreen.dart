import 'package:flutter/material.dart';
import 'package:harmanapp/AppBar/app_bar.dart.dart';
import 'package:harmanapp/models/post_model.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/widgets/timeline_images.dart';
import 'package:harmanapp/widgets/timeline_reels.dart';

class StarTimelineHomescreen extends StatefulWidget {
  const StarTimelineHomescreen({super.key});

  @override
  State<StarTimelineHomescreen> createState() => _StarTimelineHomescreenState();
}

class _StarTimelineHomescreenState extends State<StarTimelineHomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(color: Colors.white12, height: 1),
          ),

          ...posts.map((post) {
            if (post.post.postType == Post.picture) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TimelineImages(post: post), //ImagePost(post: post),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TimelineReels(post: post), //ReelPost(post: post),
            );
          }),
        ],
      ),
    );
  }
}
