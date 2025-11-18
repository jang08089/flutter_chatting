import 'package:flutter/material.dart';
import 'package:flutter_chatting/ui/chat_page/view_model/chat_conversation_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatDetailListView extends ConsumerStatefulWidget {
  const ChatDetailListView({super.key, required this.roomId});

  final String roomId;

  @override
  ConsumerState<ChatDetailListView> createState() => _ChatDetailListViewState();
}

class _ChatDetailListViewState extends ConsumerState<ChatDetailListView> {
  final ScrollController _scrollController = ScrollController();
  int _previousMessageCount = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 스크롤을 맨 아래로 이동
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final messagesAsync = ref.watch(chatMessagesStreamProvider(widget.roomId));

    final bottomSheetHeight = 70.0 + MediaQuery.of(context).padding.bottom;

    return Expanded(
      child: messagesAsync.when(
        data: (messages) {
          // 메시지가 추가되었는지 확인
          if (messages.length > _previousMessageCount) {
            // 빌드가 완료된 후 스크롤 이동
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollToBottom();
            });
            _previousMessageCount = messages.length;
          }

          debugPrint('✅ messages count: ${messages.length}');

          return ListView.builder(
            controller: _scrollController,padding: 
            EdgeInsets.only(bottom: bottomSheetHeight), 
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final msg = messages[index];
              return ListTile(
                title: Text(msg.content),
                subtitle: Text(msg.senderId),
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
