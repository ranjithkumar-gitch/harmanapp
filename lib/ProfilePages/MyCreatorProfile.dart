import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harmanapp/AppBar/AppBar.dart';
import 'package:harmanapp/Dashboard/explore_screen.dart';

import 'package:harmanapp/Login/LoginScreen.dart';

import 'package:harmanapp/ProfilePages/MycreatorsMarketPlace.dart';

import 'package:harmanapp/models/user_post_model.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class Mycreatorprofile extends StatefulWidget {
  const Mycreatorprofile({super.key, required String usrName});

  // String get strName => strName;

  @override
  State<Mycreatorprofile> createState() => _MycreatorprofileState();
}

enum SampleItem { itemOne }

class _MycreatorprofileState extends State<Mycreatorprofile> {
  bool isFollowing = false;

  //var profileName = "";
  SampleItem? selectedItem;
  // void initState() {
  //   super.initState();
  //   profileName = widget.strName;
  // }

  @override
  Widget build(BuildContext context) {
    setState(() {
      posts.shuffle();
    });
    const profileSize = 80.0;
    // var size = MediaQuery.of(context).size;
    final user = posts.firstWhere((p) => p.name == "Srikanth Natarajan");

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: CupertinoColors.black,
        appBar: const CustomAppBar(),

        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoverImage('assets/sources/profiles/${user.profileImage}'),

                    ProfileImage(
                      'assets/sources/profiles/${user.profileImage}',
                      user.name,
                    ),

                    const TabBar(
                      indicatorColor: Color(0xFFDAA520),
                      indicatorWeight: 4,
                      labelColor: Color(0xFFDAA520),
                      unselectedLabelColor: Colors.white54,
                      tabs: [
                        Tab(icon: Icon(Icons.apps, size: 28)),
                        // Tab(icon: Icon(Icons.video_library_sharp, size: 28)),
                        Tab(icon: Icon(Icons.live_tv, size: 28)),
                        Tab(icon: Icon(Icons.person_2_outlined, size: 28)),
                        Tab(icon: Icon(Icons.shopping_bag_outlined, size: 28)),
                        Tab(icon: Icon(Icons.emoji_events_outlined, size: 28)),
                      ],
                    ),
                  ],
                ),
              ),
            ];
          },

          body: const TabBarView(
            children: [
              ImagesTab(),
              // ReelsTab(),
              // ImagesTab(),
              LiveTab(),
              EmptyTab(),
              Mycreatorsmarketplace(),
              LegacyTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget CoverImage(String imagePath) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath), // AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.black54,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 0.0,
                        top: 2.0,
                        bottom: 2.0,
                      ),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ProfileImage(String imagePath, String name) {
    return
    // Container(
    //   transform: Matrix4.translationValues(0.0, -40.0, 0.0),
    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //   // height: profileSize,
    //   // width: profileSize,
    //   decoration: const BoxDecoration(
    //     shape: BoxShape.circle,
    //     gradient: LinearGradient(
    //       colors: [CupertinoColors.systemYellow, CupertinoColors.systemYellow],
    //     ),
    //   ),
    //   // padding: const EdgeInsets.all(2),
    //   child: Container(
    //     transform: Matrix4.translationValues(0.0, -40.0, 0.0),
    //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //     decoration: const BoxDecoration(
    //       shape: BoxShape.circle,
    //       color: Colors.white,
    //     ),
    //     // padding: const EdgeInsets.all(2),
    //     child: Container(
    //       transform: Matrix4.translationValues(0.0, -40.0, 0.0),
    //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //       decoration: BoxDecoration(
    //         shape: BoxShape.circle,
    //         image: DecorationImage(
    //           image: AssetImage(imagePath),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     ),
    //   ),
    // )
    Container(
      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 42,
                  backgroundImage: AssetImage(imagePath),
                ),
              ),
              const SizedBox(width: 8),
              Row(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 30),
                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '@ ${name}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Unsubscribe",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      side: const BorderSide(color: Colors.white30),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Message",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: isFollowing
                          ? Colors.blue
                          : Colors.transparent,
                      side: BorderSide(
                        color: isFollowing ? Colors.blue : Colors.white30,
                      ),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() => isFollowing = !isFollowing);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isFollowing) const Icon(Icons.done_all, size: 16),
                        if (isFollowing) const SizedBox(width: 4),
                        Text(
                          isFollowing ? "Following" : "Follow",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          Text(
            'Digital Artist | Content Creator | Photographer | Travel Enthusiast',
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
          SizedBox(height: 10),

          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Text(
                    '14',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Post',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5),
              const Text(
                'o',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 3,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 5),
              const Row(
                children: [
                  Text(
                    '12',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Media',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 5),
              const Text(
                'O',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 3,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 5),
              const Row(
                children: [
                  Text(
                    '20',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Stars',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  SizedBox(width: 8),
                  Text('|', style: TextStyle(color: Colors.grey, fontSize: 20)),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/google1.png', width: 25, height: 25),

                    GestureDetector(
                      onTap: () {
                        print("Apple login tapped");
                      },

                      child: Icon(Icons.apple, color: Colors.white),
                    ),

                    Image.asset('assets/facebook.png', width: 20, height: 20),

                    Icon(
                      FontAwesomeIcons.xTwitter,
                      color: Colors.white,
                      size: 20,
                    ),

                    Icon(
                      FontAwesomeIcons.twitch,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _subscribeBanner() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 10.0),
  //     padding: const EdgeInsets.all(2.0),
  //     decoration: BoxDecoration(
  //       color: Colors.grey.shade900,
  //       borderRadius: BorderRadius.circular(0.0),
  //     ),
  //   );
  // }

  // Widget tabsContainer(Size size) {
  //   return Stack(
  //     children: [
  //       TabBar(
  //         indicatorColor: Color(0xFFDAA520),
  //         indicatorWeight: 4,
  //         labelColor: Color(0xFFDAA520),
  //         unselectedLabelColor: Colors.white54,
  //         tabs: [
  //           Tab(icon: Icon(Icons.apps, size: 28)),
  //           Tab(icon: Icon(Icons.video_library_sharp, size: 28)),
  //           Tab(icon: Icon(Icons.live_tv, size: 28)),
  //           Tab(icon: Icon(Icons.person_2_outlined, size: 28)),
  //           Tab(icon: Icon(Icons.shopping_bag_outlined, size: 28)),
  //         ],
  //       ),
  //     ],
  //   );
  // }
}

// class SocialIcon2 extends StatelessWidget {
//   final Widget child;
//   final double size;

//   const SocialIcon2({super.key, required this.child, this.size = 20});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // width: size + 20,
//       // height: size + 20,
//       decoration: BoxDecoration(
//         color: const Color(0xFF1A1A1A),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       alignment: Alignment.center,
//       child: child,
//     );
//   }
// }

// class _Stat extends StatelessWidget {
//   final String value;
//   final String label;
//   const _Stat(this.value, this.label);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           label,
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _Button extends StatelessWidget {
//   final String text;
//   final Color color;
//   const _Button({required this.text, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 38,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: color,
//           foregroundColor: Colors.white,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         onPressed: () {},
//         child: Text(text),
//       ),
//     );
//   }
// }

final sampleLives = [
  {
    "videoId": "Y21kE_LHaOY",
    "title": "Mindfulness Meditation (1 hour)",
    "viewers": 40000,
  },
  {
    "videoId": "BnYZ6ghpFck",
    "title": "3 Hour Deep Sleep Meditation",
    "viewers": 55000,
  },
  {"videoId": "O-6f5wQXSu8", "title": "Yoga for Relaxation", "viewers": 12300},
  {
    "videoId": "Xc4D2uIdWc0",
    "title": "LoFi HipHop Live Stream",
    "viewers": 89000,
  },

  {
    "videoId": "aWmJ5DgyWPI",
    "title": "Nature Relaxation Film 4K",
    "viewers": 31000,
  },
];

class LiveTab extends StatelessWidget {
  const LiveTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      itemCount: sampleLives.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) {
        final live = sampleLives[i];
        return _LiveCard(
          videoId: live['videoId'] as String,
          title: live['title'] as String,
          viewers: live['viewers'] as int,
        );
      },
    );
  }
}

class _LiveCard extends StatelessWidget {
  final String videoId;
  final int viewers;
  final String title;

  const _LiveCard({
    required this.videoId,
    required this.viewers,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    String ytThumb = "https://img.youtube.com/vi/$videoId/hqdefault.jpg";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => YouTubePlayerScreen(videoId: videoId),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                ytThumb,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

            // LIVE Badge
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.wifi_tethering, size: 14, color: Colors.white),
                    SizedBox(width: 6),
                    Text(
                      'LIVE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 12,
              bottom: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.45),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.remove_red_eye,
                      size: 14,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "$viewers watching",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
  const EmptyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Main content (center)
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 145,
                height: 145,
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
                  size: 65,
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
            ],
          ),
        ),

        /// Mic button at bottom
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: ExploreScreen.accentGradient,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.mic, color: Colors.white, size: 32),
                onPressed: () {
                  // TODO: mic action
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LegacyTab extends StatelessWidget {
  const LegacyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/sources/profiles/timeline.jpeg",
      // width: 200,
      // height: 400,
      fit: BoxFit.fitHeight,
    );
  }
}

class FreshTab extends StatelessWidget {
  const FreshTab({super.key});

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
              Icons.shopping_bag,
              size: 72,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Subscribe to get Full Content ✨',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
