// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:harmanapp/Creatorsscreen.dart';
// import 'package:harmanapp/SubscribersScreen.dart';
// import 'package:harmanapp/explore/explore_tab.dart';
// import 'package:harmanapp/helper.dart';
// import 'package:harmanapp/models/user_post_model.dart';

// class Subscriberprofile extends StatefulWidget {
//   const Subscriberprofile({super.key});

//   @override
//   State<Subscriberprofile> createState() => _SubscriberprofileState();
// }

// enum SampleItem { itemOne, itemTwo, itemThree }

// class _SubscriberprofileState extends State<Subscriberprofile> {
//   SampleItem? selectedItem;
//   @override
//   Widget build(BuildContext context) {
//     var size = 80;
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         backgroundColor: CupertinoColors.black,
//         appBar: InstagramTopBar(),
//         body: Column(
//           children: [
//             getSubscriber(
//               posts.where((p) => p.name == 'Srikanth Natarajan').toList(),
//               (u) => Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             IconButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => SubscribersScreen(),
//                                   ),
//                                 );
//                               },
//                               icon: Icon(Icons.arrow_back),
//                               color: Colors.white,
//                             ),
//                             //SizedBox(width: 20),
//                             Text(
//                               u.name,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             //SizedBox(width: 130),
//                             PopupMenuButton<SampleItem>(
//                               iconColor: Colors.white,
//                               itemBuilder: (BuildContext context) =>
//                                   <PopupMenuEntry<SampleItem>>[
//                                     const PopupMenuItem<SampleItem>(
//                                       child: Text('Item 1'),
//                                     ),
//                                   ],
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             SizedBox(
//                               //width: 20,
//                               child: Container(
//                                 height: size - 10,
//                                 width: size - 10,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   gradient: LinearGradient(
//                                     colors: [
//                                       CupertinoColors.systemYellow,
//                                       CupertinoColors.systemYellow,
//                                     ],
//                                   ),
//                                 ),

//                                 padding: const EdgeInsets.all(2),
//                                 child: Container(
//                                   decoration: const BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: CupertinoColors.white,
//                                   ),
//                                   padding: const EdgeInsets.all(2),
//                                   child: Container(
//                                     padding: const EdgeInsets.all(2),
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: CupertinoColors.white,
//                                       image: DecorationImage(
//                                         image: AssetImage(
//                                           'assets/sources/profiles/${u.profileImage}',
//                                         ),
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             //SizedBox(width: 20),
//                             Column(
//                               children: [
//                                 Text(
//                                   u.name,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),

//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       '689',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     SizedBox(width: 60),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           '28.1M',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(width: 60),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           '1',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     SizedBox(width: 25),
//                                     Text(
//                                       'posts',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     SizedBox(width: 40),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           'followers',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(width: 40),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           'following',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SizedBox(
//                               width: 150,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.blue,
//                                   foregroundColor: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                 ),
//                                 onPressed: () {},
//                                 child: Text(
//                                   'Follow',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 150,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.grey,
//                                   foregroundColor: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                 ),
//                                 onPressed: () {},
//                                 child: Text('Message'),
//                               ),
//                             ),
//                             IconButton(
//                               color: Colors.white,
//                               onPressed: () {},
//                               icon: Icon(Icons.group_add),
//                             ),
//                             // ElevatedButton(
//                             //   onPressed: () {},
//                             //   child: Text('Follow'),
//                             // ),
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         _horizontalList(
//                           posts.where((p) => p.hasStory).toList(),
//                           gradient: const [
//                             CupertinoColors.systemGrey,
//                             CupertinoColors.systemGrey2,
//                           ],
//                         ),
//                         //SizedBox(height: 5),
//                         const SizedBox(height: 8),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             //const SizedBox(height: 8),
//             TabBar(
//               indicatorColor: Color(0xFFDAA520),
//               indicatorWeight: 4,
//               labelColor: Color(0xFFDAA520),
//               unselectedLabelColor: Colors.black54,
//               dividerColor: Colors.transparent,

//               tabs: const [
//                 Tab(icon: Icon(Icons.apps, size: 30, color: Color(0xFFFFFFFF))),
//                 Tab(
//                   icon: Icon(
//                     Icons.video_library_sharp,
//                     size: 30,
//                     color: Color(0xFFFFFFFF),
//                   ),
//                 ),
//                 Tab(
//                   icon: Icon(
//                     Icons.location_history_sharp,
//                     size: 30,
//                     color: Color(0xFFFFFFFF),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Expanded(
//               child: TabBarView(
//                 children: [ImagesTab(), ReelsTab(), ImagesTab()],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//     // );
//   }

//   Widget getSubscriber(
//     List<UserPostModel> list,
//     Widget Function(UserPostModel user) builder,
//   ) {
//     return Column(
//       children: list.map((u) => builder(u)).toList(),

//       // [Text('assets/sources/profiles/${list[1].profileImage}')],
//     );
//   }

//   Widget _horizontalList(
//     List<UserPostModel> list, {
//     required List<Color> gradient,
//   }) {
//     return SizedBox(
//       height: 120,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         separatorBuilder: (_, __) => const SizedBox(width: 12),
//         itemCount: list.length,
//         itemBuilder: (_, i) {
//           return SubscriberCircle(user: list[i], gradient: gradient);
//         },
//       ),
//     );
//   }
// }

// class Images_Tab extends StatelessWidget {
//   const Images_Tab({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.custom(
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 2,
//       ),
//       childrenDelegate: SliverChildListDelegate([FlutterLogo(), FlutterLogo()]),
//     );
//   }

//   // }
// }

// class Subscriber_post extends StatelessWidget {
//   const Subscriber_post({
//     Key? key,
//     required this.user,
//     this.hideName = false,
//     this.size = 80,
//   }) : super(key: key);
//   final UserPostModel user;
//   final bool hideName;
//   final double size;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: SizedBox(
//         width: size,
//         child: Column(
//           children: [
//             Container(
//               height: size - 10,
//               width: size - 10,
//               decoration: user.hasStory
//                   ? const BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: LinearGradient(
//                         colors: [
//                           CupertinoColors.systemYellow,
//                           CupertinoColors.systemYellow,
//                         ],
//                       ),
//                     )
//                   : null,
//               padding: const EdgeInsets.all(2),
//               child: Container(
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: CupertinoColors.white,
//                 ),
//                 padding: const EdgeInsets.all(2),
//                 child: Container(
//                   padding: const EdgeInsets.all(2),
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
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:harmanapp/SubscribersScreen.dart';
import 'package:harmanapp/explore/explore_tab.dart';
import 'package:harmanapp/helper.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class Subscriberprofile extends StatefulWidget {
  const Subscriberprofile({super.key});

  @override
  State<Subscriberprofile> createState() => _SubscriberprofileState();
}

enum SampleItem { itemOne }

class _SubscriberprofileState extends State<Subscriberprofile> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    const profileSize = 80.0;
    final user = posts.firstWhere((p) => p.name == 'Srikanth Natarajan');

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: CupertinoColors.black,
        appBar: InstagramTopBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------- TOP SECTION ---------------------
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 10,
              ),
              child: Column(
                children: [
                  // -----------------------------------------------------
                  // TOP BAR WITH NAME + BACK + MENU
                  // -----------------------------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SubscribersScreen(),
                          ),
                        ),
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),

                      /// USER NAME CENTERED PROPERLY
                      Expanded(
                        child: Text(
                          user.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 15),
                      // PopupMenuButton<SampleItem>(
                      //   iconColor: Colors.white,
                      //   itemBuilder: (_) => const [
                      //     PopupMenuItem(child: Text("Item 1")),
                      //   ],
                      // ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // -----------------------------------------------------
                  // PROFILE + STATS ROW
                  // -----------------------------------------------------
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Profile Photo
                      Container(
                        height: profileSize,
                        width: profileSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [
                              CupertinoColors.systemYellow,
                              CupertinoColors.systemYellow,
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
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

                      const SizedBox(width: 20),

                      // ---------------- STATS ----------------
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   user.name,
                            //   style: const TextStyle(
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // const SizedBox(height: 8),

                            // Numbers row aligned
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                _Stat("689", "posts"),
                                _Stat("28.1M", "followers"),
                                _Stat("1", "following"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // -----------------------------------------------------
                  // BUTTON ROW ALIGNED PROPERLY
                  // -----------------------------------------------------
                  Row(
                    children: [
                      Expanded(
                        child: _Button(text: "Subscribe", color: Colors.blue),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _Button(text: "Upgrade", color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      // IconButton(
                      //   onPressed: () {},
                      //   color: Colors.white,
                      //   icon: const Icon(Icons.group_add),
                      // ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // -----------------------------------------------------
                  // HORIZONTAL STORIES LIST
                  // -----------------------------------------------------
                  // SizedBox(
                  //   height: 110,
                  //   child: ListView.separated(
                  //     scrollDirection: Axis.horizontal,
                  //     padding: const EdgeInsets.symmetric(horizontal: 10),
                  //     itemCount: posts.where((p) => p.hasStory).toList().length,
                  //     separatorBuilder: (_, __) => const SizedBox(width: 12),
                  //     itemBuilder: (_, i) {
                  //       final item = posts.where((p) => p.hasStory).toList()[i];
                  //       return SubscriberCircle(
                  //         user: item,
                  //         gradient: const [
                  //           CupertinoColors.systemGrey,
                  //           CupertinoColors.systemGrey2,
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),

            // ---------------- TABS ------------------
            const TabBar(
              indicatorColor: Color(0xFFDAA520),
              indicatorWeight: 4,
              labelColor: Color(0xFFDAA520),
              unselectedLabelColor: Colors.white54,
              tabs: [
                Tab(icon: Icon(Icons.apps, size: 28)),
                Tab(icon: Icon(Icons.video_library_sharp, size: 28)),
                Tab(icon: Icon(Icons.live_tv, size: 28)),
                Tab(icon: Icon(Icons.person, size: 28)),
              ],
            ),

            const SizedBox(height: 10),

            // ----------------- TAB VIEW -----------------
            const Expanded(
              child: TabBarView(
                children: [ImagesTab(), ReelsTab(), ImagesTab(), EmptyTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------- SMALL WIDGETS ----------------------------

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  const _Stat(this.value, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final String text;
  final Color color;
  const _Button({required this.text, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}

class ImagesTab extends StatelessWidget {
  const ImagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePaths = [
      'assets/sources/profiles/averie-woodard.jpg',

      'assets/sources/profiles/aiony-haust.jpg',
      'assets/sources/profiles/azamat-zhanisov-.jpg',
      'assets/sources/profiles/deco-dev.png',
      'assets/sources/profiles/foto-sushi.jpg',
      'assets/sources/profiles/michael-frattaroli.jpg',
    ];
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      // itemCount: 20,
      // itemBuilder: (_, i) => Container(color: Colors.grey.shade800),
      itemCount: imagePaths.length,
      itemBuilder: (_, index) {
        return Image.asset(imagePaths[index], fit: BoxFit.cover);
      },
    );
  }
}

class ReelsTab extends StatelessWidget {
  const ReelsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final videos = [
      'assets/sources/videos/1.mp4',
      'assets/sources/videos/2.mp4',
      'assets/sources/videos/3.mp4',
      'assets/sources/videos/4.mp4',
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: videos.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ReelPlayer(videoPath: videos[i]),
              ),
            );
          },
          child: FutureBuilder<Uint8List?>(
            future: VideoThumbnail.thumbnailData(
              video: videos[i],
              imageFormat: ImageFormat.JPEG,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container(color: Colors.grey.shade900);
              }
              return Image.memory(snapshot.data!, fit: BoxFit.cover);
            },
          ),
        );
      },
    );
  }
}

class ReelPlayer extends StatefulWidget {
  final String videoPath;
  const ReelPlayer({required this.videoPath, super.key});

  @override
  State<ReelPlayer> createState() => _ReelPlayerState();
}

class _ReelPlayerState extends State<ReelPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        controller.play();
        controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: controller.value.isInitialized
          ? Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class EmptyTab extends StatelessWidget {
  const EmptyTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              gradient: ExploreScreen.accentGradient,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 18,
                ),
              ],
            ),
            child: const Icon(
              Icons.construction,
              size: 72,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'AI Avatar feature coming soon ✨',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'We are working to bring more creative tools for creators.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
