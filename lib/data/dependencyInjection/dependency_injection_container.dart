import 'package:get_it/get_it.dart';
import 'package:movietest/data/dependencyInjection/movies/movies_dependency_injection.dart';

GetIt getIt = GetIt.I;

Future<void> init() async {
  await initMovies();
}
