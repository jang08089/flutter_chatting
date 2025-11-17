import 'package:flutter_chatting/data/model/chat_messages.dart';
import 'package:flutter_chatting/data/repository/chat_conversation_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 1. 채팅방 메시지를 스트림으로 제공하는 Provider
final chatMessagesStreamProvider =
    StreamProvider.family<List<ChatMessages>, String>((ref, roomId) {
      final repository = ChatConversationRepository();
      return repository.getChatMessagesStream(roomId);
    });

/// 2. 선택된 채팅방 상태 관리
class ChatConversationState {
  final String roomId;

  ChatConversationState({required this.roomId});

  ChatConversationState copyWith({String? roomId}) {
    return ChatConversationState(roomId: roomId ?? this.roomId);
  }
}

/// 3. 채팅방 선택 상태 관리 Notifier
class ChatConversationViewModel extends Notifier<ChatConversationState> {
  @override
  ChatConversationState build() {
    // 초기 채팅방 ID를 빈 문자열로 설정
    return ChatConversationState(roomId: '');
  }

  /// 채팅방 선택 변경
  void setRoomId(String roomId) {
    state = state.copyWith(roomId: roomId);
  }
}

/// 4. NotifierProvider 등록
final chatConversationViewModelProvider =
    NotifierProvider<ChatConversationViewModel, ChatConversationState>(
      () => ChatConversationViewModel(),
    );
