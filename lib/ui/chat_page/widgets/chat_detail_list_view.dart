import 'package:flutter/material.dart';
import 'package:flutter_chatting/ui/chat_page/view_model/chat_conversation_view_model.dart';
import 'package:flutter_chatting/ui/chat_page/widgets/chat_detail_receive_item.dart';
import 'package:flutter_chatting/ui/chat_page/widgets/chat_detail_send_item.dart';
import 'package:flutter_chatting/core/device_id.dart';
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

  //이전 키보드 높이 저장
  double _previousKeyboardHeight = 0;

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

  // 🔥 스크롤을 여러 번 시도하는 함수
  void _scrollToBottomWithRetry() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _scrollController.hasClients) {
        _scrollToBottom();
      } else {
        // 🔥 아직 빌드되지 않았으면 다시 시도
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted && _scrollController.hasClients) {
            _scrollToBottom();
          } else {
            // 🔥 한 번 더 시도
            Future.delayed(const Duration(milliseconds: 100), () {
              if (mounted && _scrollController.hasClients) {
                _scrollToBottom();
              }
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final messagesAsync = ref.watch(chatMessagesStreamProvider(widget.roomId));
    final inputHeight = 70.0;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return messagesAsync.when(
      data: (messages) {
        // 🔥 처음 메시지가 로드될 때 스크롤
        if (_previousMessageCount == 0 && messages.isNotEmpty) {
          _scrollToBottomWithRetry();
          _previousMessageCount = messages.length;
        }

        // 키보드 높이가 변경될 때마다 스크롤 조정
        if (keyboardHeight != _previousKeyboardHeight) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && _scrollController.hasClients) {
              _scrollToBottom();
            }
          });
          _previousKeyboardHeight = keyboardHeight;
        }

        // 메시지가 추가될 때 스크롤
        if (messages.length > _previousMessageCount) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && _scrollController.hasClients) {
              _scrollToBottom();
            }
          });
          _previousMessageCount = messages.length;
        }

        if (_isLoadingDeviceId || _myDeviceId == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
            bottom: keyboardHeight <= 0 ? 0 : inputHeight,
          ),
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
        return Center(child: Text('Error: $e'));
      },
    );
  }
}
