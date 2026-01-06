import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:harmanapp/splashScreen/splashscreen.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

// Wrap the app with a ValueListenableBuilder so the ThemeMode can be
// changed at runtime by updating `themeNotifier.value`.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: currentMode,
          home: Splashscreen(),
        );
      },
    );
  }
}
