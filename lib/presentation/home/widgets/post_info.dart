import 'package:flutter/material.dart';

class PostInfo extends StatelessWidget {
  final int likes;
  final String username;
  final String caption;

  const PostInfo({
    super.key,
    required this.likes,
    required this.username,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '$likes likes',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6.0),
        Row(
          children: [
            Text(
              username,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4.0),
            Text(caption),
          ],
        ),
      ],
    );
  }
}
