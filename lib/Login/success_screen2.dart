import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Login/legacy_countdown_screen.dart';
import 'package:harmanapp/Login/request_as_star_screen.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class SuccessScreen2 extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  const SuccessScreen2({Key? key, this.firstName, this.lastName})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String welcomeName =
        ((firstName ?? '').isNotEmpty || (lastName ?? '').isNotEmpty)
        ? '${firstName ?? ''} ${lastName ?? ''}'.trim()
        : '';
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Gold figure with concentric circles
              SizedBox(
                height: 280,
                width: 280,
                child: Image.asset('assets/App_logo_2.jpeg'),
              ),
              const SizedBox(height: 16),

              // Title and subtitle
              SizedBox(height: 32),
              // Experience the Life Journey of the Stars
              Text(
                'Experience the Life Journey\nof the Stars',
                textAlign: TextAlign.center,
                style: GoogleFonts.cinzel(color: kgoldColor, fontSize: 24),

                // style: TextStyle(
                //   color: kgoldColor,
                //   fontSize: 26,
                //   fontFamily: 'Cinzel',
                //   fontWeight: FontWeight.w500,
                // ),
              ),
              const SizedBox(height: 18),
              // Welcome message
              Text(
                welcomeName.isNotEmpty
                    ? 'Welcome to $welcomeName, the world\'s first living\nlegacy platform'
                    : "Welcome to the world's first living\nlegacy platform",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(color: kwhiteColor, fontSize: 16),

                // style: const TextStyle(
                //   color: Colors.white,
                //   fontSize: 16,
                //   fontWeight: FontWeight.w400,
                // ),
              ),
              const SizedBox(height: 18),
              // Application submitted message
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Your Star application has been submitted. You\'ll receive an email once your access is approved.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: kwhiteColor, fontSize: 12),

                  // style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
              const SizedBox(height: 36),
              // Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LegacyCountdownScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [kgoldColor, Color(0xFFFFE082)],
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: 48,
                            child: Text(
                              'Continue',
                              style: GoogleFonts.poppins(
                                color: kblackColor,
                                fontSize: 16,
                              ),

                              // style: TextStyle(
                              //   color: Colors.black87,
                              //   fontWeight: FontWeight.bold,
                              //   fontSize: 16,
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RequestAsStarScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [kgoldColor, Color(0xFFFFE082)],
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: 48,
                            child: Text(
                              'Join as Star',
                              style: GoogleFonts.poppins(
                                color: kblackColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
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
