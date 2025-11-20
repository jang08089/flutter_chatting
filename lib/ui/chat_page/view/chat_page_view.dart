import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chatting/ui/chat_page/widgets/chat_detail_app_bar.dart';
import 'package:flutter_chatting/ui/chat_page/widgets/chat_detail_bottom_sheet.dart';
import 'package:flutter_chatting/ui/chat_page/widgets/chat_detail_list_view.dart';

class ChatPageView extends ConsumerWidget {
  const ChatPageView({super.key, required this.opponent, required this.roomId});

  final String roomId;
  final Profile opponent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: ChatDetailAppBar(
          nickname: opponent?.nickname ?? '알 수 없음',
          gender: (opponent?.isMale == null)
              ? '모름'
              : (opponent!.isMale! ? '남자' : '여자'),
          sport: opponent?.sport ?? '모름',
        ),
        body: AnimatedPadding(
          duration: const Duration(milliseconds: 150),
          padding: EdgeInsets.only(bottom: keyboardHeight),
          child: Column(
            children: [
              Expanded(child: ChatDetailListView(roomId: roomId)),
              ChatDetailBottomSheet(
                MediaQuery.of(context).padding.bottom,
                roomId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
