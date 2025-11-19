

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chatting/data/model/profile.dart';

class ProfileCoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveProfile(Profile profile) async {
    await _firestore.collection("users").add(profile.toJson());
  }
}

