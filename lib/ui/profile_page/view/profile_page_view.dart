import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chatting/utils/device_id.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({super.key});

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  bool _saving = true;
  String? _deviceId;
  String? _error;

  @override
  void initState() {
    super.initState();
    _saveDummyProfile(); // 화면 들어오자마자 실행
  }

  Future<void> _saveDummyProfile() async {
    try {
      final deviceId = await getDeviceId();
      _deviceId = deviceId;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(deviceId)
          .set({
        'nickname': '테스트유저',
        'is_male': true,
        'sport': '헬스',
        'full_nm': '서울특별시 강동구 천호동',
        'emd_cd': '11110101',
        'created_at': DateTime.now().toIso8601String(), // String으로 저장
      }, SetOptions(merge: true)); // 있으면 병합, 없으면 생성

      setState(() {
        _saving = false;
      });

      debugPrint('🔥 ProfilePageView: users/$deviceId 더미 프로필 저장 완료');
    } catch (e) {
      debugPrint('❌ ProfilePageView: 프로필 저장 오류: $e');
      setState(() {
        _saving = false;
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePage 테스트'),
      ),
      body: Center(
        child: _saving
            ? const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 12),
                  Text('파이어베이스에 내 프로필 저장 중...'),
                ],
              )
            : _error != null
                ? Text('오류 발생: $_error')
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '여기가 ProfilePageView 입니다!',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 12),
                      if (_deviceId != null)
                        Text(
                          'deviceId: $_deviceId',
                          style: const TextStyle(fontSize: 12),
                        ),
                      const SizedBox(height: 8),
                      const Text('🔥 더미 프로필이 Firestore에 저장됐어요.'),
                    ],
                  ),
      ),
    );
  }
}