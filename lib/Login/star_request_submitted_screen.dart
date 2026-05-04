import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Login/onboardingscreen.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class StarRequestSubmittedScreen extends StatelessWidget {
  final VoidCallback? onExplore;
  const StarRequestSubmittedScreen({Key? key, this.onExplore})
    : super(key: key);

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
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Checkma const SizedBox(height: 16),
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
                  const SizedBox(height: 56),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: kgoldColor, width: 2),
                    ),
                    child: Icon(Icons.star, color: kgoldColor, size: 54),
                  ),
                  const SizedBox(height: 32),
                  // Title
                  Text(
                    'Your Journey\nHas Begun.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cinzel(
                      color: kgoldColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
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
                  const SizedBox(height: 24),
                  // Star Request Submitted
                  Text(
                    'Star Request Submitted.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cinzel(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Your request to become a Star has been successfully submitted.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 1.5,
                    width: 60,
                    color: kgoldColor.withOpacity(0.5),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Our team is reviewing your profile.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // User icon
                  const SizedBox(height: 18),
                  Text(
                    'If selected, your story could be experienced by audiences across the world.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'You\'ll hear from us soon.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: kgoldColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Explore as Stargazer box
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
