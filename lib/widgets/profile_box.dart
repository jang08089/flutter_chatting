import 'package:flutter/material.dart';
import 'package:flutter_chatting/core/app_theme.dart';
import 'package:flutter_chatting/widgets/icons/female_icon.dart';
import 'package:flutter_chatting/widgets/icons/male_icon.dart';
import 'package:flutter_chatting/widgets/imagebox.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    super.key,
    required this.nickname,
    required this.isMale,
    required this.sport,
    required this.userId,
  });

  final String nickname;
  final bool isMale;
  final String sport;
  final String userId;

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
              Text(nickname, style: TextStyle(fontSize: 20)),
              SizedBox(width: 5),
              isMale ? MaleIcon(size: 25) : FemaleIcon(size: 25),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: point,
                ),
                child: Center(
                  child: Text(
                    sport,
                    style: TextStyle(color: text, fontSize: 17),
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
