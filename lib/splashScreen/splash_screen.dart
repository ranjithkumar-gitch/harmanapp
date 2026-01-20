import 'package:flutter/material.dart';
import 'package:harmanapp/Login/login_screen.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});

//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }

// class _SplashscreenState extends State<Splashscreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );

//     _scaleAnimation = Tween<double>(
//       begin: 0.2,
//       end: 1.0,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

//     _controller.forward();

//     Future.delayed(const Duration(seconds: 3), () {
//       if (!mounted) return; // ✅ check if widget is still in tree

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const Loginscreen()),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kblackColor,
//       body: Center(
//         child: ScaleTransition(
//           scale: _scaleAnimation,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 width: 450,
//                 height: 450,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,

//                   image: DecorationImage(
//                     image: AssetImage('assets/App_logo1.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  late VideoPlayerController _videoController;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    _videoController =
        VideoPlayerController.asset('assets/sources/videos/splashscreen.mp4')
          ..initialize().then((_) {
            if (!mounted) return;
            setState(() {});
            _videoController
              ..setLooping(false)
              ..setVolume(1.0) // mute splash
              ..play();
          });

    // Navigate exactly when video ends
    _videoController.addListener(_videoListener);
  }

  void _videoListener() {
    if (_navigated) return;

    final value = _videoController.value;
    if (value.isInitialized &&
        value.position >= value.duration &&
        !value.isPlaying) {
      _navigated = true;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Loginscreen()),
      );
    }
  }

  @override
  void dispose() {
    _videoController.removeListener(_videoListener);
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // hides green frame
      body: Center(
        child: _videoController.value.isInitialized
            ? Container(
                color: Colors.black, // extra safety
                width: 550,
                height: 550,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _videoController.value.size.width,
                    height: _videoController.value.size.height,
                    child: VideoPlayer(_videoController),
                  ),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
