import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),

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
                    ],
                  ),

                  const SizedBox(height: 15),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),

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

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  const _Stat(this.value, this.label);

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
  const _Button({required this.text, required this.color});

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
  const EmptyTab({super.key});

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
