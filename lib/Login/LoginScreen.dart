import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harmanapp/Login/SignupScreen.dart';

import 'package:flutter/gestures.dart';
import 'package:harmanapp/Dashboard/mainscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  double fontsize = 18;
  bool first = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  const Center(
                    child: Column(
                      children: [
                        Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Welcome back",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    "Email *",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),

                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: const TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: const Color(0xFF1A1A1A),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFFFFFFF),
                          width: 2,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Password *",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),

                  TextField(
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: const TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: const Color(0xFF1A1A1A),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFFFFFFF),
                          width: 2,
                        ),
                      ),
                      suffixIcon: const Icon(
                        Icons.visibility_off,
                        color: Colors.white38,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.white54),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // setState(() {
                        //   fontsize = first ? 18 : 10;
                        //   first = !first;
                        // });

                        Get.to(
                          () => MainScreen(),
                          transition: Transition.zoom,
                          duration: const Duration(seconds: 1),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFFFFF),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: fontsize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: Container(height: 1, color: Colors.white24),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "OR",
                          style: TextStyle(color: Colors.white60),
                        ),
                      ),
                      Expanded(
                        child: Container(height: 1, color: Colors.white24),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Apple login tapped");
                        },
                        child: SocialIcon(
                          child: Icon(Icons.apple, color: Colors.white),
                        ),
                      ),
                      SocialIcon(
                        child: Image.asset(
                          'assets/google1.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SocialIcon(
                        child: Image.asset(
                          'assets/facebook.png',
                          width: 26,
                          height: 26,
                        ),
                      ),
                      SocialIcon(
                        child: Icon(
                          FontAwesomeIcons.xTwitter,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                      SocialIcon(
                        child: Icon(
                          FontAwesomeIcons.twitch,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(color: Colors.white70),
                        children: [
                          TextSpan(
                            text: "Sign up",
                            style: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Signupscreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final Widget child;
  final double size;

  const SocialIcon({super.key, required this.child, this.size = 26});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 24,
      height: size + 24,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
