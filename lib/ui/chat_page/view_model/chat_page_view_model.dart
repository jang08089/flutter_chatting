import 'package:flutter_chatting/data/repository/chat_detail_repository.dart';
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

// 상대방 정보 모델 (닉네임, 성별, 운동)
class OpponentInfo {
  final String? nickname;
  final String? gender;
  final String? sport;

  OpponentInfo({
    this.nickname,
    this.gender,
    this.sport,
  });
}

// 상대방 정보 Provider (roomId와 opponentId 받기)
final opponentInfoProvider = FutureProvider.family<OpponentInfo?, ({String roomId, String opponentId})>(
  (ref, params) async {
    final chatRoomAsync = ref.watch(chatRoomProvider(params.roomId));
    
    return chatRoomAsync.when(
      data: (chatRoom) {
        if (chatRoom == null) return null;
        
        // member_info에서 상대방 정보 찾기
        if (chatRoom.memberInfo.containsKey(params.opponentId)) {
          final opponentInfo = chatRoom.memberInfo[params.opponentId] as Map<String, dynamic>?;
          
          return OpponentInfo(
            nickname: opponentInfo?['nickname'] as String?,
            gender: opponentInfo?['gender'] as String?, // 추후 추가 예정
            sport: opponentInfo?['sport'] as String?,
          );
        }
        return null;
      },
      loading: () => null,
      error: (_, __) => null,
    );
  },
);