import 'package:flutter/material.dart';

class PostHead extends StatelessWidget {
  final String username;
  final String avatarImage;
  final String publicationTime;

  const PostHead({
    Key? key,
    required this.username,
    required this.avatarImage,
    required this.publicationTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 4.0),
        CircleAvatar(
          radius: 16.0,
          backgroundImage: AssetImage(avatarImage),
        ),
        const SizedBox(width: 8.0),
        Text(
          username,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4.0),
        const Text('•', style: TextStyle(color: Colors.grey)),
        const SizedBox(width: 4.0),
        Text(
          publicationTime,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
