import 'package:either_dart/either.dart';
import 'package:movietest/app/util/server_failure.dart';
import 'package:movietest/data/models/genres/genres.dart';
import 'package:movietest/data/models/movies/movies.dart';

abstract class MoviesRepository {
  Future<Either<ServerFailure, Genres>> getGenres();

  //get movies by genre
  Future<Either<ServerFailure, Movies>> getMoviesByGenre(int genreId, {required int page});
}
