import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/AppBar/AppBar.dart';

import 'package:harmanapp/models/post_model.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/widgets/colors.dart';
import 'package:harmanapp/widgets/image_post.dart';
import 'package:harmanapp/widgets/reel_post.dart';
import 'package:harmanapp/widgets/story_picture.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblackColor,
      appBar: CustomAppBar(),
      body: ListView(
        // padding: EdgeInsets.zero,
        padding: const EdgeInsets.only(bottom: 80),
        children: [
          const SizedBox(height: 12),

          SizedBox(
            height: 110,
            child: CarouselSlider.builder(
              itemCount: posts.where((post) => post.hasStory).length,
              itemBuilder: (context, index, realIndex) {
                final usersWithStory = posts
                    .where((post) => post.hasStory)
                    .toList();

                return Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: StoryPicture(user: usersWithStory[index]),
                );
              },
              options: CarouselOptions(
                height: 360,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.2,
                animateToClosest: true,
                enableInfiniteScroll: true,
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
