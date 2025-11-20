// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profile _$ProfileFromJson(Map<String, dynamic> json) => _Profile(
  nickname: json['nickname'] as String,
  isMale: json['is_male'] as bool,
  sport: json['sport'] as String,
  fullNm: json['full_nm'] as String,
  emdCd: json['emd_cd'] as String,
  createdAt: _convertToDateTime(json['created_at'] as String),
);

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
  'nickname': instance.nickname,
  'is_male': instance.isMale,
  'sport': instance.sport,
  'full_nm': instance.fullNm,
  'emd_cd': instance.emdCd,
  'created_at': _convertFromDateTime(instance.createdAt),
};
