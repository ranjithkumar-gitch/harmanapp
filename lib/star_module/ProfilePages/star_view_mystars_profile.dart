import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harmanapp/AppBar/app_bar.dart.dart';
import 'package:harmanapp/Dashboard/explore_screen.dart';
import 'package:harmanapp/ProfilePages/my_stars_marketplace.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/star_module/Star_AppBar/star_app_bar.dart.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class StarMycreatorprofile extends StatefulWidget {
  const StarMycreatorprofile({super.key, required String usrName});

  @override
  State<StarMycreatorprofile> createState() => _StarMycreatorprofileState();
}

enum SampleItem { itemOne }

class _StarMycreatorprofileState extends State<StarMycreatorprofile>
    with SingleTickerProviderStateMixin {
  bool isFollowing = false;
  SampleItem? selectedItem;
  late TabController _tabController;
  final List<String> _icons = [
    "assets/reels.png",
    "assets/livestream.png",
    "assets/star_legacy.png",
    "assets/gold_ai.png",
    "assets/gold_cart.png",
  ];

  @override
  void initState() {
    super.initState();
    posts.shuffle();
    _tabController = TabController(length: _icons.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    if (posts.isEmpty) {
      return Scaffold(
        backgroundColor: Brightness.dark == Theme.of(context).brightness
            ? kblackColor
            : kwhiteColor,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    final user = posts.firstWhere(
      (p) => p.name == "Srikanth Natarajan" || p.name == "Devi S Prasad",
      orElse: () => posts.first,
    );

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Brightness.dark == Theme.of(context).brightness
            ? kblackColor
            : kwhiteColor,
        appBar: const StarCustomAppBar(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    coverImage('assets/sources/images/cover.png'),
                    profileImage(
                      'assets/sources/profiles/${user.profileImage}',
                      user.name,
                    ),

                    Container(
                      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                      child: AnimatedBuilder(
                        animation: _tabController,
                        builder: (_, __) {
                          return TabBar(
                            controller: _tabController,
                            indicatorColor: kgoldColor,
                            indicatorWeight: 4,
                            labelPadding: EdgeInsets.zero,
                            tabs: List.generate(_icons.length, (index) {
                              final bool isSelected =
                                  _tabController.index == index;

                              return Tab(
                                icon: Image.asset(
                                  _icons[index],
                                  height: 40,
                                  color: isSelected ? kgoldColor : Colors.grey,
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },

          body: Container(
            transform: Matrix4.translationValues(0.0, -40.0, 0.0),
            child: TabBarView(
              controller: _tabController,

              children: [
                ImagesTab(),
                // ReelsTab(),
                // ImagesTab(),
                LiveTab(),
                LegacyTab(),

                EmptyTab(),
                Mycreatorsmarketplace(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget coverImage(String imagePath) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: 220,
            child: Image.asset(imagePath, fit: BoxFit.fill),
          ),

          /// 🔙 Back Button (Top Left)
          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: IconButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(Colors.black54),
                ),
                onPressed: () => Navigator.pop(context),
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 0.0,
                  top: 2.0,
                  bottom: 2.0,
                ),
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileImage(String imagePath, String name) {
    return Container(
      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [kgoldColor, Colors.white],
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 30),
                              Text(
                                name,
                                style: TextStyle(
                                  color:
                                      Brightness.dark ==
                                          Theme.of(context).brightness
                                      ? kwhiteColor
                                      : kblackColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '@ $name',
                                style: TextStyle(
                                  color:
                                      Brightness.dark ==
                                          Theme.of(context).brightness
                                      ? kwhiteColor
                                      : kblackColor,
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
              Positioned(
                bottom: -5,
                left: 85,
                child: SizedBox(
                  height: 30,
                  width: 30,

                  child: Positioned(
                    bottom: -10,
                    right: -10,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Brightness.dark == Theme.of(context).brightness
                            ? kblackColor
                            : kwhiteColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: kgoldColor, width: 1),
                      ),
                      child: Icon(Icons.star, color: kgoldColor, size: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: kgoldColor,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (_) => CupertinoTheme(
                          data: CupertinoThemeData(
                            brightness:
                                Brightness.dark == Theme.of(context).brightness
                                ? Brightness.dark
                                : Brightness.light,
                            primaryColor: kgoldColor,
                          ),
                          child: CupertinoAlertDialog(
                            title: const Text(
                              "Delete Account",
                              style: TextStyle(color: kgoldColor),
                            ),
                            content: Text(
                              "Are you sure you want to Unsubscribe?",
                              style: TextStyle(
                                // color: isDark ? Colors.white70 : Colors.black54,
                              ),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancel"),
                              ),
                              CupertinoDialogAction(
                                isDestructiveAction: true,
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  "Unsubscribe",
                                  style: TextStyle(color: kgoldColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
                      side: const BorderSide(color: kgoldColor),
                      foregroundColor:
                          Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
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
                    // style: OutlinedButton.styleFrom(
                    //   padding: EdgeInsets.zero,
                    //   backgroundColor: isFollowing
                    //       ? kgoldColor
                    //       : Colors.transparent,
                    //   side: BorderSide(
                    //     color: isFollowing ? kgoldColor : kgoldColor,
                    //   ),
                    //   foregroundColor: isFollowing
                    //       ? Brightness.dark == Theme.of(context).brightness
                    //             ? kwhiteColor
                    //             : kblackColor
                    //       : Colors.black,

                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    // ),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: isFollowing
                          ? kgoldColor
                          : Colors.transparent,
                      side: const BorderSide(color: kgoldColor),
                      foregroundColor: isFollowing
                          ? kblackColor
                          : (Theme.of(context).brightness == Brightness.dark
                                ? kwhiteColor
                                : kblackColor),
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
                          isFollowing ? "Stargazing" : "Stargaze",

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
            style: TextStyle(
              color: Brightness.dark == Theme.of(context).brightness
                  ? kwhiteColor
                  : kblackColor,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 10),

          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '14',
                    style: TextStyle(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Stills',
                    style: TextStyle(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
                      fontSize: 14,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5),
              Text(
                'o',
                style: TextStyle(
                  color: Brightness.dark == Theme.of(context).brightness
                      ? kwhiteColor
                      : kgoldColor,
                  fontSize: 3,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 5),
              Row(
                children: [
                  Text(
                    '12',
                    style: TextStyle(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Bits',
                    style: TextStyle(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
                      fontSize: 14,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 5),
              Text(
                'O',
                style: TextStyle(
                  color: Brightness.dark == Theme.of(context).brightness
                      ? kgoldColor
                      : kgoldColor,
                  fontSize: 3,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 5),
              Row(
                children: [
                  Text(
                    '20',
                    style: TextStyle(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Stars',
                    style: TextStyle(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
                      fontSize: 14,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 8),
                  Text(
                    '|',
                    style: TextStyle(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/google1.png', width: 25, height: 25),

                    GestureDetector(
                      onTap: () {},

                      child: Icon(
                        Icons.apple,
                        color: Brightness.dark == Theme.of(context).brightness
                            ? kwhiteColor
                            : kblackColor,
                      ),
                    ),

                    Image.asset('assets/facebook.png', width: 20, height: 20),

                    Icon(
                      FontAwesomeIcons.xTwitter,
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
                      size: 20,
                    ),

                    Icon(
                      FontAwesomeIcons.twitch,
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
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
}

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
                  color: Colors.black.withValues(alpha: .45),
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
      'assets/sources/profiles/bhatia.jpg',
      'assets/sources/profiles/deepika.jpg',
      'assets/sources/profiles/Virat_Kohli.jpg',
      'assets/sources/profiles/dion.jpg',
      'assets/sources/profiles/elon.jpeg',
      'assets/sources/profiles/greta.jpeg',
      "assets/sources/profiles/jack.jpg",
      "assets/sources/profiles/jeff.jpeg",
      "assets/sources/profiles/malala.jpg",
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
      'assets/sources/videos/deepika.mp4',
      'assets/sources/videos/obama.mp4',
      'assets/sources/videos/oprah.mp4',
      'assets/sources/videos/virat.mp4',
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

class EmptyTab extends StatefulWidget {
  const EmptyTab({super.key});

  @override
  State<EmptyTab> createState() => _EmptyTabState();
}

class _EmptyTabState extends State<EmptyTab> {
  int selectedAvatarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Main content (center)
        SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // Placeholder for 3 containers in row
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildAvatarContainer(context, 0, 'Avatar 1'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildAvatarContainer(context, 1, 'Avatar 2'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildAvatarContainer(context, 2, 'Avatar 3'),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                //
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: ExploreScreen.accentGradient,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
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
                    color: kgoldColor,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
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
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.mic, color: Colors.white, size: 32),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarContainer(BuildContext context, int index, String label) {
    final isDark = Brightness.dark == Theme.of(context).brightness;
    final isSelected = selectedAvatarIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAvatarIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? kgoldColor
              : (isDark ? Colors.grey.shade900 : Colors.grey.shade100),
          borderRadius: BorderRadius.circular(12),
          border: Border.fromBorderSide(
            BorderSide(color: kgoldColor, width: 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              const Icon(Icons.done_all, size: 16, color: kblackColor),
            if (isSelected) const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? kblackColor
                    : (isDark ? kwhiteColor : kblackColor),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
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
                  color: Colors.black.withValues(alpha: 0.08),
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
