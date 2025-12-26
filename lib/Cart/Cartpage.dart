import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Cart/CartManager.dart';

import 'package:harmanapp/Dashboard/mainscreen.dart';
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          "Your Cart",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),

      body: CartManager.cartItems.isEmpty
          ? Center(
              child: Text(
                "No items in cart",
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: 80),
              itemCount: CartManager.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = CartManager.cartItems[index];
                final product = cartItem["product"];
                final quantity = cartItem["quantity"];

                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: Image.network(
                      product["image"][0],
                      width: 55,
                      height: 55,
                      fit: BoxFit.cover,
                    ),

                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product["name"],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
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
                            color: Colors.red,
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
                            border: Border.all(color: Colors.grey.shade400),
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
                                icon: const Icon(Icons.remove),
                              ),
                              Text(
                                quantity.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    cartItem["quantity"]++;
                                  });
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 10),

                        Text(
                          product["price"],
                          style: GoogleFonts.poppins(
                            fontSize: 15,
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
          : Container(
              height: 80,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: \$${calculateTotalPrice().toStringAsFixed(2)}",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      showPaymentMethods(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                    ),
                    child: Text(
                      "Buy Now",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void showPaymentMethods(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
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
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              paymentOption(
                "UPI (Google Pay / PhonePe / Paytm)",
                Icons.payment,
              ),
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
          color: Colors.grey.shade200,
        ),

        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            const SizedBox(width: 15),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 15,
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
          backgroundColor: Colors.black,
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
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Thank you for your purchase.",
                  style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MainScreen()),
                    );
                  },
                  icon: const Icon(Icons.home),
                  label: const Text("Back to Home"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
