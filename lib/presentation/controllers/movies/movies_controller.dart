import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:movietest/data/models/movies/movies.dart';
import 'package:movietest/data/models/movies/result.dart';
import 'package:movietest/domain/useCases/movies/movies_usecase.dart';

class MoviesController extends GetxController {
  GetIt getIt = GetIt.I;

  // parameters
  final String genreId = Get.parameters['genreId'] ?? '';
  final String genreName = Get.parameters['genreName'] ?? '';
  final Rx<Movies> movies = Rx<Movies>(const Movies());
  final Rx<Result> movieSelected = Rx<Result>(const Result());
  //useCases
  late MoviesUseCases _moviesUseCases;
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  ScrollController scrollController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  //variables
  RxInt currentIndex = RxInt(0);

  //init
  @override
  void onInit() async {
    super.onInit();
    _moviesUseCases = getIt.get<MoviesUseCases>();

    await getMoviesByGenre();
    scrollController.addListener(() {
      double offset = 0.9 * scrollController.position.maxScrollExtent;

      if (scrollController.position.atEdge) {
        getMoviesByGenre();
      }
    });
  }

  //getMoviesByGenre
  Future<void> getMoviesByGenre() async {
    currentIndex++;
    var response = await _moviesUseCases.getMoviesByGenre(int.parse(genreId),
        page: currentIndex.value);
    response.fold((serverFailure) {
      if (kDebugMode) {
        print(serverFailure.error);
      }
    }, (movies) {
      if (currentIndex.value >= 2 && movies.results != null) {
        this.movies.value.results!.addAll(movies.results!);
      } else {
        this.movies.value = movies;
      }
      update();
    });
  }

  //select movie
  void selectMovie(Result movie) {
    movieSelected.value = movie;
    Get.toNamed(
      '/movieDetail',
    );
  }
}
