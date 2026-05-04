import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Login/onboardingscreen.dart';
import 'package:video_player/video_player.dart';
import 'package:harmanapp/api_services/request_as_star_service.dart';
import 'package:harmanapp/api_services/app_shared_preferences.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:harmanapp/Login/star_request_submitted_screen.dart';

class RequestAsStarScreen extends StatefulWidget {
  const RequestAsStarScreen({Key? key}) : super(key: key);

  @override
  State<RequestAsStarScreen> createState() => _RequestAsStarScreenState();
}

class _RequestAsStarScreenState extends State<RequestAsStarScreen> {
  late VideoPlayerController _videoController;
  bool _isVideoInitialized = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.asset('assets/sources/videos/7.mp4')
          ..initialize().then((_) {
            setState(() {
              _isVideoInitialized = true;
            });
          });
    _videoController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  bool showInfo = true;

  void _onRequest() async {
    // Terms and conditions validation removed as per request
    // Get stargazerId from shared preferences
    final stargazerId = await SharedPrefServices.getStargazerId();
    if (stargazerId == null || stargazerId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Stargazer ID not found.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final resp = await RequestAsStarService.requestAsStar(
      stargazerId: stargazerId,
    );
    if (resp.statusCode == 201 && resp.success) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => StarRequestSubmittedScreen(
            onExplore: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(resp.message ?? 'Request failed'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/bg2.PNG', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 10.0,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  // Back Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const OnBoardingscreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.7),
                              border: Border.all(color: kgoldColor, width: 2),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.close,
                                color: kgoldColor,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // const SizedBox(height: 40),

                  // Top title
                  Text(
                    'What It Means to Be a Star',
                    style: GoogleFonts.cinzel(
                      color: kgoldColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Video preview with play/pause controls and gold border
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(color: kgoldColor, width: 1),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: _isVideoInitialized
                              ? AspectRatio(
                                  aspectRatio:
                                      _videoController.value.aspectRatio,
                                  child: VideoPlayer(_videoController),
                                )
                              : Container(
                                  color: Colors.black12,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: kgoldColor,
                                    ),
                                  ),
                                ),
                        ),
                        if (_isVideoInitialized)
                          Positioned(
                            bottom: 12,
                            left: 16,
                            right: 16,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _formatDuration(
                                        _videoController.value.position,
                                      ),
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      _formatDuration(
                                        _videoController.value.duration,
                                      ),
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Container(
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: FractionallySizedBox(
                                      widthFactor:
                                          _videoController
                                                  .value
                                                  .duration
                                                  .inMilliseconds ==
                                              0
                                          ? 0
                                          : _videoController
                                                    .value
                                                    .position
                                                    .inMilliseconds /
                                                _videoController
                                                    .value
                                                    .duration
                                                    .inMilliseconds,

                                      // child: Container(
                                      //   height: 0.1,
                                      //   decoration: BoxDecoration(
                                      //     color: kgoldColor,
                                      //     borderRadius: BorderRadius.circular(
                                      //       2,
                                      //     ),
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (_isVideoInitialized)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_videoController.value.isPlaying) {
                                  _videoController.pause();
                                } else {
                                  _videoController.play();
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                _videoController.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: kgoldColor,
                                size: 48,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),
                  // Main headline
                  Text(
                    'Turn Your Life Into\na Living Legacy.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cinzel(
                      color: kgoldColor,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Be remembered. Be experienced.\nBe timeless.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Gold star divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 1.5,
                          color: kgoldColor.withOpacity(0.5),
                        ),
                      ),
                      Icon(Icons.star, color: kgoldColor, size: 22),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 8),
                          height: 1.5,
                          color: kgoldColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Create your digital legacy and\nshare your story with the world.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 60),

                  // Gold button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _onRequest,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.zero,
                        elevation: 8,
                        backgroundColor: kgoldColor,
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          // gradient: const LinearGradient(
                          //   colors: [kgoldColor, Color(0xFFFFE082)],
                          // ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 52,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Request to Join as Star',
                                style: GoogleFonts.poppins(
                                  color: kblackColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(Icons.arrow_forward, color: kblackColor),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Applications are limited. Selection-based access.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
