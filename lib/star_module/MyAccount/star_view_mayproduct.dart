import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class StarViewMyProduct extends StatefulWidget {
  final bool isReceivedOrder;
  const StarViewMyProduct({super.key, required this.isReceivedOrder});

  @override
  State<StarViewMyProduct> createState() => _StarViewMyProductState();
}

class _StarViewMyProductState extends State<StarViewMyProduct> {
  static const gold = kgoldColor;

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
          "View Order Details",
          style: TextStyle(
            color: kgoldColor,
            fontFamily: "Gilroy",
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: isDark ? kwhiteColor : kblackColor),
        centerTitle: true,
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
            child: widget.isReceivedOrder
                ? actionButton(context, "Update Status", _showOrderStatusDialog)
                : actionButton(context, "Buy It Again", _buyItAgain),
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
                      child: Image.asset("assets/award.png", fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// BRAND NAME
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Best Actor Replica",
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

  Widget actionButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
  ) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: gold,
        side: BorderSide(color: gold),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
            "Buy it again",
            style: TextStyle(color: kgoldColor),
          ),
          content: Text(
            "Are you sure you want to buy it again?",
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

  void _showOrderStatusDialog() {
    String selectedStatus = "New";
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoTheme(
          data: CupertinoThemeData(
            brightness: isDark ? Brightness.dark : Brightness.light,
            primaryColor: kgoldColor,
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return CupertinoAlertDialog(
                title: const Text(
                  "Update Order Status",
                  style: TextStyle(color: kgoldColor, fontSize: 16),
                ),
                content: Column(
                  children: [
                    const SizedBox(height: 12),

                    _cupertinoStatusItem(
                      "New",
                      selectedStatus,
                      (val) => setState(() => selectedStatus = val),
                      isDark,
                    ),
                    _cupertinoStatusItem(
                      "Shipping",
                      selectedStatus,
                      (val) => setState(() => selectedStatus = val),
                      isDark,
                    ),
                    _cupertinoStatusItem(
                      "Delivered",
                      selectedStatus,
                      (val) => setState(() => selectedStatus = val),
                      isDark,
                    ),
                    _cupertinoStatusItem(
                      "Cancelled",
                      selectedStatus,
                      (val) => setState(() => selectedStatus = val),
                      isDark,
                    ),
                  ],
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
                    onPressed: () {
                      // selectedStatus is correct here
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Confirm",
                      style: TextStyle(color: kgoldColor),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _buyItAgain() {
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
            "Buy It Again",
            style: TextStyle(color: kgoldColor),
          ),
          content: Text(
            "This item will be added to your cart?",
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
              child: const Text("OK", style: TextStyle(color: kgoldColor)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cupertinoStatusItem(
    String title,
    String selected,
    ValueChanged<String> onChanged,
    bool isDark,
  ) {
    final isSelected = title == selected;

    return GestureDetector(
      onTap: () => onChanged(title),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? CupertinoIcons.check_mark_circled_solid
                  : CupertinoIcons.circle,
              color: isSelected ? kgoldColor : CupertinoColors.systemGrey,
              size: 22,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? kgoldColor
                    : (isDark ? Colors.white70 : Colors.black54),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
