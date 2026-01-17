import 'package:flutter/material.dart';
import 'package:harmanapp/star_module/MyAccount/star_view_mayproduct.dart';

import 'package:harmanapp/star_module/MyAccount/star_view_product.dart';
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
      "status": "New",
      "products": [
        {"image": "assets/huddie.png", "name": "Signed Hoodie"},
        {"image": "assets/signature2.png", "name": "Exclusive Signature"},
      ],
    },
    {
      "orderDate": "20 December 2025",
      "total": "\$199.00",
      "status": "Shipping",
      "products": [
        {"image": "assets/award.png", "name": "Best Actor Replica"},
      ],
    },
    {
      "orderDate": "19 December 2025",
      "total": "\$167.00",
      "status": "Cancelled",
      "products": [
        {"image": "assets/signature.png", "name": "Digtal Signature"},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            "Orders",
            style: TextStyle(
              color: kgoldColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: gold,
            labelColor: gold,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                child: Text(
                  "My Orders",
                  style: TextStyle(
                    color: gold,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Received Orders",
                  style: TextStyle(
                    color: gold,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),

        body: TabBarView(
          children: [
            _ordersList(isReceived: false),
            _ordersList(isReceived: true),
          ],
        ),
      ),
    );
  }

  Widget _ordersList({required bool isReceived}) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return orderCard(
          context: context,
          order: orders[index],
          index: index,
          isReceived: isReceived,
        );
      },
    );
  }

  Widget orderCard({
    required BuildContext context,
    required Map<String, dynamic> order,
    required int index,
    required bool isReceived,
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
              padding: const EdgeInsets.all(10),
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
                                ? StarViewProduct(isReceivedOrder: isReceived)
                                : StarViewMyProduct(
                                    isReceivedOrder: isReceived,
                                  ),
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

  /// VIEW ORDER BUTTON
  Widget actionButton(String text, {required VoidCallback onPressed}) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: gold,
        side: const BorderSide(color: gold),
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(text),
    );
  }
}
