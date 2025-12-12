// Profile Page
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String assetPath;
  const ProfilePage({Key? key, required this.assetPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Hero(
          tag: assetPath,
          child: Image.asset(
            "assets/sources/profiles/$assetPath",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
