

import 'package:flutter/material.dart';
import 'package:flutter_chatting/ui/chat_page/view_model/chat_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatDetailBottomSheet extends ConsumerStatefulWidget{

  ChatDetailBottomSheet(
    this.bottomPadding,
    this.roomId,
  );
  
  final double bottomPadding;
  final String roomId;

  @override
  ConsumerState<ChatDetailBottomSheet> createState() => _ChatDetailBottomSheetState();
}

class _ChatDetailBottomSheetState extends ConsumerState<ChatDetailBottomSheet> {
  final controller = TextEditingController();

  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  // 메시지 전송 함수
  Future<void> onSend() async {  // async 추가 (시간이 걸리는 작업)
    final content = controller.text.trim();
    
    if (content.isEmpty) {
      return;
    }

    try {
      // ViewModel에서 메시지 전송 함수 가져오기
      final sendMessage = ref.read(sendMessageProvider(widget.roomId));
      
      // 메시지 전송하기
      await sendMessage(content);
      
      // 전송 성공하면 입력창 비우기
      controller.clear();
      
      debugPrint('✅ 메시지 전송 성공');
    } catch (e) {
      debugPrint('❌ 메시지 전송 실패: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
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
          // 🔥 SizedBox 제거 (padding으로 처리)
        ],
      ),
    );
  }
}