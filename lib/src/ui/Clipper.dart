import 'package:flutter/material.dart';

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(15,15);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.width);
    path.lineTo(size.width, size.width);
    path.lineTo(size.width,0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


