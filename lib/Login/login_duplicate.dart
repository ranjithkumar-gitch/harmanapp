import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Login/signup_screen.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class LoginDuplicateScreen extends StatelessWidget {
  const LoginDuplicateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),

                  // Logo & Title
                  Column(
                    children: [
                      SizedBox(
                        height: 140,
                        width: 140,
                        child: Image.asset('assets/app_logo2.png'),
                      ),
                      Text(
                        'My Autobiography',
                        style: GoogleFonts.greatVibes(
                          textStyle: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: kgoldColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      // const Text(
                      //   "Welcome back",
                      //   style: TextStyle(color: kgreyColor, fontSize: 16),
                      // ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // Early bird registration card
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 28,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: kgoldColor.withValues(alpha: 0.5),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kgoldColor.withValues(alpha: 0.08),
                          blurRadius: 16,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.stars_rounded,
                          color: kgoldColor,
                          size: 40,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Early bird registrations are accepting now.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Click here to ',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: 'Register',
                                style: const TextStyle(
                                  color: kgoldColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                  decorationColor: kgoldColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const Signupscreen(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
