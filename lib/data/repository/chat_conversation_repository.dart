import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chatting/data/model/chat_messages.dart';

class ChatConversationRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// 특정 채팅방의 메시지 실시간 구독
  Stream<List<ChatMessages>> getChatMessagesStream(String roomId) {
    return _firestore
        .collection('chat_messages')
        .doc(roomId)
        .collection('messages')
        .snapshots()
        .map((snapshot) {
          final messages = snapshot.docs.map((doc) {
            final data = doc.data();

            // 🔹 created_at 타입 안전 처리
            final createdAtValue = data['created_at'];
            DateTime createdAt;
            if (createdAtValue is Timestamp) {
              createdAt = createdAtValue.toDate();
            } else if (createdAtValue is String) {
              createdAt = DateTime.parse(createdAtValue);
            } else {
              createdAt = DateTime.now(); // fallback
            }

            return ChatMessages(
              id: data['id'] ?? doc.id,
              roomId: data['room_id'] ?? roomId,
              senderId: data['sender_id'] ?? '',
              content: data['content'] ?? '',
              createdAt: createdAt,
            );
          }).toList();

          // 🔹 생성일 기준으로 내림차순 정렬
          messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));

          // 🔹 디버깅용 출력
          debugPrint(
            '📨 ChatMessagesStream - roomId: $roomId, messages count: ${messages.length}',
          );
          for (var msg in messages) {
            debugPrint(
              'Message ID: ${msg.id}, Sender: ${msg.senderId}, Content: ${msg.content}, CreatedAt: ${msg.createdAt}',
            );
          }

          return messages;
        });
  }
}
