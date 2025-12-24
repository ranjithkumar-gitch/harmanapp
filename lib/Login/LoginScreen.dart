import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harmanapp/Login/SignupScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:harmanapp/Dashboard/mainscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  double fontsize = 18;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _emailFocus.addListener(() => setState(() {}));
    _passwordFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool emailGold =
        _emailController.text.isNotEmpty || _emailFocus.hasFocus;

    final bool passwordGold =
        _passwordController.text.isNotEmpty || _passwordFocus.hasFocus;

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

                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Harman App',
                          style: GoogleFonts.greatVibes(
                            textStyle: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF5D778),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
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

                  // EMAIL FIELD
                  TextField(
                    controller: _emailController,
                    focusNode: _emailFocus,
                    onChanged: (_) => setState(() {}),
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: const TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: const Color(0xFF1A1A1A),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: emailGold
                              ? const Color(0xFFF5D778)
                              : Colors.white,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFF5D778),
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Password *",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),

                  // PASSWORD FIELD
                  TextField(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    obscureText: _obscureText,
                    onChanged: (_) => setState(() {}),
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: const TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: const Color(0xFF1A1A1A),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: passwordGold
                              ? const Color(0xFFF5D778)
                              : Colors.white,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFF5D778),
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xFFF5D778),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
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
                        Get.to(
                          () => MainScreen(),
                          transition: Transition.zoom,
                          duration: const Duration(seconds: 1),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: const Color(0xFFF5D778),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: const BorderSide(
                            color: Color(0xFFF5D778),
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: const Color(0xFFF5D778),
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
                      SocialIcon(
                        child: Image.asset(
                          'assets/google1.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
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
                              color: Color(0xFFF5D778),
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
