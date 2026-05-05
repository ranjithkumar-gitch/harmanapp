import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Login/onboardingscreen.dart';

import 'package:harmanapp/Login/request_as_star_screen.dart';
import 'package:harmanapp/constants/colors.dart';
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/bg_1411.PNG', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
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
                                    builder: (context) =>
                                        const OnBoardingscreen(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.7),
                                  border: Border.all(
                                    color: kgoldColor,
                                    width: 2,
                                  ),
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
                      const SizedBox(height: 16),
                      // Logo
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.98,
                        width: MediaQuery.of(context).size.width * 0.98,
                        child: Image.asset('assets/logo_4k.png'),
                      ),
                      const SizedBox(height: 4),
                      // Welcome text
                      // Text(
                      //   "You're in, welcome to early access",
                      //   textAlign: TextAlign.center,
                      //   style: GoogleFonts.cinzel(
                      //     color: kgoldColor,
                      //     fontSize: 22,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            goldTextGradient.createShader(bounds),
                        child: Text(
                          "You're in, welcome to early access",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cinzel(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Divider with star
                      _GoldStarDivider(),
                      const SizedBox(height: 18),
                      // Welcome message
                      Text(
                        welcomeName.isNotEmpty
                            ? "Welcome to $welcomeName, the world's first living legacy platform"
                            : "Welcome to the world's first living legacy platform",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: kwhiteColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Stargazer message
                      // Text(
                      //   'You are now a Stargazer',
                      //   textAlign: TextAlign.center,
                      //   style: GoogleFonts.cinzel(
                      //     color: kgoldColor,
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            goldTextGradient.createShader(bounds),
                        child: Text(
                          'You are now a Stargazer',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cinzel(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Divider with star
                      _GoldStarDivider(),
                      const SizedBox(height: 18),
                      // 90 days timer inline
                      _InlineLegacyCountdown(),
                      const SizedBox(height: 28),
                      // Request to join as star button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RequestAsStarScreen(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              side: const BorderSide(
                                color: kgoldColor,
                                width: 2,
                              ),
                              padding: EdgeInsets.zero,
                              foregroundColor: kgoldColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text(
                                //   'Request to Join as Star',
                                //   style: GoogleFonts.poppins(
                                //     color: kgoldColor,
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                ShaderMask(
                                  shaderCallback: (bounds) =>
                                      goldTextGradient.createShader(bounds),
                                  child: Text(
                                    'Request to Join as Star',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Icon(
                                  Icons.chevron_right,
                                  color: kgoldColor,
                                  size: 22,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Limited approvals note
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          'Applications are limited. Selection-based access.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: kgoldColor,
                            fontSize: 13,
                          ),
                        ),
                      ),
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

// Gold divider with star widget
class _GoldStarDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

// Inline 90 days timer widget
class _InlineLegacyCountdown extends StatefulWidget {
  @override
  State<_InlineLegacyCountdown> createState() => _InlineLegacyCountdownState();
}

class _InlineLegacyCountdownState extends State<_InlineLegacyCountdown> {
  late DateTime targetDate;
  late Timer _timer;
  Duration _remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    targetDate = DateTime.now().add(const Duration(days: 90));
    _updateRemaining();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _updateRemaining(),
    );
  }

  void _updateRemaining() {
    final now = DateTime.now();
    setState(() {
      _remaining = targetDate.difference(now);
      if (_remaining.isNegative) {
        _remaining = Duration.zero;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = _remaining.inDays;
    final hours = _remaining.inHours % 24;
    final minutes = _remaining.inMinutes % 60;
    final seconds = _remaining.inSeconds % 60;
    return Column(
      children: [
        // Text(
        //   'Your legacy begins in:',
        //   style: GoogleFonts.poppins(
        //     color: kgoldColor,
        //     fontSize: 16,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        ShaderMask(
          shaderCallback: (bounds) => goldTextGradient.createShader(bounds),
          child: Text(
            'Your legacy begins in:',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTimeBox('$days', 'Days'),
            const SizedBox(width: 10),
            _buildTimeBox('$hours', 'Hours'),
            const SizedBox(width: 10),
            _buildTimeBox('$minutes', 'Min'),
            const SizedBox(width: 10),
            _buildTimeBox('$seconds', 'Sec'),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeBox(String value, String label) {
    return Container(
      width: 60,
      height: 70,
      decoration: BoxDecoration(
        color: kgoldColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.shade700.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: GoogleFonts.poppins(
              color: kblackColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(color: kblackColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
