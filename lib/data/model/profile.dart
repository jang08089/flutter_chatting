import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String nickname,
    @JsonKey(name: 'is_male') required bool isMale,
    required String sport,
    @JsonKey(name: 'full_nm') required String fullNm,
    @JsonKey(name: 'emd_cd') required String emdCd,
    @JsonKey(name: 'created_at', fromJson: _convertToDateTime)
    required DateTime createdAt,
  }) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json) =>
      _$ProfileFromJson(json);
}

DateTime _convertToDateTime(String timeString) {
  return DateTime.parse(timeString);
}
