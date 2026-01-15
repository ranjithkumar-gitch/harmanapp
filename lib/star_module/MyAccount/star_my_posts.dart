import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:harmanapp/models/post_model.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/star_module/widgets/star_image_post.dart';
import 'package:harmanapp/star_module/widgets/star_reel_post.dart';

import 'package:harmanapp/widgets/theme_notifier.dart';

class StarMyPosts extends StatefulWidget {
  const StarMyPosts({super.key});

  @override
  State<StarMyPosts> createState() => _StarMyPostsState();
}

class _StarMyPostsState extends State<StarMyPosts>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kblackColor : kwhiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kwhiteColor, size: 18),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "My Posts",
          style: TextStyle(
            color: kwhiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: kgoldColor,
          labelColor: kgoldColor,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Published"),
            Tab(text: "Unpublished"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [_PublishedPosts(), _UnPublishedPosts()],
      ),
    );
  }
}

class _UnPublishedPosts extends StatelessWidget {
  const _UnPublishedPosts();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListView(
      padding: const EdgeInsets.only(bottom: 80),
      children: posts.map((post) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Stack(
            children: [
              /// ORIGINAL POST (Blurred)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: post.post.postType == Post.picture
                      ? StarImagePost(post: post)
                      : StarReelPost(post: post),
                ),
              ),

              /// OVERLAY
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              /// DATE & TIME
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: kblackColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kgoldColor),
                  ),
                  child: const Text(
                    "Scheduled\n12 Jan • 10:30 AM",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kgoldColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _PublishedPosts extends StatelessWidget {
  const _PublishedPosts();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListView(
      padding: const EdgeInsets.only(bottom: 80),
      children: [
        const SizedBox(height: 12),

        /// STORIES

        /// POSTS
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
    );
  }
}
