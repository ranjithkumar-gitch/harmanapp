import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Cart/cart_manager.dart';

import 'package:harmanapp/Dashboard/main_screen.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:lottie/lottie.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double calculateTotalPrice() {
    double total = 0;

    for (var item in CartManager.cartItems) {
      String priceString = item["product"]["price"].replaceAll('\$', '');
      double price = double.tryParse(priceString) ?? 0;

      total += (price * item["quantity"]);
    }

    return total;
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
          "Your Cart",
          style: TextStyle(
            color: kgoldColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      body: CartManager.cartItems.isEmpty
          ? Center(
              child: Text(
                "No items in cart",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Brightness.dark == Theme.of(context).brightness
                      ? kwhiteColor
                      : kblackColor,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: 80),
              itemCount: CartManager.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = CartManager.cartItems[index];
                final product = cartItem["product"];
                final quantity = cartItem["quantity"];

                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFD4AF37),
                      width: 1.5,
                    ),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      product["image"][0],
                      width: 55,
                      height: 55,
                      fit: BoxFit.fitHeight,
                    ),

                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product["name"],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color:
                                Brightness.dark == Theme.of(context).brightness
                                ? kwhiteColor
                                : kblackColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              // CartManager.cartItems.removeAt(index);
                              CartManager.removeFromCart(index);
                            });
                          },
                          icon: Icon(
                            Icons.delete_outline,
                            color: Color(0xFFD4AF37),
                            size: 26,
                          ),
                        ),
                      ],
                    ),

                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFD4AF37)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (cartItem["quantity"] > 1) {
                                      cartItem["quantity"]--;
                                    } else {
                                      // CartManager.cartItems.removeAt(index);
                                      CartManager.removeFromCart(index);
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Color(0xFFD4AF37),
                                ),
                              ),
                              Text(
                                quantity.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Color(0xFFD4AF37),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    cartItem["quantity"]++;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Color(0xFFD4AF37),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 10),

                        Text(
                          product["price"],
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color:
                                Brightness.dark == Theme.of(context).brightness
                                ? kwhiteColor
                                : kblackColor,

                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

      bottomNavigationBar: CartManager.cartItems.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 80,
                padding: const EdgeInsets.all(12),
                // decoration: const BoxDecoration(
                //   color: Colors.black,
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.black12,
                //       blurRadius: 5,
                //       spreadRadius: 2,
                //     ),
                //   ],
                // ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFD4AF37),
                    width: 1.5,
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total: \$${calculateTotalPrice().toStringAsFixed(2)}",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Brightness.dark == Theme.of(context).brightness
                            ? kwhiteColor
                            : kblackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    OutlinedButton(
                      onPressed: () {
                        showPaymentMethods(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        side: const BorderSide(
                          color: Color(0xFFD4AF37), // gold outline
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Buy Now",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFD4AF37), // text matches border
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void showPaymentMethods(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Brightness.dark == Theme.of(context).brightness
          ? kblackColor
          : kwhiteColor,
      context: context,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFFD4AF37), width: 1),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Payment Method",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Brightness.dark == Theme.of(context).brightness
                      ? kwhiteColor
                      : kblackColor,

                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              paymentOption("UPI", Icons.payment),
              const SizedBox(height: 15),
              paymentOption("Credit / Debit Card", Icons.credit_card),
              const SizedBox(height: 15),
              paymentOption("Cash on Delivery", Icons.money),
            ],
          ),
        );
      },
    );
  }

  Widget paymentOption(String text, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        paymentSuccessScreen();
      },

      child: Container(
        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFD4AF37), width: 1),
        ),

        child: Row(
          children: [
            Icon(
              icon,
              color: Brightness.dark == Theme.of(context).brightness
                  ? kwhiteColor
                  : kblackColor,
            ),
            const SizedBox(width: 15),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Brightness.dark == Theme.of(context).brightness
                    ? kwhiteColor
                    : kblackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void paymentSuccessScreen() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (_) => Scaffold(
  //         backgroundColor: Colors.black,
  //         body: Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Lottie.asset("assets/success.json"),

  //               const SizedBox(height: 15),

  //               Text(
  //                 "Payment Successful!",
  //                 style: GoogleFonts.poppins(
  //                   fontSize: 22,
  //                   fontWeight: FontWeight.w600,
  //                   color: Colors.white,
  //                 ),
  //               ),

  //               const SizedBox(height: 10),

  //               Text(
  //                 "Thank you for your purchase.",
  //                 style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
  //               ),
  //               ElevatedButton.icon(
  //                 onPressed: () {
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute<void>(
  //                       builder: (context) => const MainScreen(),
  //                     ),
  //                   );
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   side: BorderSide(color: Colors.orange),
  //                   elevation: 3,
  //                   shadowColor: Colors.orange,
  //                 ),
  //                 icon: Icon(Icons.home, color: Colors.black),
  //                 label: Text(
  //                   "Back to Home",
  //                   style: TextStyle(color: Colors.black),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );

  //   // CartManager.cartItems.clear();
  //     CartManager.clearCart();
  //   setState(() {});
  // }
  void paymentSuccessScreen() {
    // ✅ Clear cart FIRST
    CartManager.clearCart();

    // ✅ Then navigate
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Brightness.dark == Theme.of(context).brightness
              ? kblackColor
              : kwhiteColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/success.json"),
                const SizedBox(height: 15),
                Text(
                  "Payment Successful!",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Brightness.dark == Theme.of(context).brightness
                        ? kwhiteColor
                        : kblackColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Thank you for your purchase.",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Brightness.dark == Theme.of(context).brightness
                        ? kwhiteColor
                        : kblackColor,
                  ),
                ),

                SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MainScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    side: const BorderSide(
                      color: Color(0xFFD4AF37),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  child: Text(
                    "Back to Home",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFD4AF37),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
