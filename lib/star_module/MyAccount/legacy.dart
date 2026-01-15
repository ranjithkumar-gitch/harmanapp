import 'package:flutter/material.dart';
import 'package:harmanapp/star_module/MyAccount/legacy_formpage.dart';
import 'package:harmanapp/star_module/widgets/star_theme_notifier.dart';

class Legacy extends StatelessWidget {
  const Legacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblackColor,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kwhiteColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Legacy", style: TextStyle(color: kwhiteColor)),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LegacyFormPage()),
              );
            },
            icon: const Icon(Icons.add, color: kwhiteColor),
            label: const Text("Add New", style: TextStyle(color: kwhiteColor)),
          ),
        ],
        centerTitle: true,
      ),

      /// BODY WITH FULL IMAGE
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// BACKGROUND IMAGE
          Image.asset(
            "assets/sources/profiles/timeline.jpeg",
            fit: BoxFit.cover,
          ),

          /// DARK OVERLAY (for readability)
          Container(color: Colors.black.withOpacity(0.35)),

          /// OPTIONAL CONTENT
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.history, color: kgoldColor, size: 60),
                SizedBox(height: 12),
                Text(
                  "Your Legacy Timeline",
                  style: TextStyle(
                    color: kgoldColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
