import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Cart/cart_manager.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:lottie/lottie.dart';

class Mycreatorsmarketplace extends StatefulWidget {
  const Mycreatorsmarketplace({super.key});

  @override
  State<Mycreatorsmarketplace> createState() => _MycreatorsmarketplaceState();
}

class _MycreatorsmarketplaceState extends State<Mycreatorsmarketplace> {
  String searchText = "";

  final products = [
    {
      "name": "Signed Cricket Bat",
      "creator": "Virat Kohli",
      "price": "\$39.99",
      "type": "default",
      "description":
          "Own a piece of cricketing history with this authentic Virat Kohli signed bat. Perfect for passionate fans and collectors, this exclusive memorabilia captures the spirit of one of the greatest batsmen of all time.",
      "image": ["assets/bat.png"],
    },
    {
      "name": "Best Actor Replica",
      "creator": "Deepika padukone",
      "price": "\$59.99",
      "type": "default",
      "description":
          "Celebrate cinematic excellence with this Best Actor Award Replica—a stunning keepsake inspired by the iconic trophies of the film industry. Crafted with a polished golden finish and mounted on a sleek base, it’s perfect for movie lovers, aspiring actors, or as a fun gift for friends.",
      "image": ["assets/award.png"],
    },

    {
      "name": "Signed Hoodie",
      "creator": "Oprah Winfrey",
      "price": "\$20.99",
      "type": "default",
      "description":
          "Step into style and fandom with this exclusive signed hoodie. Featuring a sleek design and the authentic autograph of your favorite star, it’s more than just apparel",
      "image": ["assets/huddie.png"],
    },
    {
      "name": "Digital Signature",
      "creator": "Elon Musk",
      "price": "\$30.99",
      "type": "default",
      'description':
          'Own a piece of digital authenticity with this exclusive Digital Signature collectible. Each signature is securely created and verified, giving fans a unique way to connect with their favorite star in the digital world.',
      "image": ["assets/signature.png"],
    },
    {
      "name": "Exclusive Signature",
      "creator": "Elon Musk",
      "price": "\$18.99",
      "type": "default",
      'description':
          'Own a piece of digital authenticity with this exclusive Digital Signature collectible. Each signature is securely created and verified, giving fans a unique way to connect with their favorite star in the digital world.',
      "image": ["assets/signature2.png"],
    },
    {
      "name": "Signed Jersey",
      "creator": "Lionel Messi",
      "price": "\$59.99",
      "type": "default",
      "description":
          "Show your passion for the game with this exclusive signed sports T-shirt. Autographed by a celebrated athlete, this collectible blends everyday comfort with iconic memorabilia. ",
      "image": ["assets/jersey_joshi.png"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Brightness.dark == Theme.of(context).brightness
          ? kblackColor
          : kwhiteColor,

      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.66,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];

                if (searchText.isNotEmpty &&
                    !(item["name"] as String).toLowerCase().contains(
                      searchText.toLowerCase(),
                    ) &&
                    !(item["creator"] as String).toLowerCase().contains(
                      searchText.toLowerCase(),
                    )) {
                  return const SizedBox.shrink();
                }

                return productCard(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget productCard(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Brightness.dark == Theme.of(context).brightness
            ? kblackColor
            : kwhiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kgoldColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
                child: Image.asset(
                  item["image"][0],
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Brightness.dark == Theme.of(context).brightness
                        ? kblackColor
                        : kwhiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kgoldColor),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  // decoration: BoxDecoration(
                  //   color: Colors.white.withOpacity(0.85),
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
                  child: Text(
                    item["price"],
                    style: GoogleFonts.poppins(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              item["name"],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: Brightness.dark == Theme.of(context).brightness
                    ? kwhiteColor
                    : kblackColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 3),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "By ${item["creator"]}",
              style: GoogleFonts.poppins(
                color: Colors.grey.shade700,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 3, left: 10, right: 10),
            child: SizedBox(
              width: double.infinity,

              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductViewPage(
                        product: item,
                        onCartUpdated: () {
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  side: const BorderSide(
                    color: kgoldColor, // gold border
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Buy Now",
                  style: GoogleFonts.poppins(
                    color: kgoldColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductViewPage extends StatefulWidget {
  final Map<String, dynamic> product;
  final VoidCallback? onCartUpdated;

  const ProductViewPage({super.key, required this.product, this.onCartUpdated});

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
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
    bool isFashion = widget.product["type"] == "fashion";

    return Scaffold(
      backgroundColor: Brightness.dark == Theme.of(context).brightness
          ? kblackColor
          : kwhiteColor,

      appBar: AppBar(
        backgroundColor: Brightness.dark == Theme.of(context).brightness
            ? kblackColor
            : kwhiteColor,
        elevation: 0,
        foregroundColor: Brightness.dark == Theme.of(context).brightness
            ? kwhiteColor
            : kblackColor,
        title: Text(
          "Shop from ${widget.product["creator"]}",
          style: GoogleFonts.poppins(
            color: Brightness.dark == Theme.of(context).brightness
                ? kwhiteColor
                : kblackColor,
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
                            widget.product["image"][selectedColor],
                            key: ValueKey(
                              widget.product["image"][selectedColor],
                            ),
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
                  widget.product["name"],
                  style: GoogleFonts.poppins(
                    color: Brightness.dark == Theme.of(context).brightness
                        ? kwhiteColor
                        : kblackColor,
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
                  widget.product["price"],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kgoldColor,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              if (isFashion) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Colors",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: List.generate(colors.length, (index) {
                      return GestureDetector(
                        onTap: () => setState(() => selectedColor = index),

                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: selectedColor == index
                                  ? Colors.grey
                                  : Colors.grey.shade400,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: colors[index],
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 10),
              ],

              if (isFashion) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Sizes",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kblackColor
                          : kwhiteColor,
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
                                ? kgoldColor
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
              ],

              Divider(color: CupertinoColors.opaqueSeparator),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Description',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Brightness.dark == Theme.of(context).brightness
                        ? kwhiteColor
                        : kblackColor,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  widget.product["description"],
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Brightness.dark == Theme.of(context).brightness
                        ? kwhiteColor
                        : kblackColor,
                  ),
                ),
              ),
              Divider(color: CupertinoColors.opaqueSeparator),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        height: 70,
        color: Brightness.dark == Theme.of(context).brightness
            ? kblackColor
            : kwhiteColor,
        child: Row(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: kgoldColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) setState(() => quantity--);
                    },
                    icon: const Icon(Icons.remove, color: Color(0xFFDAA520)),
                  ),
                  Text(
                    quantity.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: kgoldColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() => quantity++),
                    icon: const Icon(Icons.add, color: kgoldColor),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  CartManager.addToCart(widget.product, quantity);

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return Dialog(
                        backgroundColor:
                            Brightness.dark == Theme.of(context).brightness
                            ? kblackColor
                            : kwhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 180,
                                height: 180,
                                child: Lottie.asset(
                                  "assets/congratulations.json",
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Item added to cart!",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: kgoldColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 15),
                              OutlinedButton(
                                onPressed: () {
                                  widget.onCartUpdated?.call();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: kgoldColor),
                                ),

                                child: Text(
                                  "OK",
                                  style: GoogleFonts.poppins(color: kgoldColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: kgoldColor, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                child: Text(
                  "Add to cart",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: kgoldColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
