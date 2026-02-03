import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Login/login_screen.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

Widget starendDrawer(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.5,
    child: Drawer(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? kblackColor
          : kwhiteColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? kblackColor
                  : kwhiteColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(
                  height: 140,
                  width: 140,
                  child: Image(image: AssetImage('assets/app_logo2.png')),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Settings',
              style: GoogleFonts.poppins(
                color: Theme.of(context).brightness == Brightness.dark
                    ? kwhiteColor
                    : kblackColor,
                fontSize: 14,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Privacy & Policy',
              style: GoogleFonts.poppins(
                color: Theme.of(context).brightness == Brightness.dark
                    ? kwhiteColor
                    : kblackColor,
                fontSize: 14,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Terms & Conditions',
              style: GoogleFonts.poppins(
                color: Theme.of(context).brightness == Brightness.dark
                    ? kwhiteColor
                    : kblackColor,
                fontSize: 14,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              final isDark = Theme.of(context).brightness == Brightness.dark;

              showCupertinoDialog(
                context: context,
                builder: (_) => CupertinoTheme(
                  data: CupertinoThemeData(
                    brightness: isDark ? Brightness.dark : Brightness.light,
                    primaryColor: kgoldColor,
                  ),
                  child: CupertinoAlertDialog(
                    title: const Text(
                      "Logout",
                      style: TextStyle(color: kgoldColor),
                    ),
                    content: Text(
                      "Are you sure you want to logout?",
                      style: TextStyle(
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: isDark ? kwhiteColor : kblackColor,
                          ),
                        ),
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Loginscreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Logout",
                          style: TextStyle(color: kgoldColor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: ListTile(
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? kwhiteColor
                      : kblackColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),

          Divider(
            color: Theme.of(context).brightness == Brightness.dark
                ? kgreyColor
                : kgreyColor,
          ),
          ListTile(
            title: Text(
              'Light Mode',
              style: GoogleFonts.poppins(
                color: Theme.of(context).brightness == Brightness.dark
                    ? kwhiteColor
                    : kblackColor,
                fontSize: 14,
              ),
            ),
            trailing: ValueListenableBuilder(
              valueListenable: themeNotifier,
              builder: (context, ThemeMode mode, _) {
                final isDark = mode == ThemeMode.dark;
                return Switch(
                  value: isDark,
                  activeThumbColor: kgoldColor,
                  onChanged: (v) {
                    themeNotifier.value = v ? ThemeMode.dark : ThemeMode.light;
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
