import 'package:flutter/material.dart';

class MaleIcon extends StatelessWidget {
  double size;
  MaleIcon({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.male, color: Colors.blue, size: size);
  }
}
