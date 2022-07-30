import 'package:get_it/get_it.dart';
import 'package:movietest/data/dataSourceRemote/movies/movies_datasource.dart';
import 'package:movietest/data/repositories/movies/movies_repository_impl.dart';
import 'package:movietest/domain/repositories/movies/movies_repositories.dart';
import 'package:movietest/domain/useCases/movies/movies_usecase.dart';

GetIt getIt = GetIt.I;

Future<void> initMovies() async {
  getIt.registerSingleton<MoviesRepository>(MoviesDataSource());
  getIt.registerSingleton<MoviesRepositoryImpl>(
      MoviesRepositoryImpl(repository: getIt()));
  getIt.registerSingleton<MoviesUseCases>(MoviesUseCases(repository: getIt()));
}
