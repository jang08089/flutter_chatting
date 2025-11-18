import 'package:flutter/material.dart';

class Imagebox extends StatelessWidget{
  double size;
  Imagebox({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300]
      ),
      child: Icon(Icons.person,size: (size-30),),
    );
  }
}