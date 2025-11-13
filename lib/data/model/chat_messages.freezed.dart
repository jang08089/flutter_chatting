// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessages {

 String get id;@JsonKey(name: 'room_id') String get roomId;@JsonKey(name: 'sender_id') String get senderId; String get content;@JsonKey(name: 'created_at', fromJson: _convertToDateTime) DateTime get createdAt;
/// Create a copy of ChatMessages
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessagesCopyWith<ChatMessages> get copyWith => _$ChatMessagesCopyWithImpl<ChatMessages>(this as ChatMessages, _$identity);

  /// Serializes this ChatMessages to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessages&&(identical(other.id, id) || other.id == id)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomId,senderId,content,createdAt);

@override
String toString() {
  return 'ChatMessages(id: $id, roomId: $roomId, senderId: $senderId, content: $content, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ChatMessagesCopyWith<$Res>  {
  factory $ChatMessagesCopyWith(ChatMessages value, $Res Function(ChatMessages) _then) = _$ChatMessagesCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'sender_id') String senderId, String content,@JsonKey(name: 'created_at', fromJson: _convertToDateTime) DateTime createdAt
});




}
/// @nodoc
class _$ChatMessagesCopyWithImpl<$Res>
    implements $ChatMessagesCopyWith<$Res> {
  _$ChatMessagesCopyWithImpl(this._self, this._then);

  final ChatMessages _self;
  final $Res Function(ChatMessages) _then;

/// Create a copy of ChatMessages
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? roomId = null,Object? senderId = null,Object? content = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessages].
extension ChatMessagesPatterns on ChatMessages {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessages value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessages() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessages value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessages():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessages value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessages() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'sender_id')  String senderId,  String content, @JsonKey(name: 'created_at', fromJson: _convertToDateTime)  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessages() when $default != null:
return $default(_that.id,_that.roomId,_that.senderId,_that.content,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'sender_id')  String senderId,  String content, @JsonKey(name: 'created_at', fromJson: _convertToDateTime)  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ChatMessages():
return $default(_that.id,_that.roomId,_that.senderId,_that.content,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'sender_id')  String senderId,  String content, @JsonKey(name: 'created_at', fromJson: _convertToDateTime)  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessages() when $default != null:
return $default(_that.id,_that.roomId,_that.senderId,_that.content,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessages implements ChatMessages {
  const _ChatMessages({required this.id, @JsonKey(name: 'room_id') required this.roomId, @JsonKey(name: 'sender_id') required this.senderId, required this.content, @JsonKey(name: 'created_at', fromJson: _convertToDateTime) required this.createdAt});
  factory _ChatMessages.fromJson(Map<String, dynamic> json) => _$ChatMessagesFromJson(json);

@override final  String id;
@override@JsonKey(name: 'room_id') final  String roomId;
@override@JsonKey(name: 'sender_id') final  String senderId;
@override final  String content;
@override@JsonKey(name: 'created_at', fromJson: _convertToDateTime) final  DateTime createdAt;

/// Create a copy of ChatMessages
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessagesCopyWith<_ChatMessages> get copyWith => __$ChatMessagesCopyWithImpl<_ChatMessages>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessagesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessages&&(identical(other.id, id) || other.id == id)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomId,senderId,content,createdAt);

@override
String toString() {
  return 'ChatMessages(id: $id, roomId: $roomId, senderId: $senderId, content: $content, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ChatMessagesCopyWith<$Res> implements $ChatMessagesCopyWith<$Res> {
  factory _$ChatMessagesCopyWith(_ChatMessages value, $Res Function(_ChatMessages) _then) = __$ChatMessagesCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'sender_id') String senderId, String content,@JsonKey(name: 'created_at', fromJson: _convertToDateTime) DateTime createdAt
});




}
/// @nodoc
class __$ChatMessagesCopyWithImpl<$Res>
    implements _$ChatMessagesCopyWith<$Res> {
  __$ChatMessagesCopyWithImpl(this._self, this._then);

  final _ChatMessages _self;
  final $Res Function(_ChatMessages) _then;

/// Create a copy of ChatMessages
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? roomId = null,Object? senderId = null,Object? content = null,Object? createdAt = null,}) {
  return _then(_ChatMessages(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
