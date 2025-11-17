

import 'package:flutter/material.dart';
import 'package:flutter_chatting/ui/chat_page/widgets/chat_detail_receive_item.dart';
import 'package:flutter_chatting/ui/chat_page/widgets/chat_detail_send_item.dart';
import 'package:flutter_chatting/data/model/chat_messages.dart'; 

class ChatDetailListView extends StatelessWidget{

  const ChatDetailListView({
    super.key,
    required this.roomId,
  });

  final String roomId;

  @override
  Widget build(BuildContext context) {

    final children = [
          ChatDetailReceiveItem(
            message: ChatMessages(  
              id: '1',
              roomId: 'room1',
              senderId: 'other',
              content: '안녕하세요',
              createdAt: DateTime.now(),
            ),
          ),
          ChatDetailReceiveItem(
            message: ChatMessages(  
              id: '2',
              roomId: 'room1',
              senderId: 'other',
              content: '어디 헬스장다니세요?',
              createdAt: DateTime.now(),
            ),
          ),
          ChatDetailSendItem(
            message: ChatMessages(
              id: '3',
              roomId: 'room1',
              senderId: 'me',  // 내 ID
              content: '네 안녕하세요',
              createdAt: DateTime.now(),
            ),
          ),
          ChatDetailSendItem(
            message: ChatMessages(
              id: '3',
              roomId: 'room1',
              senderId: 'me',  // 내 ID
              content: '00짐 다녀요',
              createdAt: DateTime.now(),
            ),
          )
        ];

    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: children.length,
        separatorBuilder:(context, index) => SizedBox(height: 4,),
        itemBuilder: (context, index) {
          return children[index];
        }, 
      ),  
    );
  }
}
