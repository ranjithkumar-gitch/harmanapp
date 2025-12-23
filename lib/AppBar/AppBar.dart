import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Cart/CartManager.dart';
import 'package:harmanapp/Cart/Cartpage.dart';
import 'package:harmanapp/MyAccount/my_account.dart';

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
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (context) => const MyAccount()),
            );
          },
          child: Container(
            width: 35.0,
            height: 35.0,

            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFF5D778)),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Icon(
                Icons.person_2_outlined,
                color: Color(0xFFF5D778),
                size: 24.0,
              ),
            ),
          ),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // const Icon(
              //   CupertinoIcons.bag,
              //   color: Color(0xFFF5D778),
              //   size: 30,
              // ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFF5D778)),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 28,
                    color: Color(0xFFF5D778),
                  ),
                ),
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
      ],
    );
  }
}
