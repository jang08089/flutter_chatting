import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    @JsonKey(ignore: true) String? id, // 🔥 문서 ID 저장용 (JSON 변환 제외)
    required String nickname,
    @JsonKey(name: 'is_male') required bool isMale,
    required String sport,
    @JsonKey(name: 'full_nm') required String fullNm,
    @JsonKey(name: 'emd_cd') required String emdCd,
    @JsonKey(
      name: 'created_at',
      fromJson: _convertToDateTime,
      toJson: _convertFromDateTime,
    )
    required DateTime createdAt,
  }) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json) =>
      _$ProfileFromJson(json);
}

// DateTime 변환 함수
DateTime _convertToDateTime(String timeString) {
  return DateTime.parse(timeString);
}

String _convertFromDateTime(DateTime time) {
  return time.toIso8601String();
}
