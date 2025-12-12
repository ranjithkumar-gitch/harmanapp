import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Cart/cartManager.dart';
import 'package:harmanapp/Cart/Cartpage.dart';
import 'package:harmanapp/Notifications/notifications.dart';

class InstagramTopBar extends StatefulWidget
    implements ObstructingPreferredSizeWidget {
  const InstagramTopBar({super.key});

  @override
  State<InstagramTopBar> createState() => _InstagramTopBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 50);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}

class _InstagramTopBarState extends State<InstagramTopBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: CupertinoColors.black,
      border: Border.all(style: BorderStyle.none),

      leading: Text(
        'Harman App',
        style: GoogleFonts.greatVibes(
          textStyle: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFFF5D778),
          ),
        ),
      ),

      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.bell,
              color: Color(0xFFF5D778),
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NotificationsPage()),
              );
            },
          ),

          const SizedBox(width: 10),

          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  CupertinoIcons.cart,
                  color: Color(0xFFF5D778),
                  size: 30,
                ),

                if (CartManager.cartItems.isNotEmpty)
                  Positioned(
                    right: -5,
                    top: -5,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        CartManager.cartItems.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () async {
              // navigate to cart
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartPage()),
              );

              // refresh badge on return
              setState(() {});
            },
          ),

          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
