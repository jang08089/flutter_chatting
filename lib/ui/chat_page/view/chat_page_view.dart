

import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_chatting/ui/chat_page/view_model/chat_page_view_model.dart';
import 'package:flutter_chatting/ui/profile_page/view/profile_page_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chatting/ui/chat_page/widgets/chat_detail_app_bar.dart';
import 'package:flutter_chatting/ui/chat_page/widgets/chat_detail_bottom_sheet.dart';
import 'package:flutter_chatting/ui/chat_page/widgets/chat_detail_list_view.dart';

class ChatPageView extends ConsumerWidget{
  const ChatPageView({
    super.key,
    required this.opponent,
    required this.roomId,  // 테스트
    //this.opponentId = 'uid_bbb222',  // 테스트
  });

  final String roomId;
  final Profile opponent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // 상대방 정보 가져오기 (닉네임, 성별, 운동)
    final opponentInfoAsync = ref.watch(
      opponentInfoProvider((roomId: roomId, opponentId: opponent.id!)),
    );

    // 디버그 출력
    opponentInfoAsync.when(
      data: (opponentInfo) {
        debugPrint('🔥 ChatPageView - 상대방 정보:');
        debugPrint('  - roomId: $roomId');
        debugPrint('  - opponentId: $opponent.id');
        debugPrint('  - nickname: ${opponentInfo?.nickname}');
        debugPrint('  - gender: ${opponentInfo?.isMale}');
        debugPrint('  - sport: ${opponentInfo?.sport}');
        return const SizedBox.shrink();
      },
      loading: () {
        debugPrint('🔥 ChatPageView - 로딩 중...');
        return const SizedBox.shrink();
      },
      error: (error, stack) {
        debugPrint('❌ ChatPageView - 오류: $error');
        debugPrint('❌ Stack: $stack');
        return const SizedBox.shrink();
      },
    );

    return opponentInfoAsync.when(
      data: (opponentInfo) {
      final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: ChatDetailAppBar(
              nickname: opponentInfo?.nickname ?? '알 수 없음',
              gender: (opponentInfo?.isMale == null)
                ? '모름'
                : (opponentInfo!.isMale! ? '남자' : '여자'),
              sport: opponentInfo?.sport ?? '모름',
            ),
            body: AnimatedPadding(
              duration: const Duration(milliseconds: 150),
              padding: EdgeInsets.only(bottom:keyboardHeight),
              child: Column(
                children: [
                  Expanded(
                    child: ChatDetailListView(
                      roomId: roomId,
                    ),
                  ),
                  ChatDetailBottomSheet(
                    MediaQuery.of(context).padding.bottom,
                    roomId,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      loading: () => Scaffold(
        appBar: AppBar(
          title: const Text('로딩 중...'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => Scaffold(
        appBar: AppBar(
          title: const Text('오류'),
        ),
        body: Center(
          child: Text('오류 발생: $error'),
        ),
      ),
    );
  }
}