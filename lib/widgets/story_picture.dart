import 'package:flutter/material.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class StoryPicture extends StatelessWidget {
  const StoryPicture({
    super.key,
    required this.user,
    this.hideName = false,
    this.size = 80,
    this.borderRadius = 12,
  });

  final UserPostModel user;
  final bool hideName;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Center(
        // ⭐ centers the pop-up animation
        child: Column(
          mainAxisSize: MainAxisSize.min, // ⭐ prevents overflow
          children: [
            Container(
              height: size - 10,
              width: size - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius + 2),
                gradient: LinearGradient(
                  colors: user.tier == 'gold'
                      ? [kgoldColor, kgoldColor]
                      : user.tier == 'silver'
                      ? [ksilverColor, ksilverColor]
                      : [kbronzeColor, kbronzeColor],

                  // ),
                ),
              ),

              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: user.tier == 'gold'
                      ? kgoldColor
                      : user.tier == 'silver'
                      ? ksilverColor
                      : kbronzeColor,
                ),
                padding: const EdgeInsets.all(1),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius - 2),
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

            if (!hideName) ...[
              const SizedBox(height: 6),
              SizedBox(
                width: size,
                child: Text(
                  user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Brightness.dark == Theme.of(context).brightness
                        ? kwhiteColor
                        : kblackColor,
                    fontSize: 12,
                    fontFamily: "Gilroy",
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
