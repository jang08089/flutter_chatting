import 'package:flutter/material.dart';

class FemaleIcon extends StatelessWidget {
  double size;
   FemaleIcon({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.female, color: Colors.pink[200],size: size,);
  }
}
