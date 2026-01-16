import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

enum OrderStatus { confirmed, shipping, delivered, cancelled }

class StarViewProduct extends StatefulWidget {
  final bool isReceivedOrder;
  const StarViewProduct({super.key, required this.isReceivedOrder});

  @override
  State<StarViewProduct> createState() => _StarViewProductState();
}

class _StarViewProductState extends State<StarViewProduct> {
  static const gold = kgoldColor;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kblackColor : kwhiteColor,

      // appBar: AppBar(
      //   backgroundColor: isDark ? kblackColor : kwhiteColor,
      //   elevation: 0,
      //   foregroundColor: isDark ? kwhiteColor : kblackColor,
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios_new,
      //       color: isDark ? kwhiteColor : kblackColor,
      //       size: 20,
      //     ),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      //   title: Text(
      //     "View Order Details",
      //     style: GoogleFonts.poppins(
      //       color: isDark ? kwhiteColor : kblackColor,
      //       fontSize: 18,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),
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
          "View Order Details",
          style: TextStyle(
            color: isDark ? kwhiteColor : kblackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            productCard(context, image: "assets/shirt.jpg"),
            const SizedBox(height: 30),
            productCard(context, image: "assets/jersey5.avif"),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget productCard(BuildContext context, {required String image}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: gold),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            color: isDark ? CupertinoColors.opaqueSeparator : Colors.black12,
          ),

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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "A stylish, ultra-soft T-Shirt designed for all-day comfort.",
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white70 : Colors.black54,
              ),
            ),
          ),
        ],
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

  // void _showOrderStatusDialog() {
  //   final isDark = Theme.of(context).brightness == Brightness.dark;

  //   String selectedStatus = "New";

  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: const Text(
  //         "Update Order Status",
  //         style: TextStyle(color: kgoldColor),
  //       ),
  //       content: StatefulBuilder(
  //         builder: (context, setState) {
  //           return Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               _statusRadio("New", selectedStatus, setState),
  //               _statusRadio("Shipping", selectedStatus, setState),
  //               _statusRadio("Delivered", selectedStatus, setState),
  //               _statusRadio("Cancelled", selectedStatus, setState),
  //             ],
  //           );
  //         },
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text("Cancel"),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           child: const Text("Confirm", style: TextStyle(color: kgoldColor)),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  void _showOrderStatusDialog() {
    String selectedStatus = "New";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Update Order Status",
            style: TextStyle(color: kgoldColor),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _statusRadio("New", selectedStatus, (val) {
                    setState(() => selectedStatus = val);
                  }),
                  _statusRadio("Shipping", selectedStatus, (val) {
                    setState(() => selectedStatus = val);
                  }),
                  _statusRadio("Delivered", selectedStatus, (val) {
                    setState(() => selectedStatus = val);
                  }),
                  _statusRadio("Cancelled", selectedStatus, (val) {
                    setState(() => selectedStatus = val);
                  }),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // selectedStatus is correct here
                Navigator.pop(context);
              },
              child: const Text("Confirm", style: TextStyle(color: kgoldColor)),
            ),
          ],
        );
      },
    );
  }

  // Widget _statusRadio(
  //   String value,
  //   String groupValue,
  //   void Function(void Function()) setState,
  // ) {
  //   return RadioListTile<String>(
  //     value: value,
  //     groupValue: groupValue,
  //     activeColor: kgoldColor,
  //     title: Text(value),
  //     onChanged: (val) {
  //       setState(() {
  //         groupValue = val!;
  //       });
  //     },
  //   );
  // }
  Widget _statusRadio(
    String value,
    String groupValue,
    ValueChanged<String> onChanged,
  ) {
    return RadioListTile<String>(
      value: value,
      groupValue: groupValue,
      activeColor: kgoldColor,
      title: Text(value),
      onChanged: (val) {
        if (val != null) {
          onChanged(val);
        }
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
              child: const Text("Cancel"),
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
}
