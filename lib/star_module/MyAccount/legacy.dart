import 'package:flutter/material.dart';
import 'package:harmanapp/star_module/MyAccount/legacy_formpage.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class Legacy extends StatelessWidget {
  const Legacy({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? kblackColor : kwhiteColor,
      appBar: AppBar(
        backgroundColor: isDark ? kblackColor : kwhiteColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? kwhiteColor : kblackColor,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Legacy",
          style: TextStyle(
            color: isDark ? kwhiteColor : kblackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LegacyFormPage()),
                );
              },
              style: TextButton.styleFrom(
                side: const BorderSide(color: kgoldColor, width: 1.5),
                foregroundColor: kgoldColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: Icon(Icons.add, color: kgoldColor),
              label: Text("Add New", style: TextStyle(color: kgoldColor)),
            ),
          ),
        ],
        centerTitle: true,
      ),

      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/sources/profiles/timeline.jpeg",
            fit: BoxFit.cover,
          ),

          Container(color: Colors.black.withOpacity(0.35)),
        ],
      ),
    );
  }
}
