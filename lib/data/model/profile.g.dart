// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profile _$ProfileFromJson(Map<String, dynamic> json) => _Profile(
  nickname: json['nickname'] as String,
  isMale: json['is_male'] as bool,
  sport: json['sport'] as String,
  location: json['location'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
  'nickname': instance.nickname,
  'is_male': instance.isMale,
  'sport': instance.sport,
  'location': instance.location,
  'createdAt': instance.createdAt,
};
