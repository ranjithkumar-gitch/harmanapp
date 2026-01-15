import 'package:flutter/material.dart';
import 'package:harmanapp/star_module/MyAccount/legacy_formpage.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class Legacy extends StatelessWidget {
  const Legacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Brightness.dark == Theme.of(context).brightness
          ? kblackColor
          : kwhiteColor,

      appBar: AppBar(
        backgroundColor: Brightness.dark == Theme.of(context).brightness
            ? kblackColor
            : kwhiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Brightness.dark == Theme.of(context).brightness
                ? kwhiteColor
                : kblackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Legacy",
          style: TextStyle(
            color: Brightness.dark == Theme.of(context).brightness
                ? kwhiteColor
                : kblackColor,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LegacyFormPage()),
              );
            },
            icon: Icon(
              Icons.add,
              color: Brightness.dark == Theme.of(context).brightness
                  ? kwhiteColor
                  : kblackColor,
            ),
            label: Text(
              "Add New",
              style: TextStyle(
                color: Brightness.dark == Theme.of(context).brightness
                    ? kwhiteColor
                    : kblackColor,
              ),
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
