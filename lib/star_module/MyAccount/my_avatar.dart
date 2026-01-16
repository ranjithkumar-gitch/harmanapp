import 'package:flutter/material.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class StarMyAvatar extends StatefulWidget {
  const StarMyAvatar({super.key});

  @override
  State<StarMyAvatar> createState() => _StarMyAvatarState();
}

class _StarMyAvatarState extends State<StarMyAvatar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kblackColor : kwhiteColor,
      appBar: AppBar(
        backgroundColor: isDark ? kblackColor : kwhiteColor,
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
          "My Avatar",
          style: TextStyle(
            color: isDark ? kwhiteColor : kblackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Text("asasd"),
    );
  }
}
