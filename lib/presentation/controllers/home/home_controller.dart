import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:movietest/app/util/server_failure.dart';
import 'package:movietest/data/models/genres/genres.dart';
import 'package:movietest/domain/useCases/movies/movies_usecase.dart';

class HomeController extends GetxController {
  GetIt getIt = GetIt.I;
  //useCases
  late MoviesUseCases _moviesUseCases;

  //variables
  Rx<Genres> genres = Rx<Genres>(const Genres());

  @override
  void onInit() async {
    super.onInit();
    _moviesUseCases = getIt.get<MoviesUseCases>();
    await getGenres();
  }

  //getGenres
  Future<void> getGenres() async {
    var response = await _moviesUseCases.getGenres();
    response.fold((serverFailure) {
      if (kDebugMode) {
        print(serverFailure.error);
      }
    }, (genres) {
      this.genres.value = genres;

      update();
    });
  }

  //add a genres
  void addGenres(Genres genres) {
    this.genres.value = genres;
    update();
  }

  //navigate to movies by genre
  void navigateToMoviesByGenre(int genreId, String genreName) {
    Get.toNamed('/moviesByGenre', parameters: {
      'genreId': genreId.toString(),
      'genreName': genreName,
    });
  }
}
