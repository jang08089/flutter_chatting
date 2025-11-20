// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessages _$ChatMessagesFromJson(Map<String, dynamic> json) =>
    _ChatMessages(
      id: json['id'] as String,
      roomId: json['room_id'] as String,
      senderId: json['sender_id'] as String,
      content: json['content'] as String,
      createdAt: _convertToDateTime(json['created_at'] as String),
    );

Map<String, dynamic> _$ChatMessagesToJson(_ChatMessages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'room_id': instance.roomId,
      'sender_id': instance.senderId,
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
    };
