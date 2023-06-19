import 'package:flutter/material.dart';

class PostInfo extends StatefulWidget {
  final int likes;
  final String username;
  final String caption;

  const PostInfo({
    Key? key,
    required this.likes,
    required this.username,
    required this.caption,
  }) : super(key: key);

  @override
  _PostInfoState createState() => _PostInfoState();
}

class _PostInfoState extends State<PostInfo> {
  bool showFullCaption = false;

  @override
  Widget build(BuildContext context) {
    final maxLines = showFullCaption ? 9999 : 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${widget.likes} likes',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6.0),
        LayoutBuilder(
          builder: (context, constraints) {
            final textSpan = TextSpan(
              text: widget.username,
              style: const TextStyle(fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: ' ${widget.caption}',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            );
            final textPainter = TextPainter(
              text: textSpan,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              maxLines: maxLines,
            );
            textPainter.layout(maxWidth: constraints.maxWidth);
            final isTextOverflowed = textPainter.didExceedMaxLines;

            return Stack(
              children: [
                RichText(
                  text: textSpan,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
                if (isTextOverflowed)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showFullCaption = !showFullCaption;
                        });
                      },
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: const Text(
                          'Show more',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
