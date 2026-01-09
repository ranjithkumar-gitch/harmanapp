import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kblackColor : kwhiteColor,
      appBar: AppBar(
        backgroundColor: isDark ? kblackColor : kwhiteColor,
        elevation: 0,
        title: Text(
          "My Memberships",
          style: TextStyle(
            color: isDark ? kwhiteColor : kblackColor,
            fontFamily: "Gilroy",
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: isDark ? kwhiteColor : kblackColor),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          membershipCard(
            context: context,
            image: "assets/sources/profiles/averie-woodard.jpg",
            creatorName: "Alex Star",
            plan: "Monthly",
            price: "\$9.99",
            tierColor: kgoldColor,
            onUnsubscribe: () => _showUnsubscribeDialog(context),
          ),
          membershipCard(
            context: context,
            image: "assets/sources/profiles/aiony-haust.jpg",
            creatorName: "Sophia Ray",
            plan: "Yearly",
            price: "\$99.99",
            tierColor: CupertinoColors.systemGrey,
            onUnsubscribe: () => _showUnsubscribeDialog(context),
          ),
          membershipCard(
            context: context,
            image: "assets/sources/profiles/azamat-zhanisov-.jpg",
            creatorName: "Mark Vibe",
            plan: "Weekly",
            price: "\$4.99",
            tierColor: CupertinoColors.systemBrown,
            onUnsubscribe: () => _showUnsubscribeDialog(context),
          ),
        ],
      ),
    );
  }

  /// 🔔 Confirmation dialog
  void _showUnsubscribeDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoTheme(
        data: CupertinoThemeData(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primaryColor: kgoldColor,
        ),
        child: CupertinoAlertDialog(
          title: const Text("Unsubscribe", style: TextStyle(color: kgoldColor)),
          content: Text(
            "Are you sure you want to unsubscribe?",
            style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Unsubscribe",
                style: TextStyle(color: kgoldColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget membershipCard({
  required BuildContext context,
  required String image,
  required String creatorName,
  required String plan,
  required String price,
  required Color tierColor,
  required VoidCallback onUnsubscribe,
}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: isDark ? kblackColor : kwhiteColor,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: tierColor, width: 1.8),
    ),
    child: Row(
      children: [
        /// 📸 Image
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: -8,
              right: -8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isDark ? kblackColor : kwhiteColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: tierColor),
                ),
                child: Icon(Icons.star, size: 14, color: tierColor),
              ),
            ),
          ],
        ),

        const SizedBox(width: 14),

        /// 📝 Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                creatorName,
                style: TextStyle(
                  color: isDark ? kwhiteColor : kblackColor,
                  fontSize: 16,
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  _badge(plan, tierColor),
                  const SizedBox(width: 8),
                  _priceBadge(price, tierColor),
                ],
              ),
            ],
          ),
        ),

        /// 🚫 Unsubscribe
        OutlinedButton(
          onPressed: onUnsubscribe,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: tierColor),
            foregroundColor: tierColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text("Unsubscribe", style: TextStyle(fontSize: 12)),
        ),
      ],
    ),
  );
}

Widget _badge(String text, Color color) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: color),
  ),
  child: Text(
    text,
    style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600),
  ),
);

Widget _priceBadge(String text, Color color) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: color.withOpacity(0.15),
    border: Border.all(color: color),
  ),
  child: Text(
    text,
    style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
  ),
);
