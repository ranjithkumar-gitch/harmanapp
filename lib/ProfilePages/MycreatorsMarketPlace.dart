import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/AppBar/AppBar.dart';
import 'package:harmanapp/Cart/CartManager.dart';

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
      "name": "Handmade Yoga Mat",
      "creator": "YogiShruti",
      "price": "\$39.99",
      "type": "default",
      "description":
          "A premium eco-friendly yoga mat crafted from natural materials designed for maximum comfort and grip. Perfect for daily yoga practice, meditation, stretching, and home workouts. Sweat-resistant and durable for long-term use.",
      "image": [
        "https://cdn.canvaschamp.in/static/images/landingpage/yogamats/fitness-yoga-mat.jpg",
      ],
    },
    {
      "name": "Lymio Hoodie",
      "creator": "Lavish Store",
      "price": "\$59.99",
      "type": "fashion",
      "description":
          "A stylish, ultra-soft hoodie designed for all-day comfort. Made with breathable cotton fleece, this hoodie keeps you warm without feeling heavy. Ideal for gym sessions, casual outings, or travel.",
      "image": [
        "https://m.media-amazon.com/images/I/31SaUxjdDdL.jpg",
        "https://m.media-amazon.com/images/I/314Y8rbyx9L.jpg",
        "https://m.media-amazon.com/images/I/316uuYEYJkL.jpg",
      ],
    },

    {
      "name": "Ultra Pure Creatine",
      "creator": "TrainWithArjun",
      "price": "\$20.99",
      "type": "default",
      "description":
          "A fast-absorbing creatine supplement that enhances ATP energy production, giving you more power during high-intensity workouts. Supports muscle growth, strength gains, and improved workout capacity.",
      "image": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu5LgzI3d_ULFW8Kbs_abeuKoZ9-1AeIkR3w&s",
      ],
    },
    {
      "name": "Copper Water Bottle",
      "creator": "EarthyFeelsCo",
      "price": "\$30.99",
      "type": "default",
      'description':
          'A handcrafted 100% pure copper bottle with natural Ayurvedic health benefits. Helps purify water, boosts immunity, and improves digestion. Beautifully designed for home, yoga sessions, office, or travel.',
      "image": [
        "https://m.media-amazon.com/images/I/71MkUmlTBPL._AC_UF894,1000_QL80_.jpg",
      ],
    },
    {
      "name": "Herbal Green Tea Pack",
      "creator": "WellnessByKaira",
      "price": "\$18.99",
      "type": "default",
      'description':
          'A soothing blend of premium handpicked green tea leaves packed with antioxidants. Helps boost metabolism, reduce stress, and promote a healthy lifestyle. Perfect for morning refreshment or evening relaxation.',
      "image": [
        "https://nutritionsource.hsph.harvard.edu/wp-content/uploads/2019/07/tee-2427846_1280.jpg",
      ],
    },
    {
      "name": "Lymio Hoodie",
      "creator": "Lavish Store",
      "price": "\$59.99",
      "type": "fashion",
      "description":
          "A stylish, ultra-soft hoodie designed for all-day comfort. Made with breathable cotton fleece, this hoodie keeps you warm without feeling heavy. Ideal for gym sessions, casual outings, or travel.",
      "image": [
        "https://m.media-amazon.com/images/I/31SaUxjdDdL.jpg",
        "https://m.media-amazon.com/images/I/314Y8rbyx9L.jpg",
        "https://m.media-amazon.com/images/I/316uuYEYJkL.jpg",
      ],
    },

    {
      "name": "Ultra Pure Creatine",
      "creator": "TrainWithArjun",
      "price": "\$20.99",
      "type": "default",
      "description":
          "A fast-absorbing creatine supplement that enhances ATP energy production, giving you more power during high-intensity workouts. Supports muscle growth, strength gains, and improved workout capacity.",
      "image": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu5LgzI3d_ULFW8Kbs_abeuKoZ9-1AeIkR3w&s",
      ],
    },
    {
      "name": "Copper Water Bottle",
      "creator": "EarthyFeelsCo",
      "price": "\$30.99",
      "type": "default",
      'description':
          'A handcrafted 100% pure copper bottle with natural Ayurvedic health benefits. Helps purify water, boosts immunity, and improves digestion. Beautifully designed for home, yoga sessions, office, or travel.',
      "image": [
        "https://m.media-amazon.com/images/I/71MkUmlTBPL._AC_UF894,1000_QL80_.jpg",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.black,

      body: Column(
        children: [
          const SizedBox(height: 10),

          const SizedBox(height: 10),

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
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
                child: Image.network(
                  item["image"][0],
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    item["price"],
                    style: GoogleFonts.poppins(
                      color: CupertinoColors.white,
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
                color: CupertinoColors.black,
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

          Padding(
            padding: const EdgeInsets.only(top: 3, left: 5, right: 5),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
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

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                child: Text(
                  "Buy Now",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
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
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(
          "Shop from ${widget.product["creator"]}",
          style: GoogleFonts.poppins(
            color: CupertinoColors.black,
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
                          child: Image.network(
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
                    color: CupertinoColors.black,
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
                    color: Color(0xFFF5D778),
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
                                  ? Colors.black
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
              ],

              Divider(color: CupertinoColors.opaqueSeparator),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Description',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.black,
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
                    color: CupertinoColors.black,
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
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) setState(() => quantity--);
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text(
                    quantity.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() => quantity++),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  CartManager.addToCart(widget.product, quantity);

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
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
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 15),

                              ElevatedButton(
                                onPressed: () {
                                  widget.onCartUpdated?.call();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                child: Text(
                                  "OK",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
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
                    color: CupertinoColors.white,
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
