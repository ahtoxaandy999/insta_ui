import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'dart:async';

class StoryPage extends StatefulWidget {
  final List<String> stories;
  final int currentIndex;
  final VoidCallback onStoryComplete;
  final StreamController<DateTime> timerController;

  const StoryPage({
    super.key,
    required this.stories,
    required this.currentIndex,
    required this.onStoryComplete,
    required this.timerController,
  });

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.currentIndex;
    _pageController = PageController(initialPage: _currentPage);

    widget.timerController.stream.listen((event) {
      setState(() {
        _currentPage++;
        if (_currentPage >= widget.stories.length) {
          widget.onStoryComplete();
          Navigator.pop(context);
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.stories.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildStoryPage(widget.stories[index]);
            },
          ),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryPage(String storyUrl) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(storyUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
