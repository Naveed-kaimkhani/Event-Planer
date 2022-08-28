import 'package:flutter/material.dart';

class SlandingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height-50);
    // path.cubicTo(size.width/4, size.height * 0.35);
    // path.lineTo(size.width, 0);
    path.quadraticBezierTo(
        size.width * 0.5, size.height - 80, size.width, size.height);

    path.lineTo(size.width, 0);
    // path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}