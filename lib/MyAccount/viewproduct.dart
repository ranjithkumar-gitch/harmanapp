import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Cart/CartManager.dart';
import 'package:lottie/lottie.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  int quantity = 1;
  int selectedColor = 0;
  int selectedSize = 0;

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
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
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
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
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
                            // key: ValueKey(
                            //   widget.product["image"][selectedColor],
                            // ),
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
                  "\$99.99",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFF5D778),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Sizes",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Container(
                height: 35,
                padding: const EdgeInsets.only(left: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sizes.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => setState(() => selectedSize = index),
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: selectedSize == index
                              ? Color(0xFFF5D778)
                              : Color.fromRGBO(244, 226, 167, 1),

                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          sizes[index],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: selectedSize == index
                                ? FontWeight.w500
                                : FontWeight.w400,
                            color: selectedSize == index
                                ? Colors.black
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
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
      ),
    );
  }
}
