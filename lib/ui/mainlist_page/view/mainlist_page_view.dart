import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_chatting/ui/chat_page/view/chat_page_view.dart';
import 'package:flutter_chatting/ui/chatlist_page/view/chat_list_view.dart';
import 'package:flutter_chatting/ui/mainlist_page/view/filtering_dropdown_box.dart';
import 'package:flutter_chatting/widgets/profile_box.dart';

class MainListPageView extends StatefulWidget {
  const MainListPageView({super.key});

  @override
  State<MainListPageView> createState() => _MainlistPageState();
}

class _MainlistPageState extends State<MainListPageView> {
  // 리스트 (더미 데이터)
  List<Profile> profiles = [
    Profile(
      nickname: "운동조아",
      isMale: true,
      sport: "자전거",
      fullNm: '',
      emdCd: '',
      createdAt: DateTime.now(),
    ),
    Profile(
      nickname: "헬스비타민",
      isMale: false,
      sport: "헬스",
      fullNm: '',
      emdCd: '',
      createdAt: DateTime.now(),
    ),
  ];

  // 필터링 변수
  bool? selectedGender; // null = 전체, true = 남자, false = 여자
  String selectedExercise = "운동";

  @override
  Widget build(BuildContext context) {
    // 필터링
    final filtered = profiles
        .where(
          (p) =>
              (selectedGender == null || p.isMale == selectedGender) &&
              (selectedExercise == "운동" || p.sport == selectedExercise),
        )
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox.shrink(),
        title: Center(child: Text("부산광역시 동래구 온천동")),
        actions: [
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
          spacing: 10,
          children: [
            Row(
              spacing: 20,
              children: [
                // 성별 필터링 dropdown
                FilteringDropdownButton<bool?>(
                  value: selectedGender,
                  itemsMap: {
                    null: "성별", // 전체
                    true: "남자",
                    false: "여자",
                  },
                  onChanged: (value) => setState(() => selectedGender = value),
                ),
                // 운동 필터링 dropdown
                FilteringDropdownButton<String>(
                  value: selectedExercise,
                  itemsMap: {
                    "운동": "운동",
                    "러닝": "러닝",
                    "게임": "게임",
                    "헬스": "헬스",
                    "등산": "등산",
                    "자전거": "자전거",
                  },
                  onChanged: (value) =>
                      setState(() => selectedExercise = value!),
                ),
              ],
            ),
            // 리스트
            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Text(
                        "조건에 맞는 검색결과가 없습니다",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final p = filtered[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPageView(),
                              ),
                            );
                          },
                          child: ProfileBox(
                            nickname: p.nickname,
                            isMale: p.isMale,
                            sport: p.sport,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
