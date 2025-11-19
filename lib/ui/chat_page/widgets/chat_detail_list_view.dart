import 'package:flutter/material.dart';
import 'package:flutter_chatting/ui/chat_page/view_model/chat_conversation_view_model.dart';
import 'package:flutter_chatting/ui/chat_page/widgets/chat_detail_receive_item.dart';
import 'package:flutter_chatting/ui/chat_page/widgets/chat_detail_send_item.dart';
import 'package:flutter_chatting/utils/device_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatDetailListView extends ConsumerStatefulWidget {
  const ChatDetailListView({super.key, required this.roomId});

  final String roomId;

  @override
  ConsumerState<ChatDetailListView> createState() => _ChatDetailListViewState();
}

class _ChatDetailListViewState extends ConsumerState<ChatDetailListView> {
  final ScrollController _scrollController = ScrollController();
  int _previousMessageCount = 0;
  String? _myDeviceId; // 내 deviceId 저장
  bool _isLoadingDeviceId = true; // 로딩 상태 추가

  @override
  void initState() {
    super.initState();
    // 초기화 시 deviceId 가져오기
    _loadDeviceId();
  }

  Future<void> _loadDeviceId() async {
    try {
      final deviceId = await getDeviceId();
      if (mounted) {
        setState(() {
          _myDeviceId = deviceId;
          _isLoadingDeviceId = false;
        });
      }
    } catch (e) {
      debugPrint('❌ deviceId 가져오기 실패: $e');
      // 예외 발생 시 기본값 설정
      if (mounted) {
        setState(() {
          _myDeviceId = ''; // 빈 문자열로 설정하여 에러 방지
          _isLoadingDeviceId = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 스크롤을 맨 아래로 이동
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final messagesAsync = ref.watch(chatMessagesStreamProvider(widget.roomId));

    final bottomSheetHeight = 70.0 + MediaQuery.of(context).padding.bottom;

    return Expanded(
      child: messagesAsync.when(
        data: (messages) {
          // 메시지가 추가되었는지 확인
          if (messages.length > _previousMessageCount) {
            // 빌드가 완료된 후 스크롤 이동
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollToBottom();
            });
            _previousMessageCount = messages.length;
          }

          // deviceId가 아직 로드 중이면 로딩 표시
          if (_isLoadingDeviceId || _myDeviceId == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.only(bottom: bottomSheetHeight),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final msg = messages[index];
              
              // senderId와 내 deviceId 비교
              final isMyMessage = msg.senderId == _myDeviceId;
              
              // 내가 보낸 메시지면 오른쪽 (SendItem), 받은 메시지면 왼쪽 (ReceiveItem)
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: isMyMessage
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: ChatDetailSendItem(message: msg),
                      )
                    : ChatDetailReceiveItem(message: msg),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) {
          debugPrint('❌ 메시지 로드 오류: $e');
          return Center(child: Text('Error: $e'));
        },
      ),
    );
  }
}
