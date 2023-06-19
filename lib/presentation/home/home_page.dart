import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_ui/presentation/home/widgets/post.dart';
import 'package:insta_ui/src/bloc/content/content.dart';
import 'package:insta_ui/src/bloc/theme/theme.dart';
import 'package:insta_ui/src/repository/content/content_repo.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 470.0,
          ),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const PostWidget(
                username: 'username',
                avatarImage: 'assets/avatar.jpg',
                postImage: 'assets/post_image.jpg',
                likes: 15,
                caption:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                publicationTime: '3 h.',
              );
            },
          ),
        ),
      ),
    );
  }
}
