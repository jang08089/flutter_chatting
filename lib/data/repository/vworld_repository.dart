import 'package:dio/dio.dart';

class VworldRepository {
  final Dio _client = Dio(BaseOptions(validateStatus: (status) => true));

  // lat = 위도, lng = 경도
  Future<List<Map<String, String>>> findByLatLng(double lat, double lng) async {
    final response = await _client.get(
      "https://api.vworld.kr/req/data",
      queryParameters: {
        "service": "data",
        "request": "GetFeature",
        "key": "AF4D67D2-9282-3C1D-A9D5-E7C84E437C82",
        "data": "LT_C_ADEMD_INFO",
        "geomFilter": "POINT($lng $lat)", // x=lng, y=lat
        "geometry": "false",
        "size": 100,
      },
    );

    // 응답 구조 안전하게 파싱
    final data = response.data;
    if (data is! Map) {
      return [];
    }
    final resp = data['response'];
    if (resp == null) {
      return [];
    }
    final status = resp['status'];
    if (response.statusCode == 200 && status == 'OK' || status == 'ok') {
      final result = resp['result'];
      if (result == null) {
        return [];
      }
      // featureCollection을 먼저 확인
      final featureCollection = result['featureCollection'];
      if (featureCollection == null || featureCollection['features'] == null) {
        return [];
      }
      final features = featureCollection['features'] as List<dynamic>;
      final iterable = features.map((feat) {
        final props = feat['properties'] ?? {};
        final fullNm = (props['full_nm'] ?? "").toString();
        final emdCd = (props['emd_cd'] ?? "").toString();
        // 디버깅용 로그
        return {"fullNm": fullNm, "emdCd": emdCd};
      });
      return iterable.toList();
    } else {}
    return [];
  }
}
