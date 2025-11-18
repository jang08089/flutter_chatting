import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_chatting/utils/device_id.dart';

class ProfileRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // R 전체 프로필 조회
  Future<List<Profile>> getProfiles() async {
    final snapshot = await firestore.collection('profiles').get();
    return snapshot.docs.map((doc) => Profile.fromJson(doc.data())).toList();
  }

  // C 프로필 추가
  Future<Profile> addProfile(Profile profile) async {
    final deviceId = await getDeviceId(); // Device Id 가져오기
    final data = profile.copyWith(createdAt: DateTime.now()).toJson();
    await firestore
        .collection('profiles')
        .doc(deviceId)
        .set(data, SetOptions(merge: true)); // profile 있으면 병합, 없으면 생성
    return Profile.fromJson(data);
  }

  // R device id > full_nm 조회
  Future<String?> getFullNmByDeviceId(String deviceId) async {
    try {
      final docSnapshot = await firestore
          .collection('users')
          .doc(deviceId)
          .get();
      final data = docSnapshot.data();
      if (data == null) return null;
      final fullNm = data['full_nm'] as String?; // full_nm 필드 추출
      return fullNm;
    } catch (e) {
      return null;
    }
  }

  // R device id > emd_cd 조회
  Future<String?> getEmdCdByDeviceId(String deviceId) async {
    try {
      final docSnapshot = await firestore
          .collection('users')
          .doc(deviceId)
          .get();
      final data = docSnapshot.data();
      if (data == null) return null;
      final emdCd = data['emd_cd'] as String?; // emd_cd 필드 추출
      return emdCd;
    } catch (e) {
      return null;
    }
  }

  // R 특정 emd_cd 값과 같은 프로필만 조회
  Future<List<Profile>> getProfilesByEmdCd(String emdCd) async {
    try {
      final snapshot = await firestore
          .collection('profiles')
          .where('emd_cd', isEqualTo: emdCd) // emd_cd 필드 조건
          .get();
      return snapshot.docs.map((doc) => Profile.fromJson(doc.data())).toList();
    } catch (e) {
      return [];
    }
  }
}
