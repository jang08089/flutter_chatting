import 'package:flutter_chatting/data/repository/vworld_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressSearchViewModel extends Notifier<List<Map<String, dynamic>>> {
  final VworldRepository _vworldRepository = VworldRepository();

  @override
  List<Map<String, dynamic>> build() {
    // 초기 상태
    return [];
  }

  Future<void> searchByLocation(double lat, double lng) async {
    final result = await _vworldRepository.findByLatLng(lat, lng);
    if (!ref.mounted) {
      return;
    }
    state = result;
  }
}

final addressSearchViewModelProvider =
    NotifierProvider.autoDispose<
      AddressSearchViewModel,
      List<Map<String, dynamic>>
    >(AddressSearchViewModel.new);
