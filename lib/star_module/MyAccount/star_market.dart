import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:harmanapp/Cart/cart_manager.dart';
import 'package:harmanapp/star_module/MyAccount/add_productpage.dart';

import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:image_picker/image_picker.dart';

class StarMarketPlace extends StatefulWidget {
  const StarMarketPlace({super.key});

  @override
  State<StarMarketPlace> createState() => _StarMarketPlaceState();
}

class _StarMarketPlaceState extends State<StarMarketPlace> {
  String searchText = "";

  final products = [
    {
      "name": "Signed Cricket Bat",
      "creator": "Virat Kohli",
      "price": "\$39.99",
      "available": "6",
      "type": "default",
      "description":
          "Own a piece of cricketing history with this authentic Virat Kohli signed bat. Perfect for passionate fans and collectors, this exclusive memorabilia captures the spirit of one of the greatest batsmen of all time.",
      "image": ["assets/bat.png"],
    },
    {
      "name": "Best Actor Replica",
      "creator": "Deepika padukone",
      "price": "\$59.99",
      "available": "6",
      "type": "default",
      "description":
          "Celebrate cinematic excellence with this Best Actor Award Replica—a stunning keepsake inspired by the iconic trophies of the film industry. Crafted with a polished golden finish and mounted on a sleek base, it’s perfect for movie lovers, aspiring actors, or as a fun gift for friends.",
      "image": ["assets/award.png"],
    },

    {
      "name": "Signed Hoodie",
      "creator": "Oprah Winfrey",
      "price": "\$20.99",
      "available": "6",
      "type": "default",
      "description":
          "Step into style and fandom with this exclusive signed hoodie. Featuring a sleek design and the authentic autograph of your favorite star, it’s more than just apparel",
      "image": ["assets/huddie.png"],
    },
    {
      "name": "Digital Signature",
      "creator": "Elon Musk",
      "price": "\$30.99",
      "available": "6",
      "type": "default",
      'description':
          'Own a piece of digital authenticity with this exclusive Digital Signature collectible. Each signature is securely created and verified, giving fans a unique way to connect with their favorite star in the digital world.',
      "image": ["assets/signature.png"],
    },
    {
      "name": "Exclusive Signature",
      "creator": "Elon Musk",
      "price": "\$18.99",
      "available": "6",
      "type": "default",
      'description':
          'Own a piece of digital authenticity with this exclusive Digital Signature collectible. Each signature is securely created and verified, giving fans a unique way to connect with their favorite star in the digital world.',
      "image": ["assets/signature2.png"],
    },
    {
      "name": "Signed Jersey",
      "creator": "Lionel Messi",
      "price": "\$59.99",
      "available": "6",
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
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: Brightness.dark == Theme.of(context).brightness
      //           ? kwhiteColor
      //           : kblackColor,
      //       size: 18,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Text(
      //     "My Marketplace",
      //     style: TextStyle(
      //       color: Brightness.dark == Theme.of(context).brightness
      //           ? kwhiteColor
      //           : kblackColor,
      //       fontSize: 18,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      appBar: AppBar(
        backgroundColor: Brightness.dark == Theme.of(context).brightness
            ? kblackColor
            : kwhiteColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kgoldColor,
            // Brightness.dark == Theme.of(context).brightness
            //     ? kwhiteColor
            //     : kblackColor,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "My Marketplace",
          style: TextStyle(
            color: kgoldColor,
            // Brightness.dark == Theme.of(context).brightness
            //     ? kwhiteColor
            //     : kblackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddProductPage()),
                );
              },
              style: TextButton.styleFrom(
                side: const BorderSide(color: kgoldColor, width: 1.5),
                foregroundColor: kgoldColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: Icon(Icons.add, color: kgoldColor),
              label: Text("Add New", style: TextStyle(color: kgoldColor)),
            ),
          ),
        ],
        // centerTitle: true,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              child: SearchBar(
                backgroundColor: WidgetStatePropertyAll(
                  Brightness.dark == Theme.of(context).brightness
                      ? kblackColor
                      : kwhiteColor,
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: kgoldColor),
                  ),
                ),

                hintText: "Search Here...",
                hintStyle: WidgetStatePropertyAll(
                  TextStyle(
                    color: Brightness.dark == Theme.of(context).brightness
                        ? kwhiteColor
                        : kblackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                textStyle: WidgetStatePropertyAll(
                  TextStyle(
                    color: Brightness.dark == Theme.of(context).brightness
                        ? kblackColor
                        : kwhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
                trailing: [const Icon(Icons.search, color: kgoldColor)],

                onTap: () {},
                onChanged: (value) {},
              ),
            ),
          ),

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
          Container(height: 80),
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
                  side: const BorderSide(color: kgoldColor, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "View Product",
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
  bool isEditMode = false;
  int quantity = 1;
  String status = 'online';

  late TextEditingController nameCtrl;
  late TextEditingController descCtrl;
  late TextEditingController priceCtrl;
  late TextEditingController availableCtrl;

  final ImagePicker _picker = ImagePicker();
  File? editedImage;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.product["name"]);
    descCtrl = TextEditingController(text: widget.product["description"]);
    priceCtrl = TextEditingController(text: widget.product["price"]);
    availableCtrl = TextEditingController(
      text: widget.product["available"].toString(),
    );
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    descCtrl.dispose();
    priceCtrl.dispose();
    availableCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() => editedImage = File(img.path));
    }
  }

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
          "Product details",
          style: TextStyle(
            color: kgoldColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton.icon(
              onPressed: () {
                setState(() => isEditMode = !isEditMode);
              },
              style: TextButton.styleFrom(
                side: const BorderSide(color: kgoldColor, width: 1.5),
                foregroundColor: kgoldColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: Icon(Icons.edit, color: kgoldColor),
              label: Text("Edit", style: TextStyle(color: kgoldColor)),
            ),
          ),
        ],
        centerTitle: true,
      ),

      /// BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE (Editable)
            Center(
              child: GestureDetector(
                onTap: isEditMode ? _pickImage : null,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: kgoldColor),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: editedImage != null
                              ? Image.file(editedImage!, fit: BoxFit.cover)
                              : Image.asset(
                                  widget.product["image"][0],
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    if (isEditMode)
                      const Positioned(
                        bottom: 10,
                        right: 10,
                        child: Icon(
                          Icons.camera_alt,
                          color: kgoldColor,
                          size: 22,
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// TITLE (Editable)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: isEditMode
                  ? TextField(
                      controller: nameCtrl,
                      style: GoogleFonts.poppins(
                        color: isDark ? kwhiteColor : kblackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: _inputDecoration("Product Name"),
                    )
                  : Text(
                      nameCtrl.text,
                      style: GoogleFonts.poppins(
                        color: isDark ? kwhiteColor : kblackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),

            /// PRICE (Not editable)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: isEditMode
                  ? TextField(
                      controller: priceCtrl,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kgoldColor,
                      ),
                      decoration: _inputDecoration("Price"),
                    )
                  : Text(
                      priceCtrl.text,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kgoldColor,
                      ),
                    ),
            ),

            Divider(color: CupertinoColors.opaqueSeparator),

            /// DESCRIPTION (Editable)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Description",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: isDark ? kwhiteColor : kblackColor,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: isEditMode
                  ? TextField(
                      controller: descCtrl,
                      maxLines: 4,
                      style: GoogleFonts.poppins(
                        color: isDark ? kwhiteColor : kblackColor,
                      ),
                      decoration: _inputDecoration("Description"),
                    )
                  : Text(
                      descCtrl.text,
                      style: GoogleFonts.poppins(
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Available",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: isDark ? kwhiteColor : kblackColor,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: isEditMode
                  ? TextField(
                      controller: availableCtrl,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.poppins(
                        color: isDark ? kwhiteColor : kblackColor,
                      ),
                      decoration: _inputDecoration("Available Quantity"),
                    )
                  : Text(
                      availableCtrl.text,
                      style: GoogleFonts.poppins(
                        color: isDark ? kwhiteColor : kblackColor,
                      ),
                    ),
            ),

            if (isEditMode)
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text('Online'),
                      value: 'online',
                      groupValue: status,
                      activeColor: kgoldColor,
                      onChanged: (value) => setState(() => status = value!),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text('Offline'),
                      value: 'offline',
                      groupValue: status,
                      activeColor: kgoldColor,

                      onChanged: (value) => setState(() => status = value!),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: isEditMode
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: _saveChanges,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: kgoldColor, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Save Changes",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: kgoldColor,
                    ),
                  ),
                ),
              ),
            )
          : null,

      // if (isEditMode)
      //       bottomNavigationBar: Padding(
      //         padding: const EdgeInsets.all(16),
      //         child: SizedBox(
      //           height: 50,
      //           child: OutlinedButton(
      //             onPressed: () {
      //               isEditMode ? _saveChanges() : _confirmOrder();
      //             },
      //             style: OutlinedButton.styleFrom(
      //               side: const BorderSide(color: kgoldColor, width: 1.5),
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(12),
      //               ),
      //             ),
      //             child: Text(
      //               isEditMode ? "Save Changes" : "Confirm Order",
      //               style: GoogleFonts.poppins(
      //                 fontWeight: FontWeight.w600,
      //                 color: kgoldColor,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: kgoldColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: kgoldColor, width: 2),
      ),
    );
  }

  void _saveChanges() {
    setState(() {
      isEditMode = false;

      widget.product["price"] = priceCtrl.text;
      widget.product["available"] = int.tryParse(availableCtrl.text) ?? 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Changes saved successfully"),
        backgroundColor: kgoldColor,
      ),
    );
  }
}
