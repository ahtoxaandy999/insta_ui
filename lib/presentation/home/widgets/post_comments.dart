import 'package:flutter/material.dart';

class PostComments extends StatelessWidget {
  final String commentsText;

  const PostComments({super.key, required this.commentsText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          commentsText,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
