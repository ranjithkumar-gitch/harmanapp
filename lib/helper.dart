import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstagramTopBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const InstagramTopBar({super.key});

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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 10),
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.bell,
              color: Color(0xFFF5D778),
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
