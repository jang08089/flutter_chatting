import 'package:flutter/material.dart';
import 'package:flutter_chatting/ui/chat_page/view_model/chat_conversation_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatDetailListView extends ConsumerWidget {
  const ChatDetailListView({super.key, required this.roomId});

  final String roomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesAsync = ref.watch(chatMessagesStreamProvider(roomId));

    return Expanded(
      child: messagesAsync.when(
        data: (messages) {
          debugPrint('✅ messages count: ${messages.length}');
          for (var msg in messages) {
            debugPrint(
              'Message ID: ${msg.id}, Sender: ${msg.senderId}, Content: ${msg.content}, CreatedAt: ${msg.createdAt}',
            );
          }
          return ListView.builder(
            itemCount: messages.length,
            reverse: true,
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
