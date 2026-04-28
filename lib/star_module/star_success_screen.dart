import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class StarSuccessScreen extends StatefulWidget {
  const StarSuccessScreen({super.key});

  @override
  State<StarSuccessScreen> createState() => _StarSuccessScreenState();
}

class _StarSuccessScreenState extends State<StarSuccessScreen> {
  final TextEditingController _codeController = TextEditingController();

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
              Image.asset('assets/App_logo_2.jpeg', width: 180, height: 180),
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
                    const SizedBox(width: 2),
                    const Expanded(
                      child: Text(
                        'Star registrations on invitation only',
                        textAlign: TextAlign.center,
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
              SizedBox(height: 10),
              const Text(
                'On Invitation',
                style: TextStyle(
                  color: kgoldColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'If you have Star invitation access code, please enter',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _codeController,
                decoration: InputDecoration(
                  hintText: 'Enter access code',
                  hintStyle: const TextStyle(color: Colors.white38),
                  filled: true,
                  fillColor: Color(0xFF232323),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kgoldColor, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kgoldColor, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kgoldColor, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kgoldColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text(
                        'Invalid access code',
                        style: TextStyle(
                          color: kgoldColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Re-check and try again.',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              color: kgoldColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Validate',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.black,
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 32,
              //       vertical: 14,
              //     ),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8),
              //       side: const BorderSide(color: kgoldColor, width: 2),
              //     ),
              //     elevation: 4,
              //   ),
              //   onPressed: () {
              //     Navigator.of(context).popUntil((route) => route.isFirst);
              //   },
              //   child: const Text(
              //     'Close',
              //     style: TextStyle(
              //       color: kgoldColor,
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
