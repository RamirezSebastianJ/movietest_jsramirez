import 'package:get/get.dart';
import 'package:movietest/app/extensions/movietest_middelware.dart';
import 'package:movietest/presentation/controllers/home/home_binding.dart';
import 'package:movietest/presentation/controllers/movies/movies_binding.dart';
import 'package:movietest/presentation/controllers/splash/splash_binding.dart';
import 'package:movietest/presentation/pages/home/home_page.dart';
import 'package:movietest/presentation/pages/movies/movie_detail_page.dart';
import 'package:movietest/presentation/pages/movies/movies_page.dart';
import 'package:movietest/presentation/pages/splash/splash_page.dart';

appRoutes() => [
      GetPage(
        name: '/splash',
        page: () => const SplashPage(),
        middlewares: [MovieTestMiddelware()],
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        binding: SplashBinding(),
      ),

      //home Page
      GetPage(
        name: '/home',
        page: () => HomePage(),
        middlewares: [MovieTestMiddelware()],
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        binding: HomeBinding(),
      ),

      //movies
      GetPage(
        name: '/moviesByGenre',
        page: () => MoviesPage(),
        middlewares: [MovieTestMiddelware()],
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        binding: MoviesBinding(),
      ),

      //movie detail
      GetPage(
        name: '/movieDetail',
        page: () => MovieDetailPage(),
        middlewares: [MovieTestMiddelware()],
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];
