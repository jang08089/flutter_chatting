import 'package:flutter_chatting/data/repository/vworld_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// :흰색_확인_표시: Riverpod 3.0 스타일
class AddressSearchViewModel extends Notifier<List<Map<String, dynamic>>> {
  final VworldRepository _vworldRepository = VworldRepository();
  @override
  List<Map<String, dynamic>> build() {
    // 초기 상태
    return [];
  }
    Future<void> searchByLocation(double lat, double lng) async {
    final result = await _vworldRepository.findByLatLng(lat, lng);
    // :불: ref.mounted 체크 추가
    if (!ref.mounted) {
      print(":경고: Provider가 dispose됨 - state 업데이트 취소");
      return;
    }
    print(":흰색_확인_표시: [ViewModel] 받은 데이터: $result");
    if (result.isNotEmpty) {
      print(":둥근_압핀: full_nm: ${result[0]['fullNm']}");
      print(":둥근_압핀: emd_cd: ${result[0]['emdCd']}");
    
    }
    state = result;
  }

    
    
  void searchByName(String query) async {
    // TODO: 나중에 구현
  }
}
// :흰색_확인_표시: provider 정의도 이렇게
final addressSearchViewModelProvider =
    NotifierProvider.autoDispose<AddressSearchViewModel,
        List<Map<String, dynamic>>>(
  AddressSearchViewModel.new,
);