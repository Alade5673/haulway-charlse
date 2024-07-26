// import 'package:flutter/material.dart';

// class CurvedRhombusClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double curveDistance = 25.0;

//     Path path = Path();
//     path.moveTo(size.width / 2, 0);
//     path.quadraticBezierTo(
//       size.width - curveDistance,
//       0,
//       size.width,
//       size.height / 2,
//     );
//     path.quadraticBezierTo(
//       size.width - curveDistance,
//       size.height,
//       size.width / 2,
//       size.height,
//     );
//     path.quadraticBezierTo(curveDistance, size.height, 0, size.height / 2);
//     path.quadraticBezierTo(curveDistance, 0, size.width / 2, 0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => true;
// }

import 'package:flutter/material.dart';

class CurvedRhombusBorder extends OutlinedBorder {
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // Paint the border if needed
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect);
  }

  Path _getPath(Rect rect) {
    double curveDistance = 24.0;
    double width = rect.width;
    double height = rect.height;

    Path path = Path();
    path.moveTo(width / 2, rect.top);
    path.quadraticBezierTo(width - curveDistance, rect.top, width, height / 2);
    path.quadraticBezierTo(width - curveDistance, height, width / 2, height);
    path.quadraticBezierTo(curveDistance, height, rect.left, height / 2);
    path.quadraticBezierTo(curveDistance, rect.top, width / 2, rect.top);
    path.close();

    return path;
  }

  @override
  ShapeBorder scale(double t) {
    return CurvedRhombusBorder();
  }

  @override
  CurvedRhombusBorder copyWith({BorderSide? side}) {
    return CurvedRhombusBorder();
  }
}
