import 'package:get/get.dart';
import 'package:movietest/presentation/controllers/movies/movies_controller.dart';

class MoviesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesController>(() => MoviesController());
  }
}
