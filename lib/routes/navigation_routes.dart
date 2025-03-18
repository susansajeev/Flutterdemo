import 'package:flutter_demo/view/movies.dart';
import 'package:go_router/go_router.dart';

import '../view/homepage.dart';
import '../view/loginpage.dart';

class NavigationRouter {
  //static const homeScreen = "/";
  static const loginScreen = "/login";
  static const movieScreen = "/";

  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: movieScreen,
        builder: (context, state) => const Movies(),

      ),
      GoRoute(path: loginScreen,
          builder: (context, state) => MyloginPage()

      ) ,
    ],
  );
}
