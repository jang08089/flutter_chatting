import 'package:dio/dio.dart';
class VworldRepository {
  final Dio _client = Dio(
    BaseOptions(
      validateStatus: (status) => true, // 에러라도 다 응답 받게
    ),
  );
  // lat = 위도, lng = 경도
  Future<List<Map<String, String>>> findByLatLng(double lat, double lng) async {
    print(":아시아가_보이는_지구_모양: [VWorld] 요청 시작 lat=$lat, lng=$lng");
    final response = await _client.get(
      "https://api.vworld.kr/req/data",
      queryParameters: {
        "service": "data",
        "request": "GetFeature",
        "key": "AF4D67D2-9282-3C1D-A9D5-E7C84E437C82",
        "data": "LT_C_ADEMD_INFO",
        // 'type': 'DISTRICT', // data API에서는 필요 없음
        "geomFilter": "POINT($lng $lat)", // x=lng, y=lat
        "geometry": "false",
        "size": 100,
      },
    );
    print(":위성_안테나: [VWorld] HTTP status: ${response.statusCode}");
    print(":위성_안테나: [VWorld] raw data: ${response.data}");
    // 응답 구조 안전하게 파싱
    final data = response.data;
    if (data is! Map) {
      print(":x: [VWorld] 응답이 Map이 아님");
      return [];
    }
    final resp = data['response'];
    if (resp == null) {
      print(":x: [VWorld] response 필드 없음");
      return [];
    }
    final status = resp['status'];
    print(":위성_안테나: [VWorld] API status: $status");
    if (response.statusCode == 200 && status == 'OK' || status == 'ok') {
      final result = resp['result'];
      if (result == null || result['features'] == null) {
        print(":경고: [VWorld] result 또는 features 없음");
        return [];
      }
      final features = result['features'] as List<dynamic>;
      print(":위성_안테나: [VWorld] feature 개수: ${features.length}");
      final iterable = features.map((feat) {
        final props = feat['properties'] ?? {};
        return {
          "fullNm": (props['full_nm'] ?? "").toString(),
          "emdCd": (props['emd_cd'] ?? "").toString(),
        };
      });
      return iterable.toList();
    } else {
      print(":x: [VWorld] 상태 오류 status=$status, http=${response.statusCode}");
    }
    return [];
  }
}


























