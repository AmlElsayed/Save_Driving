import 'package:flutter/material.dart';
class ContainerClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
var path=Path();
path.moveTo(0, 20);
path.quadraticBezierTo(size.width-150, 0, size.width-220, size.height-200);
path.quadraticBezierTo(size.width-250,size.height-100, size.width-130, size.height-100);
path.quadraticBezierTo(size.width-20,size.height-90, size.width-50, size.height-50);
path.quadraticBezierTo(size.width-150,size.height-20, size.width+10, size.height-10);
path.lineTo(size.width, size.width);
path.lineTo(0, size.height);
return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)=>false;
}