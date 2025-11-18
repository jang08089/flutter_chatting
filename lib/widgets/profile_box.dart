import 'package:flutter/material.dart';
import 'package:flutter_chatting/widgets/Icons/female_icon.dart';
import 'package:flutter_chatting/widgets/Icons/male_icon.dart';
import 'package:flutter_chatting/widgets/imagebox.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    super.key,
    required this.nickname,
    required this.isMale,
    required this.sport,
    required this.userId,  // 🔥 추가됨
  });

  final String nickname;
  final bool isMale;
  final String sport;
  final String userId;     // 🔥 추가됨

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Imagebox(size: 60),
              SizedBox(width: 20),
              Text(
                nickname,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5),
              isMale ? MaleIcon(size: 25) : FemaleIcon(size: 25)
            ],
          ),
          Row(
            spacing: 10,
            children: [
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                height: 25,
                width: 60,
                child: Center(
                  child: Text(
                    sport,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
