
import 'package:flutter/material.dart';
import 'package:flutter_chatting/ui/profile_page/view/location_Page.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: GestureDetector(behavior: HitTestBehavior.translucent,       ///키패드 활성화 반응이 없다........ 
      onTap: () {
        FocusScope.of(context).unfocus();
      },
        child: SafeArea(
          
         
            //키보드가 올라와서 화면이 좁아질 경우 ,SingleChildScrollView를 사용 
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
        
                  LocationPage(   //위치 정보 
                    onTap: () {
                      print("위치 정보 클릭!");
                    },
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
