import 'package:either_dart/either.dart';
import 'package:movietest/data/models/genres/genres.dart';
import 'package:movietest/app/util/server_failure.dart';
import 'package:movietest/data/models/movies/movies.dart';

import 'package:movietest/domain/repositories/movies/movies_repositories.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesRepository repository;

  MoviesRepositoryImpl({required this.repository});

  @override
  Future<Either<ServerFailure, Genres>> getGenres() {
    return repository.getGenres();
  }

  @override
  Future<Either<ServerFailure, Movies>> getMoviesByGenre(int genreId,
      {required int page}) {
    return repository.getMoviesByGenre(genreId, page: page);
  }
}
