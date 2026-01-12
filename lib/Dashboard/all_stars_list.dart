import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/AppBar/app_bar.dart.dart';
import 'package:harmanapp/ProfilePages/view_all_stars_profile.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class AllCreatorsScreen extends StatefulWidget {
  const AllCreatorsScreen({super.key});

  @override
  State<AllCreatorsScreen> createState() => _AllCreatorsScreenState();
}

class _AllCreatorsScreenState extends State<AllCreatorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Brightness.dark == Theme.of(context).brightness
          ? kblackColor
          : kwhiteColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                child: SearchBar(
                  backgroundColor: WidgetStateProperty.all(
                    Brightness.dark == Theme.of(context).brightness
                        ? kblackColor
                        : kwhiteColor,
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: kgoldColor),
                    ),
                  ),

                  hintText: "Search Stars...",
                  hintStyle: WidgetStateProperty.all(
                    TextStyle(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  textStyle: WidgetStateProperty.all(
                    TextStyle(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  trailing: [
                    const Icon(Icons.search, color: Color(0xFFF5D778)),
                  ],

                  onTap: () {},
                  onChanged: (value) {},
                ),
              ),
            ),

            _title("Gold", kgoldColor),
            _creatorCarousel(
              posts.where((p) => p.hasStory).toList(),
              autoPlayInterval: 3,
              tiername: "Gold",
            ),

            const Divider(color: Colors.grey),

            _title("Silver", Colors.grey),
            _creatorCarousel(
              posts.where((p) => p.hasStory).toList(),
              autoPlayInterval: 6,
              tiername: "Silver",
            ),

            const Divider(color: Colors.grey),

            _title("Bronze", CupertinoColors.systemBrown),
            _creatorCarousel(
              posts.where((p) => p.hasStory).toList(),
              autoPlayInterval: 5,
              tiername: "Bronze",
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _title(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(8),
      // child: Icon(Icons.star, color: color),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Brightness.dark == Theme.of(context).brightness
              ? kblackColor
              : kwhiteColor,
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 1),
        ),
        child: Icon(Icons.star, color: color, size: 20),
      ),
    );
  }

  Widget _creatorCarousel(
    List<UserPostModel> list, {
    required int autoPlayInterval,
    required String tiername,
  }) {
    return SizedBox(
      height: 140,
      child: CarouselSlider(
        items: list.map((user) {
          return Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (_) => AllCreatorsProfile()),
                  );
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/sources/profiles/${user.profileImage}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      user.name,
                      style: const TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: 360,
          autoPlay: false,
          autoPlayInterval: Duration(seconds: autoPlayInterval),
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.3,
          animateToClosest: true,
          enableInfiniteScroll: true,
        ),
      ),
    );
  }
}
