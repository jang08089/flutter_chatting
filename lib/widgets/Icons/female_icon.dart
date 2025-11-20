import 'package:flutter/material.dart';

class FemaleIcon extends StatelessWidget {
  const FemaleIcon({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.female, color: Colors.pink[200], size: size);
  }
}
