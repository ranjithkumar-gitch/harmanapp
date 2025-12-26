import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/MyAccount/viewproduct.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  int selectedIndex = -1; // No card selected initially
  static const gold = Color(0xFFF5D778);

  @override
  Widget build(BuildContext context) {
    final orders = [
      {"image": "assets/shirt.jpg", "name": "Gold Membership Hoodie"},
      {"image": "assets/shirt.jpg", "name": "Exclusive Creator Mug"},
      {"image": "assets/shirt.jpg", "name": "Signed Poster"},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "My Orders",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index; // toggle selection
              });
            },
            child: orderCard(
              image: order["image"]!,
              productName: order["name"]!,
              isSelected: isSelected,
              onView: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewProduct()),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget orderCard({
    required String image,
    required String productName,
    required bool isSelected,
    required VoidCallback onView,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CupertinoColors.darkBackgroundGray,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? gold : Colors.white, // Gold if selected
          width: 1.6,
        ),
      ),
      child: Row(
        children: [
          /// 🖼 Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, height: 70, width: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 14),

          /// 📦 Product Name
          Expanded(
            child: Text(
              productName,
              style: TextStyle(
                color: isSelected ? gold : Colors.white,
                fontSize: 16,
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          /// 👉 View Product Button (only show if selected)
          if (isSelected)
            OutlinedButton(
              onPressed: onView,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: gold),
                foregroundColor: gold,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("View", style: TextStyle(fontSize: 12)),
            ),
        ],
      ),
    );
  }
}
