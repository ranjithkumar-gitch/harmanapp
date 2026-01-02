import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/AppBar/AppBar.dart';
import 'package:harmanapp/ProfilePages/AllCreators_profile.dart';

import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/widgets/colors.dart';

class AllCreatorsScreen extends StatefulWidget {
  const AllCreatorsScreen({super.key});

  @override
  State<AllCreatorsScreen> createState() => _AllCreatorsScreenState();
}

class _AllCreatorsScreenState extends State<AllCreatorsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kblackColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                child: SearchBar(
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: kgoldColor),
                    ),
                  ),

                  hintText: "Search Stars...",
                  hintStyle: WidgetStatePropertyAll(
                    TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  textStyle: WidgetStatePropertyAll(
                    TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  padding: const WidgetStatePropertyAll<EdgeInsets>(
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

            const Divider(color: Colors.white24),

            _title("Silver", Colors.grey),
            _creatorCarousel(
              posts.where((p) => p.hasStory).toList(),
              autoPlayInterval: 6,
              tiername: "Silver",
            ),

            const Divider(color: Colors.white24),

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
      child: Icon(Icons.star, color: color),
      // child: Text(
      //   text,

      //   style: GoogleFonts.greatVibes(
      //     textStyle: TextStyle(
      //       color: color,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20,
      //     ),
      //   ),
      // ),
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
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (_) => MycreatorprofileDummy(usrName: ""),
                  //   ),
                  // );
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
