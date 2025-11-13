import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_messages.freezed.dart';
part 'chat_messages.g.dart';

@freezed
abstract class ChatMessages with _$ChatMessages {
  const factory ChatMessages({
    required String id,
    @JsonKey(name: 'room_id') required String roomId,
    @JsonKey(name: 'sender_id') required String senderId,
    required String content,
    @JsonKey(name: 'created_at', fromJson: _convertToDateTime)
    required DateTime createdAt,
  }) = _ChatMessages;

  factory ChatMessages.fromJson(Map<String, Object?> json) =>
      _$ChatMessagesFromJson(json);
}

DateTime _convertToDateTime(String timeString) {
  return DateTime.parse(timeString);
}
