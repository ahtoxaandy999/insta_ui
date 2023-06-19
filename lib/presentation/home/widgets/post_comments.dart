import 'package:flutter/material.dart';
import 'package:insta_ui/src/models/post/comment.dart';

class PostComments extends StatefulWidget {
  final List<PostComment> comments;

  const PostComments({
    Key? key,
    required this.comments,
  }) : super(key: key);

  @override
  _PostCommentsState createState() => _PostCommentsState();
}

class _PostCommentsState extends State<PostComments> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;
    final commentsCount = widget.comments.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Text(
            _expanded ? 'Hide comments' : 'View all comments ($commentsCount)',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        if (_expanded)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: commentsCount,
            itemBuilder: (context, index) {
              final comment = widget.comments[index];

              return ListTile(
                leading: CircleAvatar(
                  radius: 16.0,
                  backgroundImage: AssetImage(comment.avatarImage),
                ),
                title: DefaultTextStyle(
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: comment.nickname,
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold)),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: comment.time,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                subtitle: Text(comment.content),
                trailing: Text(
                  '${comment.likes} likes',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
