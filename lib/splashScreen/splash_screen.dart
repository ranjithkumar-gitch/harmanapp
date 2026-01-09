import 'package:flutter/material.dart';
import 'package:harmanapp/Login/login_screen.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  // @override
  // void initState() {
  //   super.initState();

  //   _controller = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 2),
  //   );

  //   _scaleAnimation = Tween<double>(
  //     begin: 0.2,
  //     end: 1.0,
  //   ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

  //   _controller.forward();

  //   Future.delayed(const Duration(seconds: 3), () {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const Loginscreen()),
  //     );
  //   }
  //   );
  // }
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return; // ✅ check if widget is still in tree

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Loginscreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblackColor,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 450,
                height: 450,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,

                  image: DecorationImage(
                    image: AssetImage('assets/App_logo1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
