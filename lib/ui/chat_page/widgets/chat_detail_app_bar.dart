import 'package:flutter/material.dart';

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
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 닉네임
          Text(
            nickname,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          // 성별 + 운동
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 성별
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  gender,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              // 운동
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  sport,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: const [
        SizedBox(width: 56), // 뒤로가기 IconButton width=56
      ],
    );
  
  }
}