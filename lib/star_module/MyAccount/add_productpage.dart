import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? productImage;

  String status = 'online';
  int quantity = 1;

  Future<void> _pickImage() async {
    final img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() => productImage = File(img.path));
    }
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    descCtrl.dispose();
    priceCtrl.dispose();
    super.dispose();
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
          "Add Product",
          style: TextStyle(
            color: kgoldColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kgoldColor, width: 2),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: productImage != null
                            ? FileImage(productImage!)
                            : const AssetImage('assets/jersey5.avif')
                                  as ImageProvider,
                      ),
                    ),
                  ),

                  /// CAMERA ICON
                  Positioned(
                    bottom: -6,
                    right: -6,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: isDark ? kblackColor : kwhiteColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: kgoldColor, width: 1.5),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: kgoldColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Product Name",
                style: GoogleFonts.poppins(
                  // fontWeight: FontWeight.w600,
                  color: isDark ? kwhiteColor : kblackColor,
                ),
              ),
            ),
            SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: nameCtrl,
                decoration: _inputDecoration("Product Name"),
                style: GoogleFonts.poppins(
                  color: isDark ? kwhiteColor : kblackColor,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Price",
                style: GoogleFonts.poppins(
                  // fontWeight: FontWeight.w600,
                  color: isDark ? kwhiteColor : kblackColor,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            //   child: TextField(
            //     controller: priceCtrl,
            //     keyboardType: TextInputType.number,
            //     decoration: _inputDecoration("Price"),
            //     style: GoogleFonts.poppins(
            //       color: isDark ? kwhiteColor : kblackColor,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                controller: priceCtrl,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration("Price").copyWith(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "\$",
                      style: GoogleFonts.poppins(
                        color: kgoldColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                ),
                style: GoogleFonts.poppins(
                  color: isDark ? kwhiteColor : kblackColor,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Description",
                style: GoogleFonts.poppins(
                  // fontWeight: FontWeight.w600,
                  color: isDark ? kwhiteColor : kblackColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                controller: descCtrl,
                maxLines: 4,
                decoration: _inputDecoration("Description"),
                style: GoogleFonts.poppins(
                  color: isDark ? kwhiteColor : kblackColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Available Products",
                style: GoogleFonts.poppins(
                  // fontWeight: FontWeight.w600,
                  color: isDark ? kwhiteColor : kblackColor,
                ),
              ),
            ),
            SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: nameCtrl,
                decoration: _inputDecoration("Available Products"),
                style: GoogleFonts.poppins(
                  color: isDark ? kwhiteColor : kblackColor,
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 50,
          child: OutlinedButton(
            onPressed: _addProduct,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: kgoldColor, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "Add Product",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: kgoldColor,
              ),
            ),
          ),
        ),
      ),
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

  void _addProduct() {
    if (nameCtrl.text.isEmpty ||
        priceCtrl.text.isEmpty ||
        productImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    final newProduct = {
      "name": nameCtrl.text,
      "description": descCtrl.text,
      "price": priceCtrl.text,
      "status": status,
      "image": productImage!.path,
    };

    // TODO: Save to database / API
    Navigator.pop(context, newProduct);
  }
}
