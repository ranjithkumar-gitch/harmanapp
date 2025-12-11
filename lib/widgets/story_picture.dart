import 'package:flutter/cupertino.dart';
import 'package:harmanapp/models/user_post_model.dart';

import 'package:google_fonts/google_fonts.dart';

class StoryPicture extends StatelessWidget {
  const StoryPicture({
    super.key,
    required this.user,
    this.hideName = false,
    this.size = 80,
  });
  final UserPostModel user;
  final bool hideName;
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Column(
        children: [
          Container(
            height: size - 10,
            width: size - 10,
            decoration:
                // user.hasStory?
                const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      CupertinoColors.systemOrange,
                      CupertinoColors.systemRed,
                    ],
                  ),
                ),
            // : null,
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: CupertinoColors.white,
              ),
              padding: const EdgeInsets.all(2),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CupertinoColors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/sources/profiles/${user.profileImage}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          if (!hideName)
            Text(
              user.name,

              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 12,
                fontFamily: "Gilroy",
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}
