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
    final myProfile = await getMyProfile();
    return await getProfiles(myProfile.fullNm);
  }

  // R 내 full_nm 기반 필터링한 리스트 불러오기
  Future<List> getProfiles(String fullNm) async {
    final profiles = await profileRepo.getProfilesByFullNm(fullNm);
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
