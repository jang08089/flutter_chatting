import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_chatting/data/repository/chat_room_repository.dart';
import 'package:flutter_chatting/data/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mainlist_page_view_model.g.dart';

@riverpod
class MainlistPageViewModel extends _$MainlistPageViewModel {
  final ProfileRepository profileRepo = ProfileRepository();
  final ChatRoomRepository chatRepo = ChatRoomRepository();

  @override
  Future<List> build() async {
    return await getProfiles();
  }

  // R 내 full_nm 기반 필터링한 리스트 불러오기
  Future<List> getProfiles() async {
    final profiles = await profileRepo.getProfilesByFullNm(
      // myFullNm // 실제 조회
      "서울특별시 강동구 천호동", // 더미 데이터
    );
    return profiles;
  }

  // R 내 프로필 불러오기
  Future<Profile> getMyProfile() async {
    final myProfile = await profileRepo.getMyProfile();
    return myProfile;
  }

  // C 새로운 Chatroom, roomId 생성하기 > roomId 반환
  Future<String?> createChatRoom(Profile me, Profile opponent) async {
    return await chatRepo.createChatRoom(me, opponent);
  }
}
