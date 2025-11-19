import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/model/chat_messages.dart';
import 'package:intl/intl.dart';

class ChatDetailSendItem extends StatelessWidget {
  const ChatDetailSendItem({required this.message});

  final ChatMessages message;

  //날짜 포맷팅 함수 (로케일 없이)
  String _formatDateTime(DateTime dateTime) {
    // 로케일 없이 간단한 포맷 사용
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    final formatted = dateFormat.format(dateTime);

    // 한국어로 변환
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final amPm = hour < 12 ? '오전' : '오후';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

    return '${dateTime.year}년 ${dateTime.month}월 ${dateTime.day}일 $amPm $displayHour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(message.content, style: TextStyle(fontSize: 13)),
        ),
        Text(
          _formatDateTime(message.createdAt),
          style: TextStyle(fontSize: 11, color: Colors.black45),
        ),
      ],
    );
  }
}
