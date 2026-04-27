import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api_services/shared_pref_helper.dart';
import '../widgets/theme_notifier.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  String? name;

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    final firstName = await SharedPrefHelper.getFirstName();
    final lastName = await SharedPrefHelper.getLastName();
    setState(() {
      name = (firstName ?? '') + ' ' + (lastName ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/App_logo_2.jpeg', width: 280, height: 280),
              // const SizedBox(height: 16),
              // Text(
              //   'My Autobiography',
              //   style: GoogleFonts.greatVibes(
              //     textStyle: const TextStyle(
              //       fontSize: 32,
              //       fontWeight: FontWeight.bold,
              //       color: kgoldColor,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 24),
              if (name != null && name!.trim().isNotEmpty)
                Text(
                  'Hello $name!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  children: [
                    TextSpan(
                      text:
                          'You have successfully registered to the early access of ',
                    ),
                    TextSpan(
                      text: 'My Autobiography',
                      style: TextStyle(
                        color: kgoldColor,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: kgoldColor.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kgoldColor.withValues(alpha: 0.08),
                      blurRadius: 12,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: kgoldColor,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'You will get notified once full access is available.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: kgoldColor,
                      width: 2,
                    ), // Gold border
                  ),
                  elevation: 4,
                ),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text(
                  'Close',
                  style: TextStyle(
                    color: kgoldColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
