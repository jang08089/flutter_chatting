// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) => _ChatRoom(
  id: json['id'] as String,
  memberIds: (json['member_ids'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  createdAt: _convertToDateTime(json['created_at'] as String),
  updatedAt: _convertToDateTime(json['updated_at'] as String),
  memberInfo: json['member_info'] as Map<String, dynamic>,
);

Map<String, dynamic> _$ChatRoomToJson(_ChatRoom instance) => <String, dynamic>{
  'id': instance.id,
  'member_ids': instance.memberIds,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'member_info': instance.memberInfo,
};
