import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_ui/presentation/home/widgets/post/post.dart';
import 'package:insta_ui/presentation/home/widgets/stories/stories.dart';
import 'package:insta_ui/src/bloc/content/content.dart';
import 'package:insta_ui/src/bloc/theme/theme.dart';
import 'package:insta_ui/src/models/post/comment.dart';
import 'package:insta_ui/src/models/story/story.dart';
import 'package:insta_ui/src/repository/content/content_repo.dart';
import 'package:google_fonts/google_fonts.dart';

final testStories = [
  const Story(
    avatarImage: 'assets/avatar.jpg',
    image: 'assets/post_image.jpg',
    title: 'This is a story title',
    isViewed: false,
  ),
  const Story(
    avatarImage: 'assets/avatar.jpg',
    image: 'assets/post_image.jpg',
    title: 'This is another story title',
    isViewed: false,
  ),
  const Story(
    avatarImage: 'assets/avatar.jpg',
    image: 'assets/post_image.jpg',
    title: 'This is the last story title',
    isViewed: false,
  ),
];

final testComments = [
  const PostComment(
    nickname: 'John',
    avatarImage: 'assets/avatar.jpg',
    time: '3h',
    likes: '33',
    content: 'Test comment 1',
  ),
  const PostComment(
    nickname: 'Jane',
    avatarImage: 'assets/avatar.jpg',
    time: '4h',
    likes: '21',
    content: 'Test comment 2',
  ),
  const PostComment(
    nickname: 'Alice',
    avatarImage: 'assets/avatar.jpg',
    time: '5h',
    likes: '10',
    content: 'Test comment 3',
  ),
  const PostComment(
    nickname: 'Bob',
    avatarImage: 'assets/avatar.jpg',
    time: '6h',
    likes: '15',
    content: 'Test comment 4',
  ),
  const PostComment(
    nickname: 'Emily',
    avatarImage: 'assets/avatar.jpg',
    time: '7h',
    likes: '27',
    content: 'Test comment 5',
  ),
];

@immutable
@RoutePage()
class MyHomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const MyHomeScreen({
    super.key,
  });

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return RepositoryProvider<ContentRepo>(
      create: (context) => ContentRepo(),
      child: BlocProvider<ContentBloc>(
        create: (context) => ContentBloc(
          context.read<ContentRepo>(),
        ),
        child: this,
      ),
    );
  }
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: GoogleFonts.grandHotel(fontSize: 32),
        ),
        centerTitle: false,
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return Switch(
                value: state.isDarkModeEnabled,
                onChanged: (value) {
                  context.read<ThemeBloc>().add(const ToggleEvent());
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 470.0,
          ),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              if (index == 0) {
                return StoriesWidget(stories: testStories);
              } else {
                // Display posts here
                return PostWidget(
                  username: 'username',
                  avatarImage: 'assets/avatar.jpg',
                  postImage: 'assets/post_image.jpg',
                  likes: 15,
                  caption:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  publicationTime: '3 h.',
                  comments: testComments,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
