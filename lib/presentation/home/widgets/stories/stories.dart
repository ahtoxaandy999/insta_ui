import 'package:flutter/material.dart';
import 'package:insta_ui/presentation/home/widgets/stories/story_avatar.dart';
import 'package:insta_ui/presentation/home/widgets/stories/story_page.dart';
import 'package:timer_builder/timer_builder.dart';
import 'dart:async';

class StoriesWidget extends StatefulWidget {
  @override
  _StoriesWidgetState createState() => _StoriesWidgetState();
}

class _StoriesWidgetState extends State<StoriesWidget> {
  List<String> stories = [
    'https://picsum.photos/id/1/675/1200',
    'https://picsum.photos/id/2/675/1200',
    'https://picsum.photos/id/3/675/1200',
    'https://picsum.photos/id/4/675/1200',
    'https://picsum.photos/id/5/675/1200',
    'https://picsum.photos/id/6/675/1200',
    'https://picsum.photos/id/7/675/1200',
    'https://picsum.photos/id/8/675/1200',
  ];

  int _currentIndex = 0;

  StreamController<DateTime> _timerController = StreamController<DateTime>();

  @override
  void dispose() {
    _timerController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showFullScreenStory(index);
            },
            child: StoryAvatar(
              avatarImage: stories[index],
              isViewed: index < _currentIndex,
            ),
          );
        },
      ),
    );
  }

  void _showFullScreenStory(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          StreamController<DateTime> _timerController =
              StreamController<DateTime>();

          return StoryPage(
            stories: stories,
            currentIndex: index,
            onStoryComplete: () {
              setState(() {
                _currentIndex = index + 1;
              });
            },
            timerController: _timerController,
          );
        },
      ),
    );
  }
}
