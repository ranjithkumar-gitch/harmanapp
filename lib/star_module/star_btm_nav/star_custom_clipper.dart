import 'package:flutter/cupertino.dart';

class StarNavCustomClipper extends CustomClipper<Rect> {
  final double deviceHeight;

  StarNavCustomClipper({required this.deviceHeight});

  @override
  Rect getClip(Size size) {
    //Clip only the bottom of the widget
    return Rect.fromLTWH(
      0,
      -deviceHeight + size.height,
      size.width,
      deviceHeight,
    );
  }

  @override
  bool shouldReclip(StarNavCustomClipper oldClipper) {
    return oldClipper.deviceHeight != deviceHeight;
  }
}
