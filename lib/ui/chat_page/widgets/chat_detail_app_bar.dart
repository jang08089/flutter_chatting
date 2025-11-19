import 'package:flutter/material.dart';
import 'package:flutter_chatting/core/app_theme.dart';
import 'package:flutter_chatting/widgets/Icons/female_icon.dart';
import 'package:flutter_chatting/widgets/Icons/male_icon.dart';

class ChatDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatDetailAppBar({
    super.key,
    required this.nickname,
    required this.gender,
    required this.sport,
  });

  final String nickname;
  final String gender;
  final String sport;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      //뒤로가기 버튼
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, size: 28),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 20),
          // 닉네임
          Text(nickname, style: const TextStyle(fontSize: 23)),
          const SizedBox(height: 4),

          // 성별
          if (gender == "남자") MaleIcon(size: 30),
          if (gender == "여자") FemaleIcon(size: 30),
          const SizedBox(width: 6),
          // 운동
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: point,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(sport, style: TextStyle(color: text, fontSize: 15)),
          ),
        ],
      ),
      actions: const [
        SizedBox(width: 56), // 뒤로가기 IconButton width=56
      ],
    );
  }
}
