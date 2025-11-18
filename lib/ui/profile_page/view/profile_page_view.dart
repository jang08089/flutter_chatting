
import 'package:flutter/material.dart';
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

  
  bool get isFormValid {////////////////////////////////////시작하기 버튼 활성화 조건
    return nickname != null &&
        nickname!.isNotEmpty &&
        gender != null &&
        exercise != null;
  }
  

    Future<void> onSendGeo (WidgetRef ref) async {
    final pos = await GeolocatorHelper.getposition();
      print("👉 $pos");
    if (pos == null) return;

    final lat = pos.latitude;
    final lng = pos.longitude;

    // ViewModel 호출
    final notifier = ref.read(addressSearchViewModelProvider.notifier);
    await notifier.searchByLocation(lat, lng);
    

    // 상태 확인
    final result = ref.read(addressSearchViewModelProvider);
    print("내 주소 결과 👉 $result");
  }
    

  @override
  Widget build(BuildContext context){      
// 1. getpositionr가서 위도 경도를 받아오기 (어떤 변수) 
    // 2. 받아온 위도 경도를 serachByLocation  여기로 보내기 
    // 3. serachByLocation 반환하는 값이 full_nm, emd cd , 를 받아오기 어딘가에 저장해둔다.
    
    return Scaffold(
      backgroundColor: Colors.white,

      body: GestureDetector(behavior: HitTestBehavior.translucent,       ///키패드 활성화 반응 살림 
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
                  ////////////////////////////////////////////////////////////////////////드롭다운 닉네임, 성별, 운동 
        
                  formField(
                    "닉네임",
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          nickname = value; // 닉네임
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
        
                  formField(
                    "성별",
                    DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(value: "남성", child: Text("남성")),
                        DropdownMenuItem(value: "여성", child: Text("여성")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          gender = value; // 성별
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
        
                  formField(
                    "운동",
                    DropdownButtonFormField(
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
                          exercise = value; // 운동
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
               /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////드롭다운 닉네임, 성별, 운동 
                  SizedBox(height: 20),
        
                  Consumer(
                    builder: (context, ref, _) {
                      return LocationPage(   //위치 정보 
                      onTap: () {
                        onSendGeo(ref);
                        print("위치 정보 클릭!"); //
                      },
                    );
                    }
                  ),
                    
        
                  SizedBox(height: 40),
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 시작하기 버튼 활성화 
                    SizedBox(
                        //  시작하기 버튼
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isFormValid
                           ? () {
                              print("다음 페이지로 이동!");    /// Navigator.push 로 수정 해야함 
                              
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isFormValid ? Colors.black : Colors.grey,
                      ),
                      child: Text(
                        "시작하기",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
         
                ],
              ),
            ),
            ),
        ),
      ),
    );
  }

  

  Widget formField(String label, Widget child) {   ////////////////////////// formField 닉네임,성별 ,운동  폼 디자인 공통함수 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 18)),
        SizedBox(height: 8),
        child,
        SizedBox(height: 24),
      ],
    );
  }
}
