import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/api_services/request_as_star_service.dart';
import 'package:harmanapp/api_services/app_shared_preferences.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class RequestAsStarScreen extends StatefulWidget {
  const RequestAsStarScreen({Key? key}) : super(key: key);

  @override
  State<RequestAsStarScreen> createState() => _RequestAsStarScreenState();
}

class _RequestAsStarScreenState extends State<RequestAsStarScreen> {
  bool showInfo = true;
  bool agreed = false;

  void _showRequestDialog() async {
    await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Request Submitted'),
        content: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            'Your request has been submitted successfully.',
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _onRequest() async {
    if (!agreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept the Terms of Service.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    // Get stargazerId from shared preferences
    final stargazerId = await SharedPrefServices.getStargazerId();
    if (stargazerId == null || stargazerId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Stargazer ID not found.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final resp = await RequestAsStarService.requestAsStar(
      stargazerId: stargazerId,
    );
    if (resp.statusCode == 201 && resp.success) {
      _showRequestDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(resp.message ?? 'Request failed'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/App_logo_2.jpeg', // Replace with your asset
              fit: BoxFit.cover,
            ),
          ),
          // Overlay
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),
          // Main content
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.help_outline, color: kgoldColor),
                      onPressed: () {
                        setState(() {
                          showInfo = !showInfo;
                        });
                      },
                    ),
                  ],
                ),
                if (showInfo) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Autobiography turns every iconic personalities' life journeys, experience, memories, and wisdom into an AI-powered digital persona that can live, speak, and interact forever.",
                          style: GoogleFonts.poppins(
                            color: kwhiteColor,
                            fontSize: 14,
                          ),
                          // style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "My Autobiography turns every iconic personalities' life journeys, experience, memories, and wisdom into an AI-powered digital persona that can live, speak, and interact forever.",
                          style: GoogleFonts.poppins(
                            color: kwhiteColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "My Autobiography turns every iconic personalities' life journeys, experience, memories, and wisdom into an AI-powered digital persona that can live, speak, and interact forever.",
                          style: GoogleFonts.poppins(
                            color: kwhiteColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Checkbox(
                              value: agreed,
                              onChanged: (val) {
                                setState(() {
                                  agreed = val ?? false;
                                });
                              },
                              activeColor: kgoldColor,
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: GoogleFonts.poppins(
                                    color: kwhiteColor,
                                    fontSize: 12,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text:
                                          'By clicking this box, I agree to the Harman app creator ',
                                    ),
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: const TextStyle(
                                        color: kgoldColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                      // Add gesture recognizer if you want to open link
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 24,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _onRequest,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kgoldColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Request As Star',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
