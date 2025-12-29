import 'package:flutter/material.dart';
import 'package:harmanapp/MyAccount/viewproduct.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  int selectedIndex = -1;
  static const gold = Color(0xFFF5D778);

  final orders = [
    {
      "orderDate": "20 December 2025",
      "total": "₹340.80",
      "status": "Delivered 24 December",
      "products": [
        {"image": "assets/shirt.jpg", "name": "Gold Membership Hoodie"},
        {"image": "assets/shirt.jpg", "name": "Exclusive Creator Mug"},
      ],
    },
    {
      "orderDate": "18 December 2025",
      "total": "₹199.00",
      "status": "Shipping",
      "products": [
        {"image": "assets/shirt.jpg", "name": "Signed Poster"},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "My Orders",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: orders.length,
      //   itemBuilder: (context, index) {
      //     final isSelected = selectedIndex == index;

      //     return GestureDetector(
      //       onTap: () {
      //         setState(() => selectedIndex = index);
      //       },
      //       child: amazonOrderCard(
      //         order: orders[index],
      //         isSelected: isSelected,
      //       ),
      //     );
      //   },
      // ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return amazonOrderCard(
            order: orders[index],
            isSelected: isSelected,
            onViewPressed: () {
              setState(() {
                // Toggle the selected index
                selectedIndex = isSelected ? -1 : index;
              });
            },
          );
        },
      ),
    );
  }

  Widget amazonOrderCard({
    required Map<String, dynamic> order,
    required bool isSelected,
    required VoidCallback onViewPressed,
  }) {
    final products = order["products"] as List;
    const radius = 12.0;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: gold, width: 1.5),
      ),
      child: ClipRRect(
        // ⭐ THIS FIXES CORNERS
        borderRadius: BorderRadius.circular(radius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black,
              child: Row(
                children: [
                  /// LEFT
                  Expanded(
                    flex: 3,
                    child: headerItem("ORDER PLACED", order["orderDate"]),
                  ),

                  /// CENTER
                  Expanded(
                    flex: 2,
                    child: headerItem("ITEMS", products.length.toString()),
                  ),

                  /// RIGHT (BUTTON)
                  Expanded(
                    flex: 3,
                    child: actionButton(
                      "View Order",
                      isSelected,
                      onPressed: onViewPressed,
                    ),
                  ),
                ],
              ),
            ),

            Divider(
              color: gold,
              thickness: 1,
              // indent: 5,
              // endIndent: 5,
            ),
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order["status"],
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...products.map((product) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  product["image"],
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 12),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        product["name"],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        "Qty: 1",
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget primaryButton(String text, bool isSelected) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: gold,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(text),
      ),
    );
  }

  Widget actionButton(
    String text,
    bool isSelected, {
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => const ViewProduct()),
          );
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: gold,
          side: BorderSide(color: gold),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
