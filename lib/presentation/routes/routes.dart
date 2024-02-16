import 'package:go_router/go_router.dart';
import 'package:kinopoisk_search/presentation/pages/favourite/view/favourite_page.dart';
import 'package:kinopoisk_search/presentation/pages/main/view/main_page.dart';
import 'package:kinopoisk_search/presentation/pages/movie_datails/view/movie_details_page.dart';
import 'package:kinopoisk_search/presentation/pages/splash/view/splash_page.dart';

final router = GoRouter(routes: [
  GoRoute(
    name: '/',
    path: '/',
    builder: (context, state) => const SplashPage(),
  ),
  GoRoute(
    name: '/main',
    path: '/main',
    builder: (context, state) => const MainPage(),
  ),
  GoRoute(
    name: '/movie_details',
    path: '/movie_details/:isLocalPreview/:movieId',
    builder: (context, state) => MovieDetailsPage(
        isLocalPreview: state.pathParameters['isLocalPreview'] == 'true'? true: false,
        movieId: state.pathParameters['movieId']?? '', ),
    ),
  GoRoute(
    name: '/favourite',
    path: '/favourite',
    builder: (context, state) => const FavouritePage(),
  ),
  // GoRoute(
  //     name: '/user_test_result',
  //     path: '/user_test_result/:userID/:resultID',
  //     builder: (context, state) => UserAnalizTestView(userID: state.pathParameters['userID']?? '', resultID: state.pathParameters['resultID']?? '')
  // ),

]
);
