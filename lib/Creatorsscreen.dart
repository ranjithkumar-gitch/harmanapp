import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/helper.dart';
import 'package:harmanapp/models/user_post_model.dart';

class CreatorsScreen extends StatefulWidget {
  const CreatorsScreen({super.key});

  @override
  State<CreatorsScreen> createState() => _CreatorsScreenState();
}

class _CreatorsScreenState extends State<CreatorsScreen> {
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
            const Divider(color: Colors.white24),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: SizedBox(
                  width: size.width * 0.85,
                  child: SearchBar(
                    hintText: "Search creators...",
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 16),
                    ),
                    leading: const Icon(Icons.search),
                    onTap: () => showSearch(
                      context: context,
                      delegate: DataSearch(posts),
                    ),
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
          ],
        ),
      ),
    );
  }

  Widget _title(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 20,
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
                    CupertinoPageRoute(
                      builder: (_) => CreatorProfilePage(user: user),
                    ),
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

class DataSearch extends SearchDelegate<String> {
  final List<UserPostModel> listSubscribe;
  DataSearch(this.listSubscribe);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ""),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(CupertinoIcons.back),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final result = listSubscribe
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (_, index) => ListTile(
        title: Text(
          result[index].name,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          "Subscriber",
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? listSubscribe
        : listSubscribe
              .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
              .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (_, index) {
        final name = suggestionList[index].name;

        final startIndex = name.toLowerCase().indexOf(query.toLowerCase());
        final endIndex = startIndex + query.length;

        return ListTile(
          onTap: () {
            close(context, "");
          },
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: name.substring(0, startIndex)),
                TextSpan(
                  text: name.substring(startIndex, endIndex),
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: name.substring(endIndex)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CreatorProfilePage extends StatelessWidget {
  final UserPostModel user;

  const CreatorProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(middle: Text(user.name)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                'assets/sources/profiles/${user.profileImage}',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 20,
                color: CupertinoColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
