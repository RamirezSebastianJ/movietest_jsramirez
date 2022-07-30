import 'dart:convert';
import 'package:movietest/app/config/environments.dart';
import 'package:movietest/data/models/genres/genres.dart';
import 'package:movietest/app/util/server_failure.dart';
import 'package:either_dart/src/either.dart';
import 'package:movietest/data/models/movies/movies.dart';
import 'package:movietest/domain/repositories/movies/movies_repositories.dart';
import 'package:http/http.dart' as http;

class MoviesDataSource implements MoviesRepository {
  @override
  Future<Either<ServerFailure, Genres>> getGenres() async {
    try {
      var response = await http.get(
        Uri.parse(
            '${CurrentEnvironment.environment.apiUrl}${CurrentEnvironment.environment.apiVersion}/genre/movie/list?api_key=${CurrentEnvironment.environment.apiKey}'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return Right(Genres.fromJson(body));
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure(error: e));
    }
  }

  @override
  Future<Either<ServerFailure, Movies>> getMoviesByGenre(int genreId,
      {required int page}) async {
    try {
      var response = await http.get(
        Uri.parse(
            '${CurrentEnvironment.environment.apiUrl}${CurrentEnvironment.environment.apiVersion}/discover/movie?api_key=${CurrentEnvironment.environment.apiKey}&with_genres=$genreId&page=$page'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return Right(Movies.fromJson(body));
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure(error: e));
    }
  }
}
