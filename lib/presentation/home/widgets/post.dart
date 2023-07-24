import 'package:flutter/material.dart';
import 'package:insta_ui/presentation/home/widgets/post_actions.dart';
import 'package:insta_ui/presentation/home/widgets/post_comments.dart';
import 'package:insta_ui/presentation/home/widgets/post_head.dart';
import 'package:insta_ui/presentation/home/widgets/post_info.dart';
import 'package:insta_ui/src/models/post/comment.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    Key? key,
    required this.username,
    required this.avatarImage,
    required this.postImage,
    required this.likes,
    required this.caption,
    required this.publicationTime,
    required this.comments,
  }) : super(key: key);

  final String username;
  final String avatarImage;
  final String postImage;
  final int likes;
  final String caption;
  final String publicationTime;
  final List<PostComment> comments;

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isFavoriteHovered = false;
  bool isChatHovered = false;
  bool isSendHovered = false;
  bool isBookmarkHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PostHead(
              username: widget.username,
              avatarImage: widget.avatarImage,
              publicationTime: widget.publicationTime),
          const SizedBox(height: 8.0),
          Image.asset(widget.postImage),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: const Offset(-8.0, 0.0),
                  child: const PostActions(),
                ),
                const SizedBox(height: 6.0),
                PostInfo(
                    likes: widget.likes,
                    username: widget.username,
                    caption: widget.caption),
                const SizedBox(height: 8.0),
                PostComments(comments: widget.comments),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
