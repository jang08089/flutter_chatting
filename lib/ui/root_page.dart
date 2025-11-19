import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatting/core/device_id.dart';

import 'package:flutter_chatting/ui/mainlist_page/view/mainlist_page_view.dart'; // 메인 화면
import 'package:flutter_chatting/ui/profile_page/view/profile_page_view.dart'; // 프로필 작성 화면

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  Future<bool> _hasProfile() async {
    final deviceId = await getDeviceId(); // shared_preferences + uuid
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(deviceId)
        .get();

    return doc.exists; // 문서 있으면 true, 없으면 false
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _hasProfile(),
      builder: (context, snapshot) {
        // 아직 Firestore 조회 중
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 에러난 경우 (파이어베이스 설정 문제 등)
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('오류 발생: ${snapshot.error}')),
          );
        }

        final hasProfile = snapshot.data ?? false;

        // ✅ 프로필 있으면 메인 화면
        if (hasProfile) {
          return const MainListPageView(); // 네가 만든 메인 위젯 이름
        }

        // ❌ 프로필 없으면 프로필 작성 화면
        return ProfilePageView(); // 처음 닉네임/운동/주소 입력하는 화면
      },
    );
  }
}
