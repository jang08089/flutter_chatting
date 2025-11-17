import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chatting/data/model/chat_room.dart';
import 'package:flutter/foundation.dart';

class ChatDetailRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // roomId로 ChatRoom 정보 가져오기
  Future<ChatRoom?> getChatRoom(String roomId) async {
    try {
      final doc = await _firestore
          .collection('chat_rooms')
          .doc(roomId)
          .get();

      if (!doc.exists) {
        debugPrint('❌ ChatRoom이 존재하지 않습니다: $roomId');
        return null;
      }

      final data = doc.data()!;
      return ChatRoom.fromJson({
        'id': doc.id,
        ...data,
      });
    } catch (e) {
      throw Exception('ChatRoom 가져오기 오류: $e');
    }
  }
}