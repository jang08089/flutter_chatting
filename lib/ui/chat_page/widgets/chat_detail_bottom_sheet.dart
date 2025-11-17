

import 'package:flutter/material.dart';

class ChatDetailBottomSheet extends StatefulWidget{

  ChatDetailBottomSheet(
    this.bottomPadding
  );
  
  final double bottomPadding;

  @override
  State<ChatDetailBottomSheet> createState() => _ChatDetailBottomSheetState();
}

class _ChatDetailBottomSheetState extends State<ChatDetailBottomSheet> {
  final controller = TextEditingController();

  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  void onSend() {
    print('onSend 터치됨');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70 + widget.bottomPadding,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                //Row내에서 TextField 사용할때 가로길이가 정해지지 않으면 에러
                //Expanded로 감싸기
                Expanded(
                  child: TextField(
                    controller: controller,
                    onSubmitted: (v) => onSend(),
                  ),
                ),
                GestureDetector(
                  onTap: onSend,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
                    child: Icon(
                      Icons.send,
                      color: Theme.of(context).highlightColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: widget.bottomPadding),
        ],
      ),
    );
  }
}