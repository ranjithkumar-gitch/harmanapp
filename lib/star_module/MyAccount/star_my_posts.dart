import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:harmanapp/models/post_model.dart';
import 'package:harmanapp/star_module/MyAccount/posts/star_mypost_imagePost.dart';
import 'package:harmanapp/star_module/MyAccount/posts/star_mypost_imageblurpost.dart';
import 'package:harmanapp/star_module/MyAccount/posts/star_mypost_reelBlur.dart';
import 'package:harmanapp/star_module/MyAccount/posts/star_mypost_reelPost.dart';
import 'package:harmanapp/star_module/MyAccount/posts/star_post_model.dart';

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
        backgroundColor: isDark ? kblackColor : kwhiteColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? kwhiteColor : kblackColor,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "My Posts",
          style: TextStyle(
            color: isDark ? kwhiteColor : kblackColor,
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
          child: post.post.postType == Post.picture
              ? StarImageBlurPost(post: post)
              : StarReelBlurPost(post: post),
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
