import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required String avatarImage,
    required String image,
    required String title,
    required bool isViewed,
  }) = _Story;
}
