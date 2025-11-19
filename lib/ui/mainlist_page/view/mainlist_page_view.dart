import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_chatting/ui/chat_page/view/chat_page_view.dart';
import 'package:flutter_chatting/ui/chatlist_page/view/chat_list_view.dart';
import 'package:flutter_chatting/ui/mainlist_page/view/filtering_dropdown_box.dart';
import 'package:flutter_chatting/ui/mainlist_page/view_model/mainlist_page_view_model.dart';
import 'package:flutter_chatting/widgets/profile_box.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainListPageView extends HookConsumerWidget {
  const MainListPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 필터링 위한 변수들 (Hooks)
    final selectedGender = useState<bool?>(null); // null = 성별(전체)
    final selectedExercise = useState("운동");

    // ViewModel 구독 (RiverPod)
    final mainlistVM = ref.watch(mainlistPageViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        // 내 동네 표시
        title: mainlistVM.when(
          data: (data) => Center(child: Text(data["fullNm"])),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text("주소 조회 실패")),
        ),
        actions: [
          // 대화중인 사람 목록으로 이동 버튼
          IconButton(
            icon: Icon(Icons.chat_bubble_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatListPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 15,
          children: [
            Row(
              spacing: 20,
              children: [
                // 성별 필터링 dropdown
                FilteringDropdownButton(
                  value: selectedGender.value == null
                      ? "성별"
                      : (selectedGender.value! ? "남자" : "여자"),
                  itemsList: ["성별", "남자", "여자"],
                  onChanged: (value) {
                    if (value == "성별") {
                      selectedGender.value = null;
                    } else if (value == "남자") {
                      selectedGender.value = true;
                    } else if (value == "여자") {
                      selectedGender.value = false;
                    }
                  },
                ),
                // 운동 필터링 dropdown
                FilteringDropdownButton(
                  value: selectedExercise.value,
                  itemsList: ["운동", "러닝", "게임", "헬스", "등산", "자전거"],
                  onChanged: (value) {
                    if (value != null) selectedExercise.value = value;
                  },
                ),
              ],
            ),
            Expanded(
              child: mainlistVM.when(
                data: (data) {
                  final profiles = data["profiles"] as List<Profile>;

                  // 필터링 적용
                  final filtered = profiles.where((p) {
                    final genderMatch = selectedGender.value == null
                        ? true
                        : (selectedGender.value!
                              ? p.isMale == true
                              : p.isMale == false);

                    final sportMatch =
                        selectedExercise.value == "운동" ||
                        p.sport == selectedExercise.value;

                    return genderMatch && sportMatch;
                  }).toList();

                  if (filtered.isEmpty) {
                    return Center(
                      child: Text("검색결과가 없습니다", style: TextStyle(fontSize: 20)),
                    );
                  }
                  // 나와 같은 동네 + 필터링 된 리스트 화면에 뿌리기
                  return ListView.separated(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final p = filtered[index];
                      // 목록 탭하면 대화 페이지로 이동
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPageView(
                                //roomId:
                                opponentId: p.id!
                              ),
                            ),
                          );
                        },
                        child: ProfileBox(
                          nickname: p.nickname,
                          isMale: p.isMale,
                          sport: p.sport,
                          userId: p.id!,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  );
                },
                loading: () => Center(child: CircularProgressIndicator()),
                error: (e, st) => Center(child: Text('Error: $e')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
