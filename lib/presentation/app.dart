import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui/presentation/theme.dart';
import 'package:insta_ui/router/router.dart';
import 'package:insta_ui/src/bloc/theme/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeBloc>(
      builder: (context, themeBloc, _) {
        return MaterialApp.router(
          title: 'Insta UI',
          routerDelegate: AutoRouterDelegate.declarative(
            _appRouter,
            routes: (_) {
              return [
                const MyHomeRoute(),
              ];
            },
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          theme: themeBloc.state.isDarkModeEnabled
              ? AppTheme().darkTheme
              : AppTheme().lightTheme,
        );
      },
    );
  }
}
