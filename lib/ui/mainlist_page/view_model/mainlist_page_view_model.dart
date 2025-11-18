import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_chatting/data/repository/profile_repository.dart';
import 'package:flutter_chatting/utils/device_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mainlist_page_view_model.g.dart';

@riverpod
class MainlistPageViewModel extends _$MainlistPageViewModel {
  final ProfileRepository repository = ProfileRepository();

  // 초기값 : 현재 디바이스 ID 기반으로 내 emd_cd 조회 > 내 emd_cd 기반 필터링한 프로필 불러옴
  @override
  Future<List<Profile>> build() async {
    final myDeviceId = await getDeviceId();
    print(myDeviceId);
    final myFullNm = await repository.getFullNmByDeviceId(myDeviceId);
    print(myFullNm);
    return await repository.getProfilesByEmdCd(myFullNm!);
  }

  // R : 전체 프로필 불러오기
  Future<void> getProfiles() async {
    state = const AsyncValue.loading();
    try {
      final list = await repository.getProfiles();
      if (!ref.mounted) return;
      state = AsyncValue.data(list);
    } catch (e, st) {
      if (!ref.mounted) return;
      state = AsyncValue.error(e, st);
    }
  }

  // R : 특정 emd_cd 기반 필터링해서 불러오기
  Future<void> getProfilesByEmdCd(String emdCd) async {
    state = const AsyncValue.loading();
    try {
      final filteredList = await repository.getProfilesByEmdCd(emdCd);
      if (!ref.mounted) return;
      state = AsyncValue.data(filteredList);
    } catch (e, st) {
      if (!ref.mounted) return;
      state = AsyncValue.error(e, st);
    }
  }

  // C : 새 프로필 추가
  Future<void> addProfile(Profile profile) async {
    try {
      final created = await repository.addProfile(profile);
      if (!ref.mounted) return;

      // 기존 리스트에 추가
      state.whenData((list) {
        if (!ref.mounted) return;
        state = AsyncValue.data([...list, created]);
      });
    } catch (e, st) {
      if (!ref.mounted) return;
      state = AsyncValue.error(e, st);
    }
  }
}
