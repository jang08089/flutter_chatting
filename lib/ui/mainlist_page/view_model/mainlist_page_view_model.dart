import 'package:flutter_chatting/data/repository/profile_repository.dart';
import 'package:flutter_chatting/utils/device_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mainlist_page_view_model.g.dart';

@riverpod
class MainlistPageViewModel extends _$MainlistPageViewModel {
  final ProfileRepository repository = ProfileRepository();

  // 현재 디바이스 ID 기반으로 내 full_nm 조회 > 내 full_nm 기반 필터링한 프로필 불러옴
  // build()에서 fullNm과 profiles를 Map으로 반환
  @override
  Future<Map<String, dynamic>> build() async {
    final myDeviceId = await getDeviceId();
    final myFullNm =
        await repository.getFullNmByDeviceId(myDeviceId) ?? "주소 없음";
    final profiles = await repository.getProfilesByFullNm(
      // myFullNm // 실제 조회
      "서울특별시 강동구 천호동", // 더미 데이터
    );
    return {"fullNm": myFullNm, "profiles": profiles};
  }
}
