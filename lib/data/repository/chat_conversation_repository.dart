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
        .orderBy('created_at', descending: false) // 오래된 것부터 (최신이 아래)
        .snapshots()
        .map((snapshot) {
          // 스트림 업데이트 확인용 로그
          debugPrint('🔄 스트림 업데이트! 문서 개수: ${snapshot.docs.length}');

          final messages = snapshot.docs.map((doc) {
            final data = doc.data();

            final createdAtValue = data['created_at'];
            DateTime createdAt;
            if (createdAtValue is Timestamp) {
              createdAt = createdAtValue.toDate();
            } else if (createdAtValue is String) {
              createdAt = DateTime.parse(createdAtValue);
            } else {
              createdAt = DateTime.now();
            }

            return ChatMessages(
              id: data['id'] ?? doc.id,
              roomId: data['room_id'] ?? roomId,
              senderId: data['sender_id'] ?? '',
              content: data['content'] ?? '',
              createdAt: createdAt,
            );
          }).toList();

          return messages;
        });
  }
}
