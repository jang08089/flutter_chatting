import 'package:flutter/material.dart';

class MaleIcon extends StatelessWidget {
  const MaleIcon({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.male, color: Colors.blue, size: size);
  }
}
