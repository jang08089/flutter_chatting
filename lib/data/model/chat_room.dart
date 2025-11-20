import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room.freezed.dart';
part 'chat_room.g.dart';

@freezed
abstract class ChatRoom with _$ChatRoom {
  const factory ChatRoom({
    required String id,
    @JsonKey(name: 'member_ids') required List<String> memberIds,
    @JsonKey(name: 'created_at', fromJson: _convertToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: _convertToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'member_info') required Map<String, dynamic> memberInfo,
  }) = _ChatRoom;

  factory ChatRoom.fromJson(Map<String, Object?> json) =>
      _$ChatRoomFromJson(json);
}

DateTime _convertToDateTime(String timeString) {
  return DateTime.parse(timeString);
}
