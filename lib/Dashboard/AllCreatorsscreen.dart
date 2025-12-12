import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/AppBar/AppBar.dart';
import 'package:harmanapp/ProfilePages/allCreatorsProfile.dart';

import 'package:harmanapp/models/user_post_model.dart';

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
      backgroundColor: Colors.black,
      appBar: InstagramTopBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(
                  width: size.width * 0.85,
                  child: SearchBar(
                    hintText: "Search Creators...",
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 16),
                    ),
                    leading: const Icon(Icons.search),
                    // onTap: () => showSearch(
                    //   context: context,
                    //   delegate: DataSearch(posts),
                    // ),
                  ),
                ),
              ),
            ),

            _title("Gold", const Color(0xffd4b300)),
            _creatorCarousel(
              posts.where((p) => p.hasStory).toList(),
              autoPlayInterval: 3,
            ),

            const Divider(color: Colors.white24),

            _title("Silver", Colors.grey),
            _creatorCarousel(
              posts.where((p) => p.hasStory).toList(),
              autoPlayInterval: 6,
            ),

            const Divider(color: Colors.white24),

            _title("Bronze", CupertinoColors.systemBrown),
            _creatorCarousel(
              posts.where((p) => p.hasStory).toList(),
              autoPlayInterval: 5,
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
      child: Text(
        text,

        style: GoogleFonts.greatVibes(
          textStyle: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _creatorCarousel(
    List<UserPostModel> list, {
    required int autoPlayInterval,
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
