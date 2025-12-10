import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/helper.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:rive/rive.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class CreatorsScreen extends StatefulWidget {
  const CreatorsScreen({super.key});

  @override
  State<CreatorsScreen> createState() => _CreatorsScreenState();
}

class _CreatorsScreenState extends State<CreatorsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CupertinoTabView(
      builder: (context) => CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
        navigationBar: const InstagramTopBar(),

        child: SafeArea(
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

              /// GOLD SECTION
              _title("Gold", const Color(0xffd4b300)),
              _horizontalList(
                posts.where((p) => p.hasStory).toList(),
                gradient: const [
                  CupertinoColors.systemYellow,
                  CupertinoColors.systemYellow,
                ],
              ),

              const Divider(color: Colors.white24),

              /// SILVER SECTION
              _title("Silver", Colors.grey),
              _horizontalSILVERList(
                posts.where((p) => p.hasStory).toList(),
                gradient: const [
                  CupertinoColors.systemGrey,
                  CupertinoColors.systemGrey2,
                ],
              ),

              const Divider(color: Colors.white24),

              /// BRONZE SECTION
              _title("Bronze", CupertinoColors.systemBrown),
              _horizontalBRONZEList(
                posts.where((p) => p.hasStory).toList(),
                gradient: const [
                  CupertinoColors.systemBrown,
                  CupertinoColors.systemBrown,
                ],
              ),
            ],
          ),
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

  Widget _horizontalList(
    List<UserPostModel> list, {
    required List<Color> gradient,
  }) {
    return SizedBox(
      height: 135,
      child: CarouselSlider(
        items: list.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            shape: BoxShape.rectangle,
                            color: CupertinoColors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/sources/profiles/${i.profileImage}',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      i.name,
                      style: const TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
              //SizedBox(height: 6),
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: 355,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 950),
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.3,
          animateToClosest: true,
          enableInfiniteScroll: true,
        ),
      ),
    );
  }

  Widget _horizontalSILVERList(
    List<UserPostModel> list, {
    required List<Color> gradient,
  }) {
    return SizedBox(
      height: 135,
      child: CarouselSlider(
        items: list.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            shape: BoxShape.rectangle,
                            color: CupertinoColors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/sources/profiles/${i.profileImage}',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      i.name,
                      style: const TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
              //SizedBox(height: 6),
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: 355,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(milliseconds: 805),
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.3,
          animateToClosest: true,
          enableInfiniteScroll: true,
        ),
      ),
    );
  }

  Widget _horizontalBRONZEList(
    List<UserPostModel> list, {
    required List<Color> gradient,
  }) {
    return SizedBox(
      height: 135,
      child: CarouselSlider(
        items: list.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            shape: BoxShape.rectangle,
                            color: CupertinoColors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/sources/profiles/${i.profileImage}',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      i.name,
                      style: const TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
              //SizedBox(height: 6),
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: 355,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(milliseconds: 950),
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

// class SubscriberSquare extends StatelessWidget {
//   final UserPostModel user;
//   final List<Color> gradient;
//   final double size;
//   final bool hideName;

//   const SubscriberSquare({
//     super.key,
//     required this.user,
//     required this.gradient,
//     this.size = 100,
//     this.hideName = false,
//   });

//@override
// Widget build(BuildContext context) {
//   return SizedBox(
//     width: size,
//     child: Card(
//       color: Colors.black,
//       elevation: 12,
//       child: ClipRRect(
//         borderRadius: const BorderRadius.all(Radius.circular(10)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: size - 5,
//               width: size - 5,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 //gradient: LinearGradient(colors: gradient),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(2),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: CupertinoColors.white,
//                     image: DecorationImage(
//                       image: AssetImage(
//                         'assets/sources/profiles/${user.profileImage}',
//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             //SizedBox(height: 6),
//             if (!hideName)
//               Text(
//                 user.name,
//                 style: const TextStyle(
//                   color: CupertinoColors.white,
//                   fontSize: 12,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//               ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
//}

// class SubscriberCircle extends StatelessWidget {
//   final UserPostModel user;
//   final List<Color> gradient;
//   final double size;
//   final bool hideName;

//   const SubscriberCircle({
//     super.key,
//     required this.user,
//     required this.gradient,
//     this.size = 80,
//     this.hideName = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: size,
//       child: Column(
//         children: [
//           Container(
//             height: size - 10,
//             width: size - 10,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               //gradient: LinearGradient(colors: gradient),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(2),
//               child: Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: CupertinoColors.white,
//                   image: DecorationImage(
//                     image: AssetImage(
//                       'assets/sources/profiles/${user.profileImage}',
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           if (!hideName)
//             Text(
//               user.name,
//               style: const TextStyle(
//                 color: CupertinoColors.white,
//                 fontSize: 12,
//               ),
//               overflow: TextOverflow.ellipsis,
//             ),
//         ],
//       ),
//     );
//   }
//}

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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => SubscriberCircle(user: suggestionList[index]),
            //   ),
            // );
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
