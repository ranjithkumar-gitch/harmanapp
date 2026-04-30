import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class LegacyCountdownScreen extends StatefulWidget {
  const LegacyCountdownScreen({Key? key}) : super(key: key);

  @override
  State<LegacyCountdownScreen> createState() => _LegacyCountdownScreenState();
}

class _LegacyCountdownScreenState extends State<LegacyCountdownScreen> {
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

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // Logo and figure (replace with your asset if available)
                SizedBox(
                  height: 280,
                  width: 280,
                  child: Image.asset('assets/App_logo_2.jpeg'),
                ),

                const SizedBox(height: 40),
                Text(
                  'Your legacy begins in\n90 days',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cinzel(color: kgoldColor, fontSize: 24),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTimeBox('$days', 'Days'),
                    const SizedBox(width: 12),
                    _buildTimeBox('$hours', 'Hours'),
                    const SizedBox(width: 12),
                    _buildTimeBox('$minutes', 'Min'),
                    const SizedBox(width: 12),
                    _buildTimeBox('$seconds', 'Sec'),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close, color: kgoldColor, size: 28),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeBox(String value, String label) {
    return Container(
      width: 70,
      height: 80,
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
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),

            // style: const TextStyle(
            //   fontSize: 32,
            //   fontWeight: FontWeight.bold,
            //   color: Colors.black,
            // ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(color: kblackColor, fontSize: 16),
            // style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
