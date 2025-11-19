import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_chatting/utils/device_id.dart';

class ProfileRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // C 프로필 추가
  Future<Profile> addProfile(Profile profile) async {
    final deviceId = await getDeviceId(); // Device Id 가져오기
    final data = profile.copyWith(createdAt: DateTime.now()).toJson();
    await firestore
        .collection('users')
        .doc(deviceId)
        .set(data, SetOptions(merge: true)); // profile 있으면 병합, 없으면 생성
    return Profile.fromJson(data);
  }

  // R 내 프로필 가져오기
  Future<Profile> getMyProfile() async {
    final myDeviceId = await getDeviceId();
    final snapshot = await firestore.collection('users').doc(myDeviceId).get();
    final data = snapshot.data();
    if (data == null) {
      throw Exception("내 프로필이 존재하지 않습니다.");
    }
    return Profile.fromJson(data);
  }

  // R 특정 full_nm 값과 같은 프로필 리스트만 조회
  Future<List<Profile>> getProfilesByFullNm(String fullNm) async {
    try {
      final snapshot = await firestore
          .collection('users')
          .where('full_nm', isEqualTo: fullNm)
          .get();
      return snapshot.docs
          .map((doc) => Profile.fromJson(doc.data()).copyWith(id: doc.id))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
