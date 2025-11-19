import 'package:geolocator/geolocator.dart';

class GeolocatorHelper {
  //
  static Future<Position?> getposition() async {
    //getposition() 호출됨"
    final permission = await Geolocator.checkPermission();
    //현재 권한 상태: $permission
    // 1. 현재 권한이 허용되지 않았을 때 권한 요청하기
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      //권한 없음 → 권한 요청 시도");
      final permission2 = await Geolocator.requestPermission();
      // 권한 요청 결과: $permission2
      // 2. 권한 요청 후 결과가 거부일 때 리턴하기
      if (permission2 == LocationPermission.denied ||
          permission2 == LocationPermission.deniedForever) {
        //권한 거부됨 → 위치 반환하지 않음
        return null;
      }
    }
    //권한 허용됨 → 위치 요청 시작
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
        ),
      );
      // 위치 가져옴
      return position;
    } catch (e) {
      //위치 가져오는 중 오류 발생: $e
      return null;
    }
  }
}
