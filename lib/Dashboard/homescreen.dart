import 'package:flutter/material.dart';
import 'package:harmanapp/AppBar/AppBar.dart';

import 'package:harmanapp/models/post_model.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/widgets/image_post.dart';
import 'package:harmanapp/widgets/reel_post.dart';
import 'package:harmanapp/widgets/story_picture.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: InstagramTopBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 12),

          SizedBox(
            height: 110,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: posts
                    .where((post) => post.hasStory)
                    .map(
                      (user) => Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: StoryPicture(user: user),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(color: Colors.white12, height: 1),
          ),

          ...posts.map((post) {
            if (post.post.postType == Post.picture) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ImagePost(post: post),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ReelPost(post: post),
            );
          }),
        ],
      ),
    );
  }
}
