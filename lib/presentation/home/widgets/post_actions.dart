import 'package:flutter/material.dart';

class PostActions extends StatefulWidget {
  const PostActions({super.key});

  @override
  _PostActionsState createState() => _PostActionsState();
}

class _PostActionsState extends State<PostActions> {
  bool isFavoriteHovered = false;
  bool isChatHovered = false;
  bool isSendHovered = false;
  bool isBookmarkHovered = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            MouseRegion(
              onHover: (event) {
                setState(() {
                  isFavoriteHovered = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isFavoriteHovered = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Opacity(
                  opacity: isFavoriteHovered ? 0.7 : 1.0,
                  child: const Icon(Icons.favorite_border),
                ),
              ),
            ),
            const SizedBox(width: 4.0),
            // Repeat the same pattern for other icons
            MouseRegion(
              onHover: (event) {
                setState(() {
                  isChatHovered = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isChatHovered = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Opacity(
                  opacity: isChatHovered ? 0.7 : 1.0,
                  child: const Icon(Icons.chat_bubble_outline),
                ),
              ),
            ),
            const SizedBox(width: 4.0),
            MouseRegion(
              onHover: (event) {
                setState(() {
                  isSendHovered = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isSendHovered = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Opacity(
                  opacity: isSendHovered ? 0.7 : 1.0,
                  child: const Icon(Icons.send),
                ),
              ),
            ),
          ],
        ),
        MouseRegion(
          onHover: (event) {
            setState(() {
              isBookmarkHovered = true;
            });
          },
          onExit: (event) {
            setState(() {
              isBookmarkHovered = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Opacity(
              opacity: isBookmarkHovered ? 0.7 : 1.0,
              child: const Icon(Icons.bookmark_border),
            ),
          ),
        ),
      ],
    );
  }
}
