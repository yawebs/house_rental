import 'package:flutter/material.dart';

class topCustomShapeClip extends CustomClipper<Path>{
  @override
Path getClip(Size size) {
    final Path path =Path();
    path.lineTo(0.0, size.height);
    var pathFirstEndPoint = Offset(size.width *0.5, size.height-30.0);
    var pathFirstControllPoint = Offset(size.width *0.25, size.height-50.0);
    path.quadraticBezierTo(pathFirstControllPoint.dx, pathFirstControllPoint.dy, pathFirstEndPoint.dx, pathFirstEndPoint.dy);
    var pathSecond = Offset(size.width, size.height -80.0);
    var pathSeconControl= Offset(size.width *.75, size.height-10);
    path.quadraticBezierTo(pathSeconControl.dx, pathSeconControl.dy, pathSecond.dx, pathSecond.dy);
    
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) =>true;
  


}