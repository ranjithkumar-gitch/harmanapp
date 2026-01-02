import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Cart/CartManager.dart';
import 'package:harmanapp/Cart/Cartpage.dart';
import 'package:harmanapp/MyAccount/my_account.dart';
import 'package:harmanapp/widgets/colors.dart';

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
      backgroundColor: kblackColor,
      elevation: 1,
      centerTitle: false,

      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: kblackColor,
        statusBarIconBrightness: Brightness.light,
      ),

      title: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFF5D778)),
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('assets/App_logo_2.jpeg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          SizedBox(width: 10),
          Text(
            'My Autobiography',
            style: GoogleFonts.greatVibes(
              textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: kgoldColor,
              ),
            ),
          ),
        ],
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
            decoration: BoxDecoration(
              border: Border.all(color: kgoldColor),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(Icons.person_2_outlined, size: 24, color: kgoldColor),
            ),
          ),
        ),
        SizedBox(width: 5),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kgoldColor),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 24,
                    color: kgoldColor,
                  ),
                ),
              ),

              ValueListenableBuilder<int>(
                valueListenable: CartManager.cartCount,
                builder: (context, count, _) {
                  if (count == 0) return const SizedBox();

                  return Positioned(
                    right: -10,
                    top: -10,
                    // child: Container(
                    //   padding: const EdgeInsets.all(4),
                    //   decoration: const BoxDecoration(
                    //     color: Colors.red,
                    //     shape: BoxShape.circle,
                    //   ),
                    //   child: Text(
                    //     count.toString(),
                    //     style: const TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 12,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black, // background
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kgoldColor, // gold border
                          width: 2,
                        ),
                      ),
                      child: Text(
                        count.toString(),
                        style: const TextStyle(
                          color: kgoldColor, // gold number
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
        SizedBox(width: 6),
      ],
    );
  }
}
