import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatting/widgets/Icons/female_icon.dart';
import 'package:flutter_chatting/widgets/Icons/male_icon.dart';

class Userbox extends StatelessWidget{
  const Userbox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("닉네임",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          MaleIcon(size: 20),
          Expanded(child: Text("헬스"))
        ],
      ),
    );
  }
}