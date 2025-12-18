import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Cart/CartManager.dart';
import 'package:harmanapp/Cart/Cartpage.dart';

class CustomAppBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      elevation: 1,
      centerTitle: false,

      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),

      /// App title
      title: Text(
        'Harman App',
        style: GoogleFonts.greatVibes(
          textStyle: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFFF5D778),
          ),
        ),
      ),

      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            color: Color(0xFFF5D778),
          ),
          onPressed: () {},
        ),
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

              ValueListenableBuilder<int>(
                valueListenable: CartManager.cartCount,
                builder: (context, count, _) {
                  if (count == 0) return const SizedBox();

                  return Positioned(
                    right: -5,
                    top: -5,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        count.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartPage()),
            );
          },
        ),
        // Stack(
        //   clipBehavior: Clip.none,
        //   children: [
        //     IconButton(
        //       icon: const Icon(
        //         Icons.shopping_cart_outlined,
        //         color: Color(0xFFF5D778),
        //       ),
        //       onPressed: () async {
        //         await Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (_) => const CartPage()),
        //         );
        //       },
        //     ),

        //     ValueListenableBuilder<int>(
        //       valueListenable: CartManager.cartCount,
        //       builder: (context, count, _) {
        //         if (count == 0) return const SizedBox.shrink();
        //         return Stack(
        //           clipBehavior: Clip.none,
        //           children: [
        //             IconButton(
        //               icon: const Icon(
        //                 Icons.shopping_cart_outlined,
        //                 color: Color(0xFFF5D778),
        //               ),
        //               onPressed: () async {
        //                 await Navigator.push(
        //                   context,
        //                   MaterialPageRoute(builder: (_) => const CartPage()),
        //                 );
        //               },
        //             ),

        //             if (count > 0)
        //               Positioned(
        //                 right: 4,
        //                 top: 4,
        //                 child: Container(
        //                   padding: const EdgeInsets.all(4),
        //                   decoration: const BoxDecoration(
        //                     color: Colors.red,
        //                     shape: BoxShape.circle,
        //                   ),
        //                   constraints: const BoxConstraints(
        //                     minWidth: 18,
        //                     minHeight: 18,
        //                   ),
        //                   child: Center(
        //                     child: Text(
        //                       count > 99 ? '99+' : count.toString(),
        //                       style: const TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 11,
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //           ],
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
