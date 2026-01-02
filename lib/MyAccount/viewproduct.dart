import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/widgets/colors.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  int quantity = 1;
  int selectedColor = 0;
  int selectedSize = 0;
  static const gold = kgoldColor;
  final colors = [
    Colors.black,
    Colors.grey,
    const Color.fromARGB(255, 147, 43, 5),
  ];
  final sizes = ["S", "M", "L", "XL", "XXL"];

  @override
  Widget build(BuildContext context) {
    // bool isFashion = widget.product["type"] == "fashion";

    return Scaffold(
      backgroundColor: kblackColor,

      appBar: AppBar(
        backgroundColor: kblackColor,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          "Shop from Lymio",
          style: GoogleFonts.poppins(
            color: CupertinoColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        decoration: const BoxDecoration(
          color: Colors.black,
          border: Border(top: BorderSide(color: Colors.white12)),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(height: 50, child: actionButton("Buy it again")),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: gold, width: 1),
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
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: Image.asset(
                                  "assets/shirt.jpg",

                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
                          color: CupertinoColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

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
                          color: Color(0xFFF5D778),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Divider(color: CupertinoColors.opaqueSeparator),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Description',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        "A stylish, ultra-soft T-Shirt designed for all-day comfort. Made with breathable cotton fleece, this hoodie keeps you warm without feeling heavy. Ideal for gym sessions, casual outings, or travel",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),

                    // Divider(color: CupertinoColors.opaqueSeparator),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(14),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: gold, width: 1),
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
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: Image.asset(
                                  "assets/jersey5.avif",

                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
                          color: CupertinoColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

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
                          color: Color(0xFFF5D778),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Divider(color: CupertinoColors.opaqueSeparator),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Description',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        "A stylish, ultra-soft T-Shirt designed for all-day comfort. Made with breathable cotton fleece, this hoodie keeps you warm without feeling heavy. Ideal for gym sessions, casual outings, or travel",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),

                    // Divider(color: CupertinoColors.opaqueSeparator),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionButton(String text) {
    return OutlinedButton(
      onPressed: () {
        _showbuyitagainCard(context); // or navigate to order details
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: gold,
        side: BorderSide(color: gold),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(text),
    );
  }

  void _showbuyitagainCard(BuildContext context) {
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
            "Buy it again",
            style: TextStyle(color: Color(0xFFF5D778)),
          ),
          content: const Text(
            "Are you sure you want to Buy it agail?",
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
                "Yes",
                style: TextStyle(color: Color(0xFFF5D778)),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
