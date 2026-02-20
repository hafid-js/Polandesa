import 'package:flutter/material.dart';

class UCustomRoundedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Tinggi lengkungan (semakin kecil semakin tipis)
    double curveHeight = 20;

    path.lineTo(0, size.height - curveHeight);

    // Curve tengah bawah (lebih halus & tipis)
    path.quadraticBezierTo(
      size.width / 2, 
      size.height, 
      size.width, 
      size.height - curveHeight,
    );

    // Tutup path ke atas
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
