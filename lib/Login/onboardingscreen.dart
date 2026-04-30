import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Login/basicinfo_screen.dart';
import 'package:harmanapp/Login/register_screen.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class OnBoardingscreen extends StatelessWidget {
  const OnBoardingscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo placeholder
                  SizedBox(height: 40),
                  SizedBox(
                    height: 280,
                    width: 280,
                    child: Image(image: AssetImage('assets/App_logo_2.jpeg')),
                  ),

                  SizedBox(height: 40),
                  Text(
                    'Experience the Life Journey\nof the Stars',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cinzel(color: kgoldColor, fontSize: 24),

                    // style: TextStyle(
                    //   color: kgoldColor,
                    //   fontSize: 24,
                    //   fontFamily: 'Cinzel', // Use a stylish font if available
                    //   fontWeight: FontWeight.w400,
                    // ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'My Autobiography turns every iconic personalities\' life journeys, experience, memories, and wisdom into an AI-powered digital persona that can live, speak, and interact forever.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: kwhiteColor,
                      fontSize: 12,
                    ),

                    // style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      style:
                          ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            backgroundColor: null,
                            padding: EdgeInsets.zero,
                            elevation: 6, // Remove default color
                          ).copyWith(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                  (states) => null,
                                ),
                            foregroundColor: MaterialStateProperty.all(
                              Colors.black,
                            ),
                          ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFFFE082), kgoldColor],
                          ),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Join for Early Access',
                            style: GoogleFonts.poppins(
                              color: kblackColor,
                              fontSize: 18,
                            ),
                            // style: TextStyle(
                            //   color: Colors.black87,
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 18,
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
