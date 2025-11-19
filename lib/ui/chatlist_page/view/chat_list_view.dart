import 'package:flutter/material.dart';
import 'package:flutter_chatting/ui/chat_page/view/chat_page_view.dart';
import 'package:flutter_chatting/ui/chatlist_page/view_model/chat_list_view_model.dart';
import 'package:flutter_chatting/widgets/profile_box.dart';
import 'package:flutter_chatting/ui/mainlist_page/view/mainlist_page_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListPage extends ConsumerStatefulWidget {
  const ChatListPage({super.key});

  @override
  ConsumerState<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends ConsumerState<ChatListPage> {
  @override
  void initState() {
    super.initState();

    /// 🔥 ViewModel 데이터 로딩
    Future.microtask(() {
      ref.read(ChatListPageViewModelProvider.notifier).getChattings();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(ChatListPageViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("채팅 목록"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainListPageView()),
            );
          },
          icon: Icon(Icons.home_outlined, size: 32),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: state.profiles.isEmpty
            ? Center(child: Text("채팅 상대가 없습니다"))
            : ListView.separated(
                padding: const EdgeInsets.only(bottom: 150),
                itemBuilder: (context, index) {
                  final p = state.profiles[index];
                  final r = state.chatrooms[index];

                  debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
                  debugPrint("!!!!!!!!!!![chatrooms #$index]");
                  debugPrint("  - id: ${r.id}");
                 
                  debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

                  // debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
                  debugPrint("📋 [Profile #$index]");
                  debugPrint("  - id: ${p.id}");
                  debugPrint("  - nickname: ${p.nickname}");
                  // debugPrint("  - isMale: ${p.isMale}");
                  // debugPrint("  - sport: ${p.sport}");
                  // debugPrint("  - fullNm: ${p.fullNm}");
                  // debugPrint("  - emdCd: ${p.emdCd}");
                  // debugPrint("  - createdAt: ${p.createdAt}");
                  // debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
                  
                  
                  return GestureDetector(
                    onTap: () {
                      if (p.id == null) {
                        print("⚠️ Profile ID가 null입니다");
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPageView(
                            roomId: r.id,
                            opponentId: p.id!
                          ),
                        ),
                      );
                    },
                    child: ProfileBox(
                      userId: p.nickname, // UI 테스트 용도
                      nickname: p.nickname,
                      isMale: p.isMale,
                      sport: p.sport,
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(indent: 5, endIndent: 5),
                itemCount: state.profiles.length,
              ),
      ),
    );
  }
}
