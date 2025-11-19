import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

//디바이스 아이디생성하고 저장하는 유틸
Future<String> getDeviceId() async {
  final prefs = await SharedPreferences.getInstance();
  String? deviceId = prefs.getString('deviceId');

  if (deviceId == null) {
    deviceId = const Uuid().v4();
    await prefs.setString('deviceId', deviceId);
  }

  return deviceId;
}