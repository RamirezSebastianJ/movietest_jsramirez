import 'package:get/get.dart';
import 'package:movietest/data/dependencyInjection/dependency_injection_container.dart'
    as di;
import 'package:movietest/domain/useCases/movies/movies_usecase.dart';

class SplashController extends GetxController {

  

  @override
  void onInit() async {
    super.onInit();
    await configurationInitApp();
    Get.offAllNamed('/home');
  }

  start() {}

  Future<void> configurationInitApp() async {
    await di.init();
  }
}
