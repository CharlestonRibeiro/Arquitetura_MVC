import 'package:arquitetura_mvc/src/data/repositories/movies/movies_repository_impl.dart';
import 'package:arquitetura_mvc/src/modules/home/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomeModule implements Bindings {
  @override
  void dependencies() {
    Get.put(MoviesRepositoryImpl());
    Get.put(HomeController());
  }
}