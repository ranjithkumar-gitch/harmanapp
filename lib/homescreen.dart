import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/helper.dart';
import 'package:harmanapp/models/post_model.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/widgets/image_post.dart';
import 'package:harmanapp/widgets/reel_post.dart';
import 'package:harmanapp/widgets/story_picture.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<UserPostModel> storys = posts.where((post) => post.hasStory);
    return CupertinoTabView(
      // defaultTitle: 'Home',
      builder: (context) => CupertinoPageScaffold(
        backgroundColor: CupertinoColors.white,
        navigationBar: const InstagramTopBar(),
        child: ListView(
          children: [
            SizedBox(
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    // const CreateStory(),
                    // const SizedBox(width: 5),
                    ...posts
                        .where((post) => post.hasStory)
                        .map(
                          (user) => Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: StoryPicture(user: user),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
            const Divider(color: CupertinoColors.separator, height: 5),
            // ImagePost(
            //   post: posts[3],
            // ),
            ...posts.map((post) {
              if (post.post.postType == Post.picture) {
                return ImagePost(post: post);
              }
              return ReelPost(post: post);
            }).toList(),
            // ReelPost(post: posts[0]),
          ],
        ),
      ),
    );
  }
}
