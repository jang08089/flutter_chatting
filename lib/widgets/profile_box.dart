import 'package:flutter/material.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    super.key,
    required this.nickname,
    required this.gender,
    required this.sport,
  });

  final String nickname;
  final String gender;
  final String sport;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nickname,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Row(
            spacing: 10,
            children: [
              Spacer(),
              // 성별
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                height: 25,
                width: 60,
                child: Center(
                  child: Text(gender, style: TextStyle(color: Colors.white)),
                ),
              ),
              // 운동
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                height: 25,
                width: 60,
                child: Center(
                  child: Text(sport, style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
