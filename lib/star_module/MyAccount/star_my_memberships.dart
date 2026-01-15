import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class StarMembershipScreen extends StatelessWidget {
  const StarMembershipScreen({super.key});

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
          "My Memberships",
          style: TextStyle(
            color: isDark ? kwhiteColor : kblackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _membershipSummary(context),

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
              image: "assets/sources/profiles/bhatia.jpg",
              creatorName: "Bhatia",
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
              image: "assets/sources/profiles/deco-dev.png",
              creatorName: "Deco dev",
              plan: "Yearly",
              price: "\$99.99",
              tierColor: CupertinoColors.systemGrey,
              onUnsubscribe: () => _showUnsubscribeDialog(context),
            ),
            membershipCard(
              context: context,
              image: "assets/sources/profiles/dion.jpg",
              creatorName: "Dion",
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
            SizedBox(height: 20),
          ],
        ),
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

  Widget _membershipSummary(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? kblackColor : kwhiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kgoldColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Membership Summary",
            style: TextStyle(
              color: kgoldColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          /// TOTAL MEMBERS (NO CONTAINER)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Members",
                style: TextStyle(
                  color: isDark ? kwhiteColor : kblackColor,
                  fontSize: 14,
                ),
              ),
              Text(
                "3",
                style: TextStyle(
                  color: isDark ? kwhiteColor : kblackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const Divider(color: kgoldColor, height: 24),

          _membershipItem("Monthly", "\$18.99", qty: 2),
          _membershipItem("Yearly", "\$27.20", qty: 3),
          _membershipItem("Weekly", "\$9.99", qty: 1),
        ],
      ),
    );
  }

  Widget _membershipItem(String label, String value, {int qty = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// LEFT CONTAINER (PLAN)
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kgoldColor),
                ),
                child: Row(
                  children: [
                    Text(
                      label,
                      style: const TextStyle(color: kgoldColor, fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: kgoldColor),
                ),
                child: Text(
                  "qty : $qty",
                  style: const TextStyle(
                    color: kgoldColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          /// RIGHT SIDE (QTY + PRICE)
          Row(
            children: [
              const SizedBox(width: 10),
              Text(
                value,
                style: const TextStyle(
                  color: kgoldColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    String label,
    String value, {
    int qty = 1,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kgoldColor),
            ),
            child: Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "qty : $qty",
                  style: const TextStyle(
                    color: kgoldColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: kgoldColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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
    color: color.withValues(alpha: 0.15),
    border: Border.all(color: color),
  ),
  child: Text(
    text,
    style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
  ),
);
