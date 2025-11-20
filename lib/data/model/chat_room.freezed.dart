// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatRoom {

 String get id;@JsonKey(name: 'member_ids') List<String> get memberIds;@JsonKey(name: 'created_at', fromJson: _convertToDateTime) DateTime get createdAt;@JsonKey(name: 'updated_at', fromJson: _convertToDateTime) DateTime get updatedAt;@JsonKey(name: 'member_info') Map<String, dynamic> get memberInfo;
/// Create a copy of ChatRoom
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoomCopyWith<ChatRoom> get copyWith => _$ChatRoomCopyWithImpl<ChatRoom>(this as ChatRoom, _$identity);

  /// Serializes this ChatRoom to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoom&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.memberIds, memberIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.memberInfo, memberInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(memberIds),createdAt,updatedAt,const DeepCollectionEquality().hash(memberInfo));

@override
String toString() {
  return 'ChatRoom(id: $id, memberIds: $memberIds, createdAt: $createdAt, updatedAt: $updatedAt, memberInfo: $memberInfo)';
}


}

/// @nodoc
abstract mixin class $ChatRoomCopyWith<$Res>  {
  factory $ChatRoomCopyWith(ChatRoom value, $Res Function(ChatRoom) _then) = _$ChatRoomCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'member_ids') List<String> memberIds,@JsonKey(name: 'created_at', fromJson: _convertToDateTime) DateTime createdAt,@JsonKey(name: 'updated_at', fromJson: _convertToDateTime) DateTime updatedAt,@JsonKey(name: 'member_info') Map<String, dynamic> memberInfo
});




}
/// @nodoc
class _$ChatRoomCopyWithImpl<$Res>
    implements $ChatRoomCopyWith<$Res> {
  _$ChatRoomCopyWithImpl(this._self, this._then);

  final ChatRoom _self;
  final $Res Function(ChatRoom) _then;

/// Create a copy of ChatRoom
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? memberIds = null,Object? createdAt = null,Object? updatedAt = null,Object? memberInfo = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,memberIds: null == memberIds ? _self.memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,memberInfo: null == memberInfo ? _self.memberInfo : memberInfo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatRoom].
extension ChatRoomPatterns on ChatRoom {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatRoom value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatRoom() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatRoom value)  $default,){
final _that = this;
switch (_that) {
case _ChatRoom():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatRoom value)?  $default,){
final _that = this;
switch (_that) {
case _ChatRoom() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'member_ids')  List<String> memberIds, @JsonKey(name: 'created_at', fromJson: _convertToDateTime)  DateTime createdAt, @JsonKey(name: 'updated_at', fromJson: _convertToDateTime)  DateTime updatedAt, @JsonKey(name: 'member_info')  Map<String, dynamic> memberInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatRoom() when $default != null:
return $default(_that.id,_that.memberIds,_that.createdAt,_that.updatedAt,_that.memberInfo);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'member_ids')  List<String> memberIds, @JsonKey(name: 'created_at', fromJson: _convertToDateTime)  DateTime createdAt, @JsonKey(name: 'updated_at', fromJson: _convertToDateTime)  DateTime updatedAt, @JsonKey(name: 'member_info')  Map<String, dynamic> memberInfo)  $default,) {final _that = this;
switch (_that) {
case _ChatRoom():
return $default(_that.id,_that.memberIds,_that.createdAt,_that.updatedAt,_that.memberInfo);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'member_ids')  List<String> memberIds, @JsonKey(name: 'created_at', fromJson: _convertToDateTime)  DateTime createdAt, @JsonKey(name: 'updated_at', fromJson: _convertToDateTime)  DateTime updatedAt, @JsonKey(name: 'member_info')  Map<String, dynamic> memberInfo)?  $default,) {final _that = this;
switch (_that) {
case _ChatRoom() when $default != null:
return $default(_that.id,_that.memberIds,_that.createdAt,_that.updatedAt,_that.memberInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatRoom implements ChatRoom {
  const _ChatRoom({required this.id, @JsonKey(name: 'member_ids') required final  List<String> memberIds, @JsonKey(name: 'created_at', fromJson: _convertToDateTime) required this.createdAt, @JsonKey(name: 'updated_at', fromJson: _convertToDateTime) required this.updatedAt, @JsonKey(name: 'member_info') required final  Map<String, dynamic> memberInfo}): _memberIds = memberIds,_memberInfo = memberInfo;
  factory _ChatRoom.fromJson(Map<String, dynamic> json) => _$ChatRoomFromJson(json);

@override final  String id;
 final  List<String> _memberIds;
@override@JsonKey(name: 'member_ids') List<String> get memberIds {
  if (_memberIds is EqualUnmodifiableListView) return _memberIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberIds);
}

@override@JsonKey(name: 'created_at', fromJson: _convertToDateTime) final  DateTime createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _convertToDateTime) final  DateTime updatedAt;
 final  Map<String, dynamic> _memberInfo;
@override@JsonKey(name: 'member_info') Map<String, dynamic> get memberInfo {
  if (_memberInfo is EqualUnmodifiableMapView) return _memberInfo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_memberInfo);
}


/// Create a copy of ChatRoom
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatRoomCopyWith<_ChatRoom> get copyWith => __$ChatRoomCopyWithImpl<_ChatRoom>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatRoomToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatRoom&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._memberIds, _memberIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._memberInfo, _memberInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_memberIds),createdAt,updatedAt,const DeepCollectionEquality().hash(_memberInfo));

@override
String toString() {
  return 'ChatRoom(id: $id, memberIds: $memberIds, createdAt: $createdAt, updatedAt: $updatedAt, memberInfo: $memberInfo)';
}


}

/// @nodoc
abstract mixin class _$ChatRoomCopyWith<$Res> implements $ChatRoomCopyWith<$Res> {
  factory _$ChatRoomCopyWith(_ChatRoom value, $Res Function(_ChatRoom) _then) = __$ChatRoomCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'member_ids') List<String> memberIds,@JsonKey(name: 'created_at', fromJson: _convertToDateTime) DateTime createdAt,@JsonKey(name: 'updated_at', fromJson: _convertToDateTime) DateTime updatedAt,@JsonKey(name: 'member_info') Map<String, dynamic> memberInfo
});




}
/// @nodoc
class __$ChatRoomCopyWithImpl<$Res>
    implements _$ChatRoomCopyWith<$Res> {
  __$ChatRoomCopyWithImpl(this._self, this._then);

  final _ChatRoom _self;
  final $Res Function(_ChatRoom) _then;

/// Create a copy of ChatRoom
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? memberIds = null,Object? createdAt = null,Object? updatedAt = null,Object? memberInfo = null,}) {
  return _then(_ChatRoom(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,memberIds: null == memberIds ? _self._memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,memberInfo: null == memberInfo ? _self._memberInfo : memberInfo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
