import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_ui/src/bloc/content/content.dart';
import 'package:insta_ui/src/bloc/theme/theme.dart';
import 'package:insta_ui/src/repository/content/content_repo.dart';

@immutable
class AppWrapper extends StatefulWidget {
  final Widget child;

  const AppWrapper({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<ContentBloc>(
            create: (context) => ContentBloc(
              context.read<ContentRepo>(),
            ),
          ),
          BlocProvider<ThemeBloc>(
            create: (context) => ThemeBloc(),
          ),
        ],
        child: widget.child,
      );
}
