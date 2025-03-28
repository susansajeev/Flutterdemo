import 'package:flutter_demo/view/detail_page.dart';
import 'package:flutter_demo/view/movies.dart';
import 'package:go_router/go_router.dart';

import '../view/loginpage.dart';

class NavigationRouter {
  //static const homeScreen = "/";
  static const loginScreen = "/login";
  static const movieScreen = "/";
  static const detailScreen = "/detailscreen";

  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: movieScreen,
        builder: (context, state) => const Movies(),

      ),
      GoRoute(path: loginScreen,
          builder: (context, state) => MyloginPage()

      ) ,
      GoRoute(path: detailScreen,
          builder: (context, state) => DetailMovie()

      )
    ],
  );
}
