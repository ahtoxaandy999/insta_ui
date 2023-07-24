import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostInfoStateNotifier extends ChangeNotifier {
  bool _showFullCaption = false;

  bool get showFullCaption => _showFullCaption;

  void toggleShowFullCaption() {
    _showFullCaption = !_showFullCaption;
    notifyListeners();
  }
}

class PostInfo extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostInfoStateNotifier(),
      child: _PostInfoWidget(
        likes: likes,
        username: username,
        caption: caption,
      ),
    );
  }
}

class _PostInfoWidget extends StatefulWidget {
  final int likes;
  final String username;
  final String caption;

  const _PostInfoWidget({
    Key? key,
    required this.likes,
    required this.username,
    required this.caption,
  }) : super(key: key);

  @override
  _PostInfoState createState() => _PostInfoState();
}

class _PostInfoState extends State<_PostInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final stateNotifier = Provider.of<PostInfoStateNotifier>(context);
    final maxLines = stateNotifier.showFullCaption ? 9999 : 3;
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;
    final cardColor = theme.cardColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${widget.likes} likes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6.0),
        LayoutBuilder(
          builder: (context, constraints) {
            final textSpan = TextSpan(
              text: widget.username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              children: [
                TextSpan(
                  text: ' ${widget.caption}',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: textColor,
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
                        stateNotifier.toggleShowFullCaption();
                      },
                      child: Container(
                        color: cardColor,
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
