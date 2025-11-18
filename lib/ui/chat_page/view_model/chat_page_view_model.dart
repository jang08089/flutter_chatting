import 'package:flutter_chatting/data/repository/chat_detail_repository.dart';
import 'package:flutter_chatting/utils/device_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chatting/data/model/chat_room.dart';

// Repository Provider
final chatRepositoryProvider = Provider((ref) => ChatDetailRepository());

// ChatRoom Provider (roomId로 가져오기)
final chatRoomProvider = FutureProvider.family<ChatRoom?, String>(
  (ref, roomId) async {
    final repository = ref.watch(chatRepositoryProvider);
    return await repository.getChatRoom(roomId);
  },
);

//전송 프로바이더
final sendMessageProvider = Provider.family<Future<void> Function(String), String>(
  (ref, roomId) {
    final repository = ref.read(chatRepositoryProvider);
    
    // 메시지 전송 함수를 반환
    return (String content) async {
      // 1. 내 ID 가져오기
      final senderId = await getDeviceId();
      
      // 2. Repository의 sendMessage 호출
      await repository.sendMessage(
        roomId: roomId,
        senderId: senderId,
        content: content,
      );
    };
  },
);

// 상대방 정보 모델 (닉네임, 성별, 운동)
class OpponentInfo {
  final String? nickname;
  final bool? isMale;
  final String? sport;

  OpponentInfo({
    this.nickname,
    this.isMale,
    this.sport,
  });
}

// 상대방 정보 받기 (앱바에 표시)
final opponentInfoProvider = FutureProvider.family<
    OpponentInfo?, ({String roomId, String opponentId})>(
  (ref, params) async {
    final chatRoomAsync = ref.watch(chatRoomProvider(params.roomId));

    return chatRoomAsync.when(
      data: (chatRoom) {
        if (chatRoom == null) return null;

        // member_info에서 상대방 정보 가져오기
        if (chatRoom.memberInfo.containsKey(params.opponentId)) {
          final opponentMap =
              chatRoom.memberInfo[params.opponentId] as Map<String, dynamic>?;

          if (opponentMap == null) return null;

          return OpponentInfo(
            nickname: opponentMap['nickname'] as String?,
            isMale: opponentMap['is_male'] as bool?, 
            sport: opponentMap['sport'] as String?,
          );
        }
        return null;
      },
      loading: () => null,
      error: (_, __) => null,
    );
  },

  
);