import 'package:flutter/material.dart';

class StoryAvatar extends StatelessWidget {
  final String avatarImage;
  final bool isViewed;

  const StoryAvatar(
      {super.key, required this.avatarImage, required this.isViewed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isViewed ? Colors.transparent : Colors.red,
                width: isViewed ? 0 : 3,
              ),
            ),
            child: ClipOval(
              child: Image.network(
                avatarImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
