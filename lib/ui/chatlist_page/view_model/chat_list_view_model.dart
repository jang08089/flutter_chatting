import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/model/chat_room.dart';
import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_chatting/utils/device_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPageState {
  List<Profile> profiles;   // 채팅방 상대 프로필들
  List<ChatRoom> chatrooms; // 채팅방 정보
  ChatPageState({required this.profiles, required this.chatrooms});
}

class ChatPageViewModel extends Notifier<ChatPageState> {
  @override
  ChatPageState build() {
    return ChatPageState(profiles: [], chatrooms: []);
  }

  /// 🔥 Firestore에서 채팅 목록 불러오기
  Future<void> getChattings() async {
    final deviceId = "uid_aaa111";

    //final deviceId = await getDeviceId();

    final snapshot = await FirebaseFirestore.instance
        .collection("chat_rooms")
        .where("member_ids", arrayContains: deviceId)
        .get();

    debugPrint(":불: 불러온 문서 수: ${snapshot.docs.length}");

    List<ChatRoom> rooms = [];
    List<Profile> profiles = [];

    for (var doc in snapshot.docs) {
      final data = doc.data();

      debugPrint("━━━━━━━━━━━━━━━━━━━━");
      debugPrint("Document ID: ${doc.id}");
      debugPrint("전체 데이터: $data");

      // 🔸 ChatRoom 모델 변환
      final room = ChatRoom.fromJson({
        ...data,
        "id": doc.id,
      });
      rooms.add(room);

      // 🔸 상대방 ID 찾기
      final otherId = room.memberIds.firstWhere((id) => id != deviceId);

      // 🔸 member_info에서 상대정보 추출
      final rawJson = room.memberInfo[otherId];

      // ⚠️ 방어 코드: null 체크
      if (rawJson == null) {
        debugPrint("⚠ member_info[$otherId] 가 존재하지 않습니다!");
        continue;
      }

      // ⚠️ Firestore 데이터 보정(JSON 안전보정)
      final profileJson = Map<String, dynamic>.from(rawJson);

      profileJson.putIfAbsent("full_nm", () => "");
      profileJson.putIfAbsent("emd_cd", () => "");
      profileJson.putIfAbsent(
        "created_at",
        () => DateTime.now().toIso8601String(),
      );

      debugPrint("✔ 보정된 JSON: $profileJson");

      // 🔸 Profile 변환
      //final otherProfile = Profile.fromJson(profileJson);
      final otherProfile = Profile.fromJson(profileJson).copyWith(id: otherId);
      profiles.add(otherProfile);
    }

    // 🔥 상태 업데이트
    state = ChatPageState(
      profiles: profiles,
      chatrooms: rooms,
    );
  }
}

final ChatListPageViewModelProvider =
    NotifierProvider<ChatPageViewModel, ChatPageState>(() {
  return ChatPageViewModel();
});
