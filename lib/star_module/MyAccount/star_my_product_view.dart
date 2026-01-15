import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class StarMyProductView extends StatefulWidget {
  const StarMyProductView({super.key});

  @override
  State<StarMyProductView> createState() => _StarMyProductViewState();
}

class _StarMyProductViewState extends State<StarMyProductView> {
  static const gold = kgoldColor;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kblackColor : kwhiteColor,
      appBar: AppBar(
        backgroundColor: isDark ? kblackColor : kwhiteColor,
        elevation: 0,
        foregroundColor: isDark ? kwhiteColor : kblackColor,
        centerTitle: true,
        title: Text(
          "Shop from Lymio",
          style: GoogleFonts.poppins(
            color: isDark ? kwhiteColor : kblackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      /// BOTTOM BUTTON
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        decoration: BoxDecoration(
          color: isDark ? kblackColor : kwhiteColor,
          border: Border(
            top: BorderSide(color: isDark ? Colors.white12 : Colors.black12),
          ),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 50,
            child: actionButton(context, "Confirm Order"),
          ),
        ),
      ),

      /// BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// PRODUCT IMAGE
              Center(
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isDark ? Colors.white24 : Colors.black12,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        "assets/jersey10.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// BRAND NAME
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Lymio",
                  style: GoogleFonts.poppins(
                    color: isDark ? kwhiteColor : kblackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              /// PRICE
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  "\$98.99",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: gold,
                  ),
                ),
              ),

              Divider(
                color: isDark
                    ? CupertinoColors.opaqueSeparator
                    : Colors.black12,
              ),

              /// DESCRIPTION TITLE
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Description",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDark ? kwhiteColor : kblackColor,
                  ),
                ),
              ),

              /// DESCRIPTION TEXT
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  "A stylish, ultra-soft T-Shirt designed for all-day comfort. "
                  "Made with breathable cotton fleece, this hoodie keeps you warm "
                  "without feeling heavy. Ideal for gym sessions, casual outings, "
                  "or travel.",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionButton(BuildContext context, String text) {
    return OutlinedButton(
      onPressed: () => _showBuyItAgainDialog(context),
      style: OutlinedButton.styleFrom(
        foregroundColor: gold,
        side: BorderSide(color: gold),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(text),
    );
  }

  void _showBuyItAgainDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoTheme(
        data: CupertinoThemeData(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primaryColor: gold,
        ),
        child: CupertinoAlertDialog(
          title: const Text(
            "Confirm Order",
            style: TextStyle(color: kgoldColor),
          ),
          content: Text(
            "Are you sure you want to confirm order?",
            style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("Yes", style: TextStyle(color: kgoldColor)),
            ),
          ],
        ),
      ),
    );
  }
}
