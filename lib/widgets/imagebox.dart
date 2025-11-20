import 'package:flutter/material.dart';

class Imagebox extends StatelessWidget {
  const Imagebox({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
      ),
      child: Icon(Icons.person, size: (size - 30)),
    );
  }
}
