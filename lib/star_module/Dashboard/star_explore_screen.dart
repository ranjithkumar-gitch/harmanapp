import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:harmanapp/AppBar/app_bar.dart.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class StarExploreScreen extends StatelessWidget {
  const StarExploreScreen({super.key});

  static const accentGradient = LinearGradient(
    colors: [kgoldColor, kwhiteColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Brightness.dark == Theme.of(context).brightness
            ? kblackColor
            : kwhiteColor,
        appBar: CustomAppBar(),
        body: Column(
          children: [
            const SizedBox(height: 8),

            TabBar(
              indicatorColor: kgoldColor,
              indicatorWeight: 4,
              labelColor: kgoldColor,
              unselectedLabelColor: Colors.grey,
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
            Container(height: 80),
          ],
        ),
      ),
    );
  }
}

final List<String> sampleImages = [
  'assets/sources/profiles/bhatia.jpg',
  'assets/sources/profiles/deepika.jpg',
  'assets/sources/profiles/Virat_Kohli.jpg',
  'assets/sources/profiles/dion.jpg',
  'assets/sources/profiles/elon.jpeg',
  'assets/sources/profiles/greta.jpeg',
  "assets/sources/profiles/jack.jpg",
  "assets/sources/profiles/jeff.jpeg",
  "assets/sources/profiles/malala.jpg",
  "assets/sources/profiles/messi.jpg",
  "assets/sources/profiles/michele.jpg",
  "assets/sources/profiles/murthy.jpg",
  "assets/sources/profiles/nayar.jpeg",
  "assets/sources/profiles/obama.jpg",
  "assets/sources/profiles/oprah.jpg",
  "assets/sources/profiles/Ratan_Tata.jpg",
  "assets/sources/profiles/richard.jpeg",
  "assets/sources/profiles/shawn.jpg",
  "assets/sources/profiles/suzuki.jpg",
  "assets/sources/profiles/swift.jpg",
  "assets/sources/profiles/Virat_Kohli.jpg",
];

final sampleReels = [
  {"video": "tesla2.mp4"},
  {"video": "obama.mp4"},
  {"video": "rcb.mp4"},
  {"video": "tesla.mp4"},
  {"video": "deepika2.mp4"},
  {"video": "oprah.mp4"},
  {"video": "virat.mp4"},
  {"video": "7.mp4"},
  {"video": "deepika.mp4"},
];

class ImagesTab extends StatelessWidget {
  const ImagesTab({super.key});

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
  const _ImageCard({required this.imageUrl, required this.index});

  @override
  Widget build(BuildContext context) {
    final height = (index % 3 == 0) ? 260.0 : (index % 2 == 0 ? 180.0 : 220.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: height,
        color: Colors.grey[200],
        child: Image.asset(imageUrl, fit: BoxFit.cover, width: double.infinity),
      ),
    );
  }
}

class ReelsTab extends StatelessWidget {
  const ReelsTab({super.key});

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

  const ReelCard({required this.videoName, required this.index, super.key});

  @override
  State<ReelCard> createState() => _ReelCardState();
}

class _ReelCardState extends State<ReelCard> {
  VideoPlayerController? _controller;
  bool initialized = false;

  void _initVideo() async {
    if (_controller != null) return;

    _controller = VideoPlayerController.asset(
      "assets/sources/videos/${widget.videoName}",
    );

    await _controller!.initialize();
    _controller!
      ..setLooping(true)
      ..setVolume(0)
      ..play();

    setState(() => initialized = true);
  }

  void _disposeVideo() {
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    initialized = false;
  }

  @override
  void dispose() {
    _disposeVideo();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.videoName),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.6) {
          _initVideo();
        } else {
          _disposeVideo();
        }
      },
      child: GestureDetector(
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
              AspectRatio(
                aspectRatio: initialized
                    ? _controller!.value.aspectRatio
                    : 9 / 16,
                child: initialized
                    ? VideoPlayer(_controller!)
                    : Container(color: Colors.black12),
              ),
              if (!initialized)
                const Icon(
                  Icons.play_circle_fill,
                  size: 40,
                  color: Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReelsFullScreenPage extends StatefulWidget {
  final int startIndex;

  const ReelsFullScreenPage({required this.startIndex, super.key});

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

  const FullScreenReelPlayer({required this.videoName, super.key});

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

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black45,
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
  const LiveTab({super.key});

  @override
  Widget build(BuildContext context) {
    // return ListView.separated(
    //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    //   itemCount: sampleLives.length,
    //   separatorBuilder: (_, __) => const SizedBox(height: 12),
    //   itemBuilder: (context, i) {
    //     final live = sampleLives[i];
    //     return _LiveCard(
    //       videoId: live['videoId'] as String,
    //       title: live['title'] as String,
    //       viewers: live['viewers'] as int,
    //     );
    //   },
    // );
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      itemCount: sampleLives.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) {
        if (i == 0) {
          return const _ScheduledLiveCard(
            videoId: "Y21kE_LHaOY",
            scheduledTime: "Jan 10 • 8:00 PM",
          );
        }

        final live = sampleLives[i - 1];
        return _LiveCard(
          videoId: live['videoId'] as String,
          title: live['title'] as String,
          viewers: live['viewers'] as int,
        );
      },
    );
  }
}

class _ScheduledLiveCard extends StatelessWidget {
  final String videoId;
  final String scheduledTime;

  const _ScheduledLiveCard({
    required this.videoId,
    required this.scheduledTime,
  });

  @override
  Widget build(BuildContext context) {
    final ytThumb = "https://img.youtube.com/vi/$videoId/hqdefault.jpg";

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Thumbnail
              Image.network(ytThumb, fit: BoxFit.cover),

              // Blur overlay
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(color: Colors.black.withValues(alpha: 0.35)),
              ),

              // Lock badge
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0x14000000),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.lock, size: 14, color: Colors.white),
                      SizedBox(width: 6),
                      Text(
                        "SCHEDULED",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.schedule, color: Colors.white, size: 26),
                    const SizedBox(height: 6),
                    Text(
                      scheduledTime,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
                  color: Colors.black.withValues(alpha: 0.45),
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

class YouTubePlayerScreen extends StatefulWidget {
  final String videoId;

  const YouTubePlayerScreen({required this.videoId, super.key});

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
                  gradient: StarExploreScreen.accentGradient,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Color(0x14000000), blurRadius: 18),
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
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),

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
                gradient: StarExploreScreen.accentGradient,
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
    // Center(
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Container(
    //         width: 160,
    //         height: 160,
    //         decoration: BoxDecoration(
    //           gradient: StarExploreScreen.accentGradient,
    //           borderRadius: BorderRadius.circular(20),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.black.withOpacity(0.08),
    //               blurRadius: 18,
    //             ),
    //           ],
    //         ),
    //         child: const Icon(
    //           Icons.construction,
    //           size: 72,
    //           color: Colors.white,
    //         ),
    //       ),
    //       const SizedBox(height: 20),
    //       const Text(
    //         'AI Avatar feature coming soon ✨',
    //         style: TextStyle(
    //           fontSize: 16,
    //           fontWeight: FontWeight.w600,
    //           color: Colors.white,
    //         ),
    //       ),
    //       const SizedBox(height: 8),
    //       const Text(
    //         'We are working to bring more creative tools for creators.',
    //         textAlign: TextAlign.center,
    //         style: TextStyle(color: Colors.black54),
    //       ),
    //     ],
    //   ),
    // );
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          gradient.createShader(Rect.fromLTWH(0, 0, size, size)),
      child: Icon(icon, size: size, color: Colors.white),
    );
  }
}
