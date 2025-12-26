import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "My Memberships",
          style: TextStyle(
            color: Color(0xFFF5D778),
            fontFamily: "Gilroy",
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFF5D778)),
      ),
      body: ListView(
        children: [
          membershipCard(
            image: "assets/sources/profiles/averie-woodard.jpg",
            creatorName: "Alex Star",
            plan: "Monthly",
            price: "\$9.99",
            tierColor: const Color(0xFFF5D778),
            onUnsubscribe: () {
              _showUnsubscribeDialog(context);
            },
          ),

          membershipCard(
            image: "assets/sources/profiles/aiony-haust.jpg",
            creatorName: "Sophia Ray",
            plan: "Yearly",
            price: "\$99.99",
            tierColor: CupertinoColors.systemGrey,
            onUnsubscribe: () {
              _showUnsubscribeDialog(context);
            },
          ),

          membershipCard(
            image: "assets/sources/profiles/azamat-zhanisov-.jpg",
            creatorName: "Mark Vibe",
            plan: "Weekly",
            price: "\$4.99",
            tierColor: CupertinoColors.systemBrown,
            onUnsubscribe: () {
              _showUnsubscribeDialog(context);
            },
          ),
        ],
      ),
    );
  }

  /// 🔔 Confirmation dialog
  void _showUnsubscribeDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoTheme(
        data: const CupertinoThemeData(
          brightness: Brightness.dark,
          barBackgroundColor: Colors.black,
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Color(0xFFF5D778),
        ),
        child: CupertinoAlertDialog(
          title: const Text(
            "Unsubscribe",
            style: TextStyle(color: Color(0xFFF5D778)),
          ),
          content: const Text(
            "Are you sure you want to unsubscribe?",
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text(
                "Unsubscribe",
                style: TextStyle(color: Color(0xFFF5D778)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// =======================================================
/// 🧩 MEMBERSHIP CARD WIDGET
/// =======================================================

Widget membershipCard({
  required String image,
  required String creatorName,
  required String plan, // Monthly / Yearly / Weekly
  required String price, // $9.99 / $99.99 etc
  required Color tierColor,
  required VoidCallback onUnsubscribe,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: CupertinoColors.darkBackgroundGray,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: tierColor, width: 1.8),
    ),
    child: Row(
      children: [
        /// 📸 Image + star
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
                  color: Colors.black,
                  shape: BoxShape.circle,
                  border: Border.all(color: tierColor, width: 1),
                ),
                child: Icon(Icons.star, color: tierColor, size: 14),
              ),
            ),
          ],
        ),

        const SizedBox(width: 14),

        /// 📝 Name + plan + price
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                creatorName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),

              Row(
                children: [
                  /// Plan badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: tierColor),
                    ),
                    child: Text(
                      plan,
                      style: TextStyle(
                        color: tierColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  /// Price badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: tierColor.withOpacity(0.15),
                      border: Border.all(color: tierColor),
                    ),
                    child: Text(
                      price,
                      style: TextStyle(
                        color: tierColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
