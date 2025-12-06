import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harmanapp/SignupScreen.dart';
import 'package:harmanapp/basicinfo_screen.dart';
import 'package:flutter/gestures.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(child: Container(height: 1, color: Colors.white24)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("OR", style: TextStyle(color: Colors.white60)),
                  ),
                  Expanded(child: Container(height: 1, color: Colors.white24)),
                ],
              ),

              const SizedBox(height: 30),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     _SocialIcon(icon: Icons.apple),
              //     // _SocialIcon(icon: FontAwesomeIcons.google, size: 22),
              //     SocialIcon(
              //       child: Image.asset(
              //         'assets/google1.png',
              //         width: 30,
              //         height: 30,
              //       ),
              //     ),
              //     SocialIcon(
              //       child: Image.asset(
              //         'assets/facebook.png',
              //         width: 30,
              //         height: 30,
              //       ),
              //     ),

              //     // _SocialIcon(icon: FontAwesomeIcons.facebookF, size: 22),
              //     _SocialIcon(icon: FontAwesomeIcons.xTwitter, size: 22),
              //     _SocialIcon(icon: FontAwesomeIcons.twitch, size: 22),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialIcon(child: Icon(Icons.apple, color: Colors.white)),

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
              const Spacer(),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(color: Colors.white70),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: const TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Signupscreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
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

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const _SocialIcon({required this.icon, this.size = 26});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, size: size, color: Colors.white),
    );
  }
}
