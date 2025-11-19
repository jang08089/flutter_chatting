import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_chatting/core/device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveProfile(Profile profile) async {
    final deviceId = await getDeviceId();

    // 🔥 deviceId를 문서 ID로 설정해서 Firestore에 저장
    await _firestore.collection("users").doc(deviceId).set(profile.toJson());

    // 🔥 SharedPreferences에 저장
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileId', deviceId);
  }
}
