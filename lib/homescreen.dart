import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/helper.dart';
import 'package:harmanapp/models/post_model.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/widgets/image_post.dart';
import 'package:harmanapp/widgets/reel_post.dart';
import 'package:harmanapp/widgets/story_picture.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // List<UserPostModel> storys = posts.where((post) => post.hasStory);
//     return CupertinoTabView(
//       // defaultTitle: 'Home',
//       builder: (context) => CupertinoPageScaffold(
//         backgroundColor: CupertinoColors.white,
//         navigationBar: const InstagramTopBar(),
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 100,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   children: [
//                     // const CreateStory(),
//                     // const SizedBox(width: 5),
//                     ...posts
//                         .where((post) => post.hasStory)
//                         .map(
//                           (user) => Padding(
//                             padding: const EdgeInsets.only(left: 10),
//                             child: StoryPicture(user: user),
//                           ),
//                         )
//                         .toList(),
//                   ],
//                 ),
//               ),
//             ),
//             const Divider(color: CupertinoColors.separator, height: 5),
//             // ImagePost(
//             //   post: posts[3],
//             // ),
//             ...posts.map((post) {
//               if (post.post.postType == Post.picture) {
//                 return ImagePost(post: post);
//               }
//               return ReelPost(post: post);
//             }).toList(),
//             // ReelPost(post: posts[0]),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) => CupertinoPageScaffold(
        backgroundColor: const Color(0xFF0F0F0F),
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: Color(0xFF0F0F0F),
          middle: Text(
            "Home",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          border: Border(bottom: BorderSide(color: Colors.white12, width: 0.3)),
        ),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(height: 12),

              // -------------------- STORIES ----------------------
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

              // -------------------- POSTS ------------------------
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
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
