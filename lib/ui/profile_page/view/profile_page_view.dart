import 'package:flutter/material.dart';
import 'package:flutter_chatting/core/app_theme.dart';
import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_chatting/data/repository/profile_core_repository.dart';
import 'package:flutter_chatting/ui/mainlist_page/view/mainlist_page_view.dart';
import 'package:flutter_chatting/ui/profile_page/widgets/form_field_row.dart';
import 'package:flutter_chatting/ui/profile_page/view/adress_search_view_model.dart';
import 'package:flutter_chatting/ui/profile_page/view/geolocator_helper.dart';
import 'package:flutter_chatting/ui/profile_page/view/location_Page.dart';
import 'package:flutter_chatting/widgets/imagebox.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePageView extends StatefulWidget {
  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  String? nickname;
  String? gender;
  String? exercise;
  bool hasLocation = false; // 위치 여부 판단
  Future<void> onSendGeo(WidgetRef ref) async {
    final pos = await GeolocatorHelper.getposition();
    if (pos == null) return;
    final lat = pos.latitude;
    final lng = pos.longitude;
    // ViewModel 호출
    final notifier = ref.read(addressSearchViewModelProvider.notifier);
    await notifier.searchByLocation(lat, lng);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: Text(
          "안녕하세요! 헬스메이트입니다\n프로필을 입력하여 회원가입해주세요",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,

        ///키패드 활성화 반응 살림
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsGeometry.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Imagebox(size: 100),
                  // 시작 드롭다운 닉네임, 성별, 운동
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
                      dropdownColor: background,
                      hint: Text("성별"),
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
                      dropdownColor: background,
                      hint: Text("운동"),
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
                  // 드롭다운 닉네임, 성별, 운동
                  SizedBox(height: 20),
                  //  위치정보 가져오기 (주소 표시 포함)
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
                            },
                          ),
                          SizedBox(height: 15),
                          if (fullNm != null)
                            SizedBox(
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  " 현재 위치: $fullNm",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  softWrap: true,
                                ),
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
                          onPressed: () async {
                            if (canJoin) {
                              final isMaleBool = gender == "남성";

                              final profile = Profile(
                                nickname: nickname!,
                                isMale: isMaleBool,
                                sport: exercise!,
                                fullNm: fullNm,
                                emdCd: emdCd,
                                createdAt: DateTime.now(),
                              );

                              // 🔥 Repository 호출
                              final repo = ProfileCoreRepository();
                              await repo.saveProfile(profile);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const MainListPageView(), // 메인 목록 페이지로 이동
                                ),
                              );
                            } else {
                              // canJoin == false 일 때 스낵바 표시
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(
                                    child: Text(
                                      "모든 정보를 입력해주세요",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: canJoin
                                ? Colors.black
                                : Colors.grey,
                          ),
                          child: const Text(
                            "가입하기",
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
