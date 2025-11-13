import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//상태 클래스 필요없음 profile 사용

class UserGlobalViewModel extends Notifier<Profile?> {
  @override
  Profile? build() {
    return null;
  }

  Future<void> fetchUserInfo() async {}
}

final UserGlobalViewModelProvider =
    NotifierProvider<UserGlobalViewModel, Profile?>(
      () => UserGlobalViewModel()
    );
