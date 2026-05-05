import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Login/register_screen.dart';
import 'package:harmanapp/constants/colors.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingscreen extends StatelessWidget {
  const OnBoardingscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Responsive background image
          Positioned.fill(
            child: Image.asset('assets/bg_1411.PNG', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      // Gold figure with concentric circles
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.98,
                        width: MediaQuery.of(context).size.width * 0.98,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Concentric circles
                            // CustomPaint(
                            //   size: Size(
                            //     MediaQuery.of(context).size.width * 0.9,
                            //     MediaQuery.of(context).size.width * 0.9,
                            //   ),
                            //   // painter: _ConcentricCirclesPainter(),
                            // ),
                            // Gold figure image (replace with your asset)
                            Image.asset(
                              'assets/logo_4k.png',
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),

                      // Main headline
                      Text(
                        'A NEW ERA OF',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2,
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            goldTextGradient.createShader(bounds),
                        child: Text(
                          'HUMAN STORIES',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      Text(
                        'IS ABOUT TO BEGIN.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            goldTextGradient.createShader(bounds),
                        child: Text(
                          'Join early. Be part of what\'s coming next.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Early access note
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.group_outlined,
                              size: 30,
                              color: Color(0xffc18e3b),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) =>
                                      goldTextGradient.createShader(bounds),
                                  child: Text(
                                    'EARLY ACCESS IS LIMITED.',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                ShaderMask(
                                  shaderCallback: (bounds) =>
                                      goldTextGradient.createShader(bounds),
                                  child: Text(
                                    'THOUSANDS ARE ALREADY JOINING.',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      // Gold button
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
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.zero,
                            elevation: 8,
                            backgroundColor: kgoldColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'SECURE MY SPOT',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Icon(
                                Icons.chevron_right,
                                size: 25,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Footer note
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shield_outlined,
                            color: Color(0xffc18e3b),
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'NO SPAM. PRIORITY ACCESS WHEN WE LAUNCH.',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for concentric gold circles
//
