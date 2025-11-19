import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chatting/data/model/profile.dart';

class ChatRoomRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // C 새로운 Chatroom, roomId 생성하기
  Future<String?> createChatRoom(Profile me, Profile opponent) async {
    try {
      // 내 id + 상대방 id 로 roomId 생성 > 정렬로 중복 방지
      final memberIds = [me.id, opponent.id]..sort();
      final roomId = "${memberIds[0]}_${memberIds[1]}";

      // 나 자신과는 생성 안되게 방지
      if (me.id == opponent.id) {
        return null;
      }

      // 이미 존재하는지 확인
      final existingDoc = await _firestore
          .collection('chat_rooms')
          .doc(roomId)
          .get();

      // 이미 있으면 그대로 반환
      if (existingDoc.exists) {
        return roomId;
      }

      // 없으면 새로 생성
      await _firestore.collection('chat_rooms').doc(roomId).set({
        "member_ids": memberIds,
        "created_at": DateTime.now().toIso8601String(),
        "updated_at": DateTime.now().toIso8601String(),
        "member_info": {
          "${me.id}": {
            "nickname": me.nickname,
            "isMale": me.isMale,
            "sport": me.sport,
          },
          "${opponent.id}": {
            "nickname": opponent.nickname,
            "isMale": opponent.isMale,
            "sport": opponent.sport,
          },
        },
      });
      // roomId 반환
      return roomId;
    } catch (e) {
      return null;
    }
  }
}
