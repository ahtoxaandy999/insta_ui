import 'package:auto_route/auto_route.dart';
import 'package:insta_ui/presentation/home/home_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/home',
          page: MyHomeRoute.page,
        ),
      ];
}
