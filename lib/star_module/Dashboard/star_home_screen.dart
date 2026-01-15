import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:harmanapp/models/post_model.dart';
import 'package:harmanapp/star_module/MyAccount/posts/star_post_model.dart';
import 'package:harmanapp/star_module/Star_AppBar/star_app_bar.dart.dart';
import 'package:harmanapp/star_module/widgets/star_image_post.dart';
import 'package:harmanapp/star_module/widgets/star_reel_post.dart';
import 'package:harmanapp/star_module/widgets/star_story_picture.dart';

import 'package:harmanapp/widgets/theme_notifier.dart';

class StarHomeScreen extends StatelessWidget {
  const StarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Brightness.dark == Theme.of(context).brightness
          ? kblackColor
          : kwhiteColor,
      appBar: StarCustomAppBar(),
      body: ListView(
        // padding: EdgeInsets.zero,
        padding: const EdgeInsets.only(bottom: 80),
        children: [
          const SizedBox(height: 12),

          SizedBox(
            height: 100,
            child: CarouselSlider.builder(
              itemCount: posts.where((post) => post.hasStory).length,
              itemBuilder: (context, index, realIndex) {
                final usersWithStory = posts
                    .where((post) => post.hasStory)
                    .toList();

                return Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: StarStoryPicture(user: usersWithStory[index]),
                );
              },
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.2,
                animateToClosest: true,
                enableInfiniteScroll: true,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(
              color: Brightness.dark == Theme.of(context).brightness
                  ? Colors.white12
                  : Colors.black12,

              height: 1,
            ),
          ),
          ...posts.map((post) {
            if (post.post.postType == Post.picture) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: StarImagePost(post: post),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: StarReelPost(post: post),
            );
          }),
        ],
      ),
    );
  }
}
