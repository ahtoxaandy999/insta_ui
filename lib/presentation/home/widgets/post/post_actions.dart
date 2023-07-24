import 'package:flutter/material.dart';

class PostActions extends StatelessWidget {
  const PostActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            MouseRegion(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.favorite_border),
              ),
            ),
            SizedBox(width: 4.0),
            MouseRegion(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.chat_bubble_outline),
              ),
            ),
            SizedBox(width: 4.0),
            MouseRegion(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.send),
              ),
            ),
          ],
        ),
        Transform.translate(
          offset: const Offset(16.0, 0.0),
          child: const MouseRegion(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.bookmark_border),
            ),
          ),
        ),
      ],
    );
  }
}
