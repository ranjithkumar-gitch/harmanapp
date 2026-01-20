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
          icon: Icon(Icons.arrow_back_ios, color: kgoldColor, size: 18),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "My Memberships",
          style: TextStyle(
            color: kgoldColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _editablePackages(context),
            _membershipSummary(context),

            membershipCard(
              context: context,
              image: "assets/sources/profiles/averie-woodard.jpg",
              creatorName: "Alex Star",
              plan: "Monthly",
              price: "\$9.99",
              tierColor: kgoldColor,
            ),
            membershipCard(
              context: context,
              image: "assets/sources/profiles/bhatia.jpg",
              creatorName: "Bhatia",
              plan: "Monthly",
              price: "\$9.99",
              tierColor: kgoldColor,
            ),
            membershipCard(
              context: context,
              image: "assets/sources/profiles/aiony-haust.jpg",
              creatorName: "Sophia Ray",
              plan: "Yearly",
              price: "\$99.99",
              tierColor: kgoldColor,
            ),
            membershipCard(
              context: context,
              image: "assets/sources/profiles/deco-dev.png",
              creatorName: "Deco dev",
              plan: "Yearly",
              price: "\$99.99",
              tierColor: kgoldColor,
            ),
            membershipCard(
              context: context,
              image: "assets/sources/profiles/dion.jpg",
              creatorName: "Dion",
              plan: "Yearly",
              price: "\$99.99",
              tierColor: kgoldColor,
            ),
            membershipCard(
              context: context,
              image: "assets/sources/profiles/azamat-zhanisov-.jpg",
              creatorName: "Mark Vibe",
              plan: "Weekly",
              price: "\$4.99",
              tierColor: kgoldColor,
            ),
            SizedBox(height: 20),
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
            "Membership Summary - GOLD Tier",
            style: TextStyle(
              color: kgoldColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Memberships",
                style: TextStyle(
                  color: isDark ? kwhiteColor : kblackColor,
                  fontSize: 14,
                ),
              ),
              Text(
                "6",
                style: TextStyle(
                  color: isDark ? kwhiteColor : kblackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const Divider(color: kgoldColor, height: 24),
          _membershipItem("Yearly", "\$27.20", qty: 3, isDark: isDark),
          _membershipItem("Monthly", "\$18.99", qty: 2, isDark: isDark),

          _membershipItem("Weekly", "\$9.99", qty: 1, isDark: isDark),
        ],
      ),
    );
  }

  Widget _membershipItem(
    String label,
    String value, {
    required bool isDark,
    int qty = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 110,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kgoldColor),
                  ),
                  child: Row(
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          color: isDark ? kwhiteColor : kblackColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        " x $qty",
                        style: TextStyle(
                          color: isDark ? kwhiteColor : kblackColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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

  Widget _editablePackages(BuildContext context) {
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
            "Manage Packages",
            style: TextStyle(
              color: kgoldColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          _editablePackageRow(context, label: "Yearly", price: "\$99.99"),
          _editablePackageRow(context, label: "Monthly", price: "\$9.99"),
          _editablePackageRow(context, label: "Weekly", price: "\$4.99"),
        ],
      ),
    );
  }

  Widget _editablePackageRow(
    BuildContext context, {
    required String label,
    required String price,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kgoldColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isDark ? kwhiteColor : kblackColor,
                fontSize: 14,
              ),
            ),
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    color: kgoldColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(Icons.edit, size: 18, color: kgoldColor),
                  onPressed: () {},
                ),
              ],
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
