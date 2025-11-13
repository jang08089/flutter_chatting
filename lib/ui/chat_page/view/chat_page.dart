import 'package:flutter/material.dart';
import 'package:flutter_chatting/widgets/userbox.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.home)),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(bottom: 150),
        itemBuilder: (context, index) {
          return Userbox();
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 10,
      ),
    );
  }
}
