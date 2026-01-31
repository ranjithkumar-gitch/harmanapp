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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: kgoldColor, size: 18),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: isDark ? kblackColor : kwhiteColor,
        elevation: 0,
        title: Text(
          "My Memberships",
          style: TextStyle(
            color: kgoldColor,
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
            image: "assets/sources/profiles/bhatia.jpg",
            creatorName: "Alex Star",
            plan: "Monthly",
            price: "\$9.99",
            tierColor: kgoldColor,
            onUnsubscribe: () => _showUnsubscribeDialog(context),
          ),
          membershipCard(
            context: context,
            image: "assets/sources/profiles/deepika.jpg",
            creatorName: "Sophia Ray",
            plan: "Yearly",
            price: "\$99.99",
            tierColor: CupertinoColors.systemGrey,
            onUnsubscribe: () => _showUnsubscribeDialog(context),
          ),
          membershipCard(
            context: context,
            image: "assets/sources/profiles/elon.jpeg",
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
              child: Text(
                "Cancel",
                style: TextStyle(color: isDark ? kwhiteColor : kblackColor),
              ),
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

  return LayoutBuilder(
    builder: (context, constraints) {
      final isSmall = constraints.maxWidth < 360;

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark ? kblackColor : kwhiteColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: tierColor, width: 1.8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// 📸 Image
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    height: isSmall ? 60 : 70,
                    width: isSmall ? 60 : 70,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -6,
                  right: -6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: isDark ? kblackColor : kwhiteColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: tierColor),
                    ),
                    child: Icon(Icons.star, size: 12, color: tierColor),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 12),

            /// 📝 Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    creatorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isDark ? kwhiteColor : kblackColor,
                      fontSize: isSmall ? 14 : 16,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),

                  /// ✅ Wrap instead of Row
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: [
                      _badge(plan, tierColor, isSmall),
                      _priceBadge(price, tierColor, isSmall),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            /// 🚫 Unsubscribe
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: isSmall ? 80 : 100),
              child: OutlinedButton(
                onPressed: onUnsubscribe,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmall ? 10 : 14,
                    vertical: 8,
                  ),
                  side: BorderSide(color: tierColor),
                  foregroundColor: tierColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: FittedBox(
                  child: const Text(
                    "Unsubscribe",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _badge(String text, Color color, bool isSmall) => Container(
  padding: EdgeInsets.symmetric(horizontal: isSmall ? 8 : 10, vertical: 4),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: color),
  ),
  child: Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: isSmall ? 11 : 12,
      fontWeight: FontWeight.w600,
    ),
  ),
);

Widget _priceBadge(String text, Color color, bool isSmall) => Container(
  padding: EdgeInsets.symmetric(horizontal: isSmall ? 8 : 10, vertical: 4),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: color.withOpacity(0.15),
    border: Border.all(color: color),
  ),
  child: Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: isSmall ? 11 : 12,
      fontWeight: FontWeight.bold,
    ),
  ),
);
