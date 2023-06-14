import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool isDarkModeEnabled = false;

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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/avatar.jpg'),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Username',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Image.asset('assets/post_image.jpg'),
                const SizedBox(height: 8.0),
                const Row(
                  children: [
                    Icon(Icons.favorite_border),
                    SizedBox(width: 4.0),
                    Text('Likes'),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Text('Caption'),
              ],
            ),
          );
        },
      ),
    );
  }
}
