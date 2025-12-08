import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:harmanapp/helper.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  static const accentGradient = LinearGradient(
    colors: [Color(0xFFDAA520), Colors.orange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: CupertinoColors.white,
        appBar: InstagramTopBar(),
        body: Column(
          children: [
            const SizedBox(height: 8),

            TabBar(
              indicatorColor: Color(0xFFDAA520),
              indicatorWeight: 4,
              labelColor: Color(0xFFDAA520),
              unselectedLabelColor: Colors.black54,
              dividerColor: Colors.transparent,

              tabs: const [
                Tab(icon: Icon(Icons.photo, size: 30)),
                Tab(icon: Icon(Icons.video_library, size: 30)),
                Tab(icon: Icon(Icons.live_tv, size: 30)),
                Tab(icon: Icon(Icons.person, size: 30)),
              ],
            ),

            const SizedBox(height: 12),

            Expanded(
              child: TabBarView(
                children: const [
                  ImagesTab(),
                  ReelsTab(),
                  LiveTab(),
                  EmptyTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// final List<Map<String, dynamic>> sampleReels = List.generate(
//   20,
//   (i) => {
//     'thumb': 'https://picsum.photos/seed/reel\$i/600/400',
//     'duration': '${(15 + i * 5) % 60}s',
//     'title': 'Reel #\$i',
//   },
// );

// final List<Map<String, dynamic>> sampleLives = List.generate(
//   4,
//   (i) => {
//     'thumb': 'https://picsum.photos/seed/live\$i/1200/700',
//     'viewers': 120 + i * 35,
//     'title': 'Live: Creator \$i',
//   },
// );

final List<String> sampleImages = [
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Allu_Arjun_at_Pushpa_2_The_Rule_meet.jpg/250px-Allu_Arjun_at_Pushpa_2_The_Rule_meet.jpg',
  'https://www.famekeeda.com/blogs/content/images/2025/07/Just-being-around-you-guys-makes-me-happy.---I-know-I-am-repeating-myself-here-but-like-I-said-t.jpg',
  'https://images.filmibeat.com/ph-big/2024/02/nani_170685406220.jpg',
  'https://i.pinimg.com/736x/e9/53/1d/e9531d63c060fe73b351a87ca939a02f.jpg',
  'https://www.azafashions.com/blog/wp-content/uploads/2024/12/featured-iamge-1.jpg',
  'https://images.ottplay.com/webstories/wp-content/uploads/2024/08/south-couple.jpg',
  "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d",
  "https://images.unsplash.com/photo-1517841905240-472988babdf9",
  "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e",
  "https://images.unsplash.com/photo-1544723795-3fb6469f5b39",
  "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
  "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde",
  "https://images.unsplash.com/photo-1520813792240-56fc4a3765a7",
  "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
  "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
  "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d",
];

final sampleReels = [
  {"video": "1.mp4"},
  {"video": "2.mp4"},
  {"video": "3.mp4"},
  {"video": "4.mp4"},
  {"video": "1.mp4"},
  {"video": "2.mp4"},
  {"video": "3.mp4"},
  {"video": "4.mp4"},
  {"video": "1.mp4"},
  {"video": "2.mp4"},
  {"video": "3.mp4"},
  {"video": "4.mp4"},
  {"video": "1.mp4"},
  {"video": "2.mp4"},
  {"video": "3.mp4"},
  {"video": "4.mp4"},
  {"video": "1.mp4"},
  {"video": "2.mp4"},
  {"video": "3.mp4"},
  {"video": "4.mp4"},
];

class ImagesTab extends StatelessWidget {
  const ImagesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: sampleImages.length,
        padding: const EdgeInsets.only(top: 4, bottom: 12),
        itemBuilder: (context, index) {
          final url = sampleImages[index];
          return _ImageCard(imageUrl: url, index: index);
        },
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final String imageUrl;
  final int index;
  const _ImageCard({required this.imageUrl, required this.index, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = (index % 3 == 0) ? 260.0 : (index % 2 == 0 ? 180.0 : 220.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: height,
        color: Colors.grey[200],
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}

class ReelsTab extends StatelessWidget {
  const ReelsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: sampleReels.length,
        itemBuilder: (context, index) {
          final reel = sampleReels[index];
          // return ReelCard(thumbUrl: reel['thumb']!, index: index);

          return ReelCard(videoName: reel['video']!, index: index);
        },
      ),
    );
  }
}

class ReelCard extends StatefulWidget {
  final String videoName;
  final int index;

  const ReelCard({required this.videoName, required this.index, Key? key})
    : super(key: key);

  @override
  State<ReelCard> createState() => _ReelCardState();
}

class _ReelCardState extends State<ReelCard> {
  late VideoPlayerController _controller;
  bool initialized = false;

  @override
  void initState() {
    super.initState();

    _controller =
        VideoPlayerController.asset("assets/sources/videos/${widget.videoName}")
          ..initialize().then((_) {
            setState(() => initialized = true);
            _controller.pause();
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = (widget.index % 7 == 0)
        ? 300.0
        : (widget.index % 3 == 0)
        ? 180.0
        : 150.0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => ReelsFullScreenPage(startIndex: widget.index),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: height,
              width: double.infinity,
              child: initialized
                  ? VideoPlayer(_controller)
                  : Container(color: Colors.black12),
            ),

            const Icon(Icons.play_circle_fill, size: 40, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class ReelsFullScreenPage extends StatefulWidget {
  final int startIndex;

  const ReelsFullScreenPage({required this.startIndex, Key? key})
    : super(key: key);

  @override
  State<ReelsFullScreenPage> createState() => _ReelsFullScreenPageState();
}

class _ReelsFullScreenPageState extends State<ReelsFullScreenPage> {
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.startIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: sampleReels.length,
        itemBuilder: (context, index) {
          final reel = sampleReels[index];
          return FullScreenReelPlayer(videoName: reel['video']!);
        },
      ),
    );
  }
}

class FullScreenReelPlayer extends StatefulWidget {
  final String videoName;

  const FullScreenReelPlayer({required this.videoName, Key? key})
    : super(key: key);

  @override
  State<FullScreenReelPlayer> createState() => _FullScreenReelPlayerState();
}

class _FullScreenReelPlayerState extends State<FullScreenReelPlayer> {
  late VideoPlayerController _controller;
  bool showControls = true;

  @override
  void initState() {
    super.initState();

    _controller =
        VideoPlayerController.asset("assets/sources/videos/${widget.videoName}")
          ..initialize().then((_) {
            setState(() {});
            _controller.play();
            _controller.setLooping(true);

            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) setState(() => showControls = false);
            });
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void togglePlay() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }

    setState(() => showControls = true);

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => showControls = false);
    });
  }

  void toggleMute() {
    if (_controller.value.volume == 0) {
      _controller.setVolume(1);
    } else {
      _controller.setVolume(0);
    }

    setState(() => showControls = true);

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => showControls = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isPlaying = _controller.value.isPlaying;
    final isMuted = _controller.value.volume == 0;

    return GestureDetector(
      onTap: () {
        setState(() => showControls = !showControls);

        if (showControls) {
          Future.delayed(const Duration(milliseconds: 1500), () {
            if (mounted) setState(() => showControls = false);
          });
        }
      },
      child: Stack(
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const CupertinoActivityIndicator(color: Colors.white),
          ),

          Positioned.fill(
            child: Center(
              child: AnimatedOpacity(
                opacity: showControls ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          isMuted
                              ? Icons.volume_off_rounded
                              : Icons.volume_up_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: toggleMute,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ▶️ / ⏸ PLAY BUTTON WITH TRANSPARENT BACKGROUND
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black45, // premium transparent bg
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                        onPressed: togglePlay,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
  const LiveTab({Key? key}) : super(key: key);

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
    Key? key,
  }) : super(key: key);

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
                      "${viewers} watching",
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

class YouTubePlayerScreen extends StatefulWidget {
  final String videoId;

  const YouTubePlayerScreen({required this.videoId, Key? key})
    : super(key: key);

  @override
  State<YouTubePlayerScreen> createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    if (widget.videoId.isNotEmpty) {
      String videoId = YoutubePlayer.convertUrlToId(widget.videoId) ?? '';
      controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(autoPlay: false),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoplay();
    // Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     backgroundColor: Colors.black,
    //     elevation: 0,
    //     title: Text(
    //       'Preview Youtube Video',
    //       style: TextStyle(color: Colors.white),
    //     ),
    //     leading: IconButton(
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //       icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
    //     ),
    //   ),
    //   body: SafeArea(
    //     child: Container(
    //       margin: const EdgeInsets.only(right: 10, left: 10),
    //       child: Center(child: _videoplay()),
    //     ),
    //   ),
    // );
  }

  Widget _videoplay() {
    if (widget.videoId.isEmpty) {
      return Container();
    }

    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: YoutubePlayer(
          showVideoProgressIndicator: true,
          bottomActions: [
            const SizedBox(width: 14.0),
            CurrentPosition(),
            const SizedBox(width: 8.0),
            RemainingDuration(),
            ProgressBar(isExpanded: true),
            const PlaybackSpeedButton(),
          ],
          controller: controller,
        ),
      ),
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
            'AI Avatar features coming soon ✨',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Gradient gradient;

  const GradientIcon({
    required this.icon,
    required this.size,
    required this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          gradient.createShader(Rect.fromLTWH(0, 0, size, size)),
      child: Icon(icon, size: size, color: Colors.white),
    );
  }
}
// class ReelCard extends StatelessWidget {
//   final String thumbUrl;
//   final int index;

//   const ReelCard({required this.thumbUrl, required this.index, Key? key})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final height = (index % 7 == 0)
//         ? 300.0
//         : (index % 3 == 0)
//         ? 180.0
//         : 150.0;

//     return ClipRRect(
//       borderRadius: BorderRadius.circular(6),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             height: height,
//             width: double.infinity,
//             child: Image.network(thumbUrl, fit: BoxFit.cover),
//           ),

//           Image.network(
//             "https://cdn-icons-png.flaticon.com/512/0/375.png",
//             width: 28,
//             height: 28,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }
