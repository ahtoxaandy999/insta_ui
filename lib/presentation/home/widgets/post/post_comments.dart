import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:insta_ui/src/models/post/comment.dart';

class CommentsNotifier with ChangeNotifier {
  List<PostComment> comments;
  bool isExpanded;

  CommentsNotifier({
    required this.comments,
    this.isExpanded = false,
  });

  void toggleExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}

class PostComments extends StatelessWidget {
  final List<PostComment> comments;

  const PostComments({
    Key? key,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => CommentsNotifier(
        comments: comments,
        isExpanded: false,
      ),
      child: Consumer<CommentsNotifier>(
        builder: (context, commentsNotifier, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  commentsNotifier.toggleExpanded();
                },
                child: Text(
                  commentsNotifier.isExpanded
                      ? 'Hide comments'
                      : 'View all comments (${comments.length})',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              if (commentsNotifier.isExpanded)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 16.0,
                        backgroundImage: AssetImage(comment.avatarImage),
                      ),
                      title: DefaultTextStyle(
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: comment.nickname,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.color,
                                      fontWeight: FontWeight.bold)),
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
        },
      ),
    );
  }
}
