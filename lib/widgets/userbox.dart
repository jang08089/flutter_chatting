import 'package:flutter/material.dart';

class Userbox extends StatelessWidget{
  const Userbox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Row(
        children: [
          Text("닉네임"),
          Icon(Icons.woman),
          Text("헬스")
        ],
      ),
    );
  }
}