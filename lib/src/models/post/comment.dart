import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';

@freezed
class PostComment with _$PostComment {
  const factory PostComment({
    required String nickname,
    required String avatarImage,
    required String time,
    required String likes,
    required String content,
  }) = _PostComment;
}
