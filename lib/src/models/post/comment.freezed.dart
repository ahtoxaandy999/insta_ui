// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostComment {
  String get nickname => throw _privateConstructorUsedError;
  String get avatarImage => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get likes => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostCommentCopyWith<PostComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCommentCopyWith<$Res> {
  factory $PostCommentCopyWith(
          PostComment value, $Res Function(PostComment) then) =
      _$PostCommentCopyWithImpl<$Res, PostComment>;
  @useResult
  $Res call(
      {String nickname,
      String avatarImage,
      String time,
      String likes,
      String content});
}

/// @nodoc
class _$PostCommentCopyWithImpl<$Res, $Val extends PostComment>
    implements $PostCommentCopyWith<$Res> {
  _$PostCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? avatarImage = null,
    Object? time = null,
    Object? likes = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatarImage: null == avatarImage
          ? _value.avatarImage
          : avatarImage // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostCommentCopyWith<$Res>
    implements $PostCommentCopyWith<$Res> {
  factory _$$_PostCommentCopyWith(
          _$_PostComment value, $Res Function(_$_PostComment) then) =
      __$$_PostCommentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nickname,
      String avatarImage,
      String time,
      String likes,
      String content});
}

/// @nodoc
class __$$_PostCommentCopyWithImpl<$Res>
    extends _$PostCommentCopyWithImpl<$Res, _$_PostComment>
    implements _$$_PostCommentCopyWith<$Res> {
  __$$_PostCommentCopyWithImpl(
      _$_PostComment _value, $Res Function(_$_PostComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? avatarImage = null,
    Object? time = null,
    Object? likes = null,
    Object? content = null,
  }) {
    return _then(_$_PostComment(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatarImage: null == avatarImage
          ? _value.avatarImage
          : avatarImage // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PostComment implements _PostComment {
  const _$_PostComment(
      {required this.nickname,
      required this.avatarImage,
      required this.time,
      required this.likes,
      required this.content});

  @override
  final String nickname;
  @override
  final String avatarImage;
  @override
  final String time;
  @override
  final String likes;
  @override
  final String content;

  @override
  String toString() {
    return 'PostComment(nickname: $nickname, avatarImage: $avatarImage, time: $time, likes: $likes, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostComment &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.avatarImage, avatarImage) ||
                other.avatarImage == avatarImage) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nickname, avatarImage, time, likes, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCommentCopyWith<_$_PostComment> get copyWith =>
      __$$_PostCommentCopyWithImpl<_$_PostComment>(this, _$identity);
}

abstract class _PostComment implements PostComment {
  const factory _PostComment(
      {required final String nickname,
      required final String avatarImage,
      required final String time,
      required final String likes,
      required final String content}) = _$_PostComment;

  @override
  String get nickname;
  @override
  String get avatarImage;
  @override
  String get time;
  @override
  String get likes;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_PostCommentCopyWith<_$_PostComment> get copyWith =>
      throw _privateConstructorUsedError;
}
