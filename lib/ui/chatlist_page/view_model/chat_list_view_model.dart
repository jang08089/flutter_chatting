import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//상태 클래스 필요없음

class ChatPageViewModel extends Notifier<List<Profile>> {
  @override
  List<Profile> build() {
    return [];
  }

  void getChattings() async {}
}

final ChatPageViewModelProvider =
    NotifierProvider<ChatPageViewModel, List<Profile>>(
      () => ChatPageViewModel(),
    );
