import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_chatting/utils/device_id.dart';
import 'package:flutter_chatting/widgets/profile_box.dart';
import 'package:flutter_chatting/widgets/userbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  void initState() {
    super.initState();
    _saveMyProfileToFirestore(); // 화면 들어올 때 한 번만 실행
  }

  Future<void> _saveMyProfileToFirestore() async {
    try {
      // 1. 디바이스 아이디 가져오기
      final deviceId = await getDeviceId();

      // 2. Firestore users 컬렉션에 내 문서 저장
      await FirebaseFirestore.instance
          .collection('users')
          .doc(deviceId) // 문서 ID = deviceId
          .set({
            'nickname': '헬스메이트테스트', // TODO: 실제 입력값으로 바꾸기
            'is_male': true, // TODO: 실제 값으로
            'sport': '헬스', // TODO: 선택한 운동
            'full_nm': '서울특별시 강동구 천호동',
            'emd_cd': '11110101',
            'created_at': DateTime.now().toIso8601String(), // String으로 저장
          }, SetOptions(merge: true)); // 기존 문서가 있으면 병합

      debugPrint('🔥 내 프로필(users/$deviceId) 저장 완료');
    } catch (e) {
      debugPrint('❌ Firestore 저장 오류: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "채팅 목록",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home_outlined, size: 30),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          padding: const EdgeInsets.only(bottom: 150),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
               
              },
              child: ProfileBox(
                nickname: '아이조아',
                isMale: false,
                sport: '헬스',
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(indent: 5, endIndent: 5);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
