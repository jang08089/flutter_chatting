import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chatting/data/model/chat_room.dart';

class ChatListRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// deviceId를 기준으로 내가 속한 채팅방 목록 조회
  Stream<List<ChatRoom>> getChatRoomsByDeviceId(String deviceId) {
    return _firestore
        .collection('chat_rooms')
        .where('member_ids', arrayContains: deviceId)
        .orderBy('updated_at', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ChatRoom.fromJson({...doc.data(), "id": doc.id});
      }).toList();
    });
  }
}