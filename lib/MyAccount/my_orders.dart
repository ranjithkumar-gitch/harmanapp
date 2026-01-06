import 'package:flutter/material.dart';
import 'package:harmanapp/MyAccount/my_product_view.dart';
import 'package:harmanapp/MyAccount/viewproduct.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  int selectedIndex = -1;
  static const gold = kgoldColor;
  int tappedIndex = -1;

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
            index: index,
            // onViewPressed: () {
            //   setState(() {
            //     selectedIndex = isSelected ? -1 : index;
            //   });
            // },
          );
        },
      ),
    );
  }

  Widget amazonOrderCard({
    required Map<String, dynamic> order,
    required bool isSelected,
    // required VoidCallback onViewPressed,
    required int index,
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
        borderRadius: BorderRadius.circular(radius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.black,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: headerItem("ORDER PLACED", order["orderDate"]),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: headerItem("ITEMS", products.length.toString()),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      // child: actionButton(
                      //   "View Order",
                      //   isSelected,
                      //   onPressed: onViewPressed,
                      // ),
                      child: actionButton(
                        "View Order",
                        onPressed: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ViewProduct(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MyProductView(), // <-- your second page
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Divider(color: gold, thickness: 1),
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
                        // Text(
                        //   order["status"],
                        //   style: const TextStyle(
                        //     fontSize: 18,
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        Container(
                          padding: const EdgeInsets.all(
                            8,
                          ), // optional, makes border look nicer
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: gold, // border color
                              width: 1, // border width
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // optional rounded corners
                          ),
                          child: Text(
                            order["status"],
                            style: const TextStyle(
                              fontSize: 14,
                              color: gold,
                              fontWeight: FontWeight.w400,
                            ),
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
                                          color: Colors.white,
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

  // Widget actionButton(
  //   String text,
  //   bool isSelected, {
  //   required VoidCallback onPressed,
  // }) {
  //   return Container(
  //     width: double.infinity,
  //     // margin: const EdgeInsets.only(bottom: 10),
  //     child: OutlinedButton(
  //       onPressed: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute<void>(builder: (context) => const ViewProduct()),
  //         );
  //       },
  //       style: OutlinedButton.styleFrom(
  //         foregroundColor: gold,
  //         side: BorderSide(color: gold),
  //         padding: const EdgeInsets.symmetric(vertical: 10),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //       ),
  //       child: Text(text),
  //     ),
  //   );
  // }
  Widget actionButton(String text, {required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: gold,
          side: BorderSide(color: gold),
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
