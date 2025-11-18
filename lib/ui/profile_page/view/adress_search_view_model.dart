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
    
    state = result; // 상태 업데이트
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