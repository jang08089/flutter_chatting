import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_chatting/data/repository/profile_core_repository.dart';
import 'package:flutter_chatting/ui/mainlist_page/view/mainlist_page_view.dart';
import 'package:flutter_chatting/ui/profile_page/form_field_row.dart';
import 'package:flutter_chatting/ui/profile_page/view/adress_search_view_model.dart';
import 'package:flutter_chatting/ui/profile_page/view/geolocator_helper.dart';
import 'package:flutter_chatting/ui/profile_page/view/location_Page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePageView extends StatefulWidget {
  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  String? nickname;
  String? gender;
  String? exercise;
  bool hasLocation =
      false; // 위치 여부 판단 //////////////////////////////////////////////////////////////////////////////
  Future<void> onSendGeo(WidgetRef ref) async {
    final pos = await GeolocatorHelper.getposition();
    print(":오른쪽을_가리키는_손_모양: $pos");
    if (pos == null) return;
    final lat = pos.latitude;
    final lng = pos.longitude;
    // ViewModel 호출
    final notifier = ref.read(addressSearchViewModelProvider.notifier);
    await notifier.searchByLocation(lat, lng);
    // 상태 확인
    final result = ref.read(addressSearchViewModelProvider);
    print("내 주소 결과 :오른쪽을_가리키는_손_모양: $result");
  }

  @override
  Widget build(BuildContext context) {
    // 1. getpositionr가서 위도 경도를 받아오기 (어떤 변수)
    // 2. 받아온 위도 경도를 serachByLocation  여기로 보내기
    // 3. serachByLocation 반환하는 값이 full_nm, emd cd , 를 받아오기
    // 4. 위치정보 가져오기 버튼을 눌렀을때 밑에 fullnm 뜨게 하기
    // 5. 가입하기 버튼이 지금은 닉네임 성별 운동만 입력하면 활성화가 되는데 위치정보도 제대로 가져왔을때 가입하기 버튼이 활성화 되게하기
    // 6. 가입하기 버튼을 푸쉬할때 입력되 있는 닉네임 성별 운동을 그리고 fullnm end cd를 저 프로필 모델에 맞춰서 컬렉션 파이어베이스 users 안에 add하기
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,

        ///키패드 활성화 반응 살림
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: 320,
              padding: EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "안녕하세요! 헬스메이트입니다\n프로필을 입력하여 회원가입해주세요",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  ////////////////////////////////////////////////////////////////////////시작 드롭다운 닉네임, 성별, 운동****************************************
                  FormFieldRow(
                    label: "닉네임",
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          nickname = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                  FormFieldRow(
                    label: "성별",
                    child: DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(value: "남성", child: Text("남성")),
                        DropdownMenuItem(value: "여성", child: Text("여성")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                  FormFieldRow(
                    label: "운동",
                    child: DropdownButtonFormField(
                      hint: Text("러닝"),
                      items: [
                        DropdownMenuItem(value: "러닝", child: Text("러닝")),
                        DropdownMenuItem(value: "게임", child: Text("게임")),
                        DropdownMenuItem(value: "헬스", child: Text("헬스")),
                        DropdownMenuItem(value: "등산", child: Text("등산")),
                        DropdownMenuItem(value: "자전거", child: Text("자전거")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          exercise = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                  //////////////////////////////////////여기까지 드롭다운 ////////////////////////////드롭다운 닉네임, 성별, 운동
                  SizedBox(height: 20),
                  //  위치정보 가져오기 (주소 표시 포함)/////////////////////////////////////////////////////////////////////////////////////////
                  //  가입하기 버튼 (fullNm / emdCd 포함)
                  Consumer(
                    builder: (context, ref, _) {
                      final addressState = ref.watch(
                        addressSearchViewModelProvider,
                      );
                      final fullNm = addressState.isNotEmpty
                          ? addressState[0]['fullNm']
                          : null;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LocationPage(
                            onTap: () {
                              onSendGeo(ref);
                              print("위치 정보 클릭!");
                            },
                          ),
                          SizedBox(height: 12),
                          if (fullNm != null)
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                " 현재 위치: $fullNm",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap: true,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 40),

                  //  가입하기 버튼 (Consumer 사용하여 모든 조건 체크)
                  Consumer(
                    builder: (context, ref, _) {
                      final addressState = ref.watch(
                        addressSearchViewModelProvider,
                      );

                      final fullNm = addressState.isNotEmpty
                          ? addressState[0]['fullNm'] as String?
                          : null;

                      final emdCd = addressState.isNotEmpty
                          ? addressState[0]['emdCd'] as String?
                          : null;

                      final canJoin =
                          nickname != null &&
                          nickname!.isNotEmpty &&
                          gender != null &&
                          exercise != null &&
                          fullNm != null &&
                          emdCd != null;

                      return SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: canJoin
                              ? () async {
                                  final isMaleBool = gender == "남성";

                                  final profile = Profile(
                                    nickname: nickname!,
                                    isMale: isMaleBool,
                                    sport: exercise!,
                                    fullNm: fullNm!,
                                    emdCd: emdCd!,
                                    createdAt: DateTime.now(),
                                  );

                                  // 🔥 Repository 호출
                                  final repo = ProfileCoreRepository();
                                  await repo.saveProfile(profile);

                                  print("🔥 Firestore 저장 완료");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const MainListPageView(), //네비게이션 혜린님 
                                    ),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: canJoin
                                ? Colors.black
                                : Colors.grey,
                          ),

                          child: const Text(
                            "가입하기",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
