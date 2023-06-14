import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.username,
    required this.avatarImage,
    required this.postImage,
    required this.likes,
    required this.caption,
  }) : super(key: key);

  final String username;
  final String avatarImage;
  final String postImage;
  final int likes;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage(avatarImage),
              ),
              const SizedBox(width: 8.0),
              Text(
                username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Image.asset(postImage),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const Icon(Icons.favorite_border),
              const SizedBox(width: 4.0),
              Text(likes.toString()),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(caption),
        ],
      ),
    );
  }
}
