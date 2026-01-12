import 'package:flutter/material.dart';
import 'package:harmanapp/MyAccount/my_product_view.dart';
import 'package:harmanapp/MyAccount/view_product.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class StarMyOrders extends StatefulWidget {
  const StarMyOrders({super.key});

  @override
  State<StarMyOrders> createState() => _StarMyOrdersState();
}

class _StarMyOrdersState extends State<StarMyOrders> {
  static const gold = kgoldColor;

  final orders = [
    {
      "orderDate": "29 December 2025",
      "total": "\$340.80",
      "status": "Delivered",
      "products": [
        {"image": "assets/shirt.jpg", "name": "Gold Membership T-shirt"},
        {"image": "assets/jersey5.avif", "name": "Exclusive Creator Jersey"},
      ],
    },
    {
      "orderDate": "20 December 2025",
      "total": "\$199.00",
      "status": "Shipping",
      "products": [
        {"image": "assets/jersey10.jpg", "name": "Signed Poster"},
      ],
    },
    {
      "orderDate": "19 December 2025",
      "total": "\$167.00",
      "status": "Cancelled",
      "products": [
        {"image": "assets/jersey5.avif", "name": "Signed Poster"},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kblackColor : kwhiteColor,
      appBar: AppBar(
        backgroundColor: isDark ? kblackColor : kwhiteColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: isDark ? kwhiteColor : kblackColor),
        title: Text(
          "My Orders",
          style: TextStyle(
            color: isDark ? kwhiteColor : kblackColor,
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return orderCard(
            context: context,
            order: orders[index],
            index: index,
          );
        },
      ),
    );
  }

  Widget orderCard({
    required BuildContext context,
    required Map<String, dynamic> order,
    required int index,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final products = order["products"] as List;
    const radius = 12.0;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: gold, width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Container(
              padding: const EdgeInsets.all(8),
              color: isDark ? kblackColor : kwhiteColor,
              child: Row(
                children: [
                  Expanded(
                    child: headerItem(
                      "ORDER PLACED",
                      order["orderDate"],
                      isDark,
                    ),
                  ),
                  Expanded(
                    child: headerItem(
                      "ITEMS",
                      products.length.toString(),
                      isDark,
                    ),
                  ),
                  Expanded(
                    child: actionButton(
                      "View Order",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => index == 0
                                ? const ViewProduct()
                                : const MyProductView(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Divider(color: gold, thickness: 1),

            /// BODY
            Container(
              color: isDark ? kblackColor : kwhiteColor,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// STATUS
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: gold),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      order["status"],
                      style: const TextStyle(
                        fontSize: 14,
                        color: gold,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  /// PRODUCTS
                  ...products.map((product) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product["name"],
                                  style: TextStyle(
                                    color: isDark ? kwhiteColor : kblackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Qty: 1",
                                  style: TextStyle(
                                    color: isDark
                                        ? Colors.white70
                                        : Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerItem(String title, String value, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isDark ? kwhiteColor : kblackColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 10,
            color: isDark ? Colors.white70 : Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget actionButton(String text, {required VoidCallback onPressed}) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: gold,
        side: BorderSide(color: gold),
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(text),
    );
  }
}
