
import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/model/chat_messages.dart';
import 'package:intl/intl.dart';

class ChatDetailSendItem extends StatelessWidget{

  const ChatDetailSendItem({
    required this.message,
  });

  final ChatMessages message;

  //날짜 포맷팅 함수
  String _formatDateTime(DateTime dateTime) {
    final dateFormat = DateFormat('yyyy년 MM월 dd일 a hh:mm', 'ko_KR');
    return dateFormat.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            message.content,
            style: TextStyle(fontSize: 13),
          ),
        ),
        Text(
          _formatDateTime(message.createdAt),
          style: TextStyle(
            fontSize: 11,
            color: Colors.black45,
          ),
        )
      ],
    );
  }
}