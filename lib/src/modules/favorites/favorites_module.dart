import 'package:arquitetura_mvc/src/data/repositories/movies/movies_repository_impl.dart';
import 'package:arquitetura_mvc/src/data/repositories/moviesLocal/movies_local_repository_impl.dart';
import 'package:arquitetura_mvc/src/modules/favorites/favorites_controller.dart';
import 'package:get/get.dart';

class FavoritesModule implements Bindings {
  @override
  void dependencies() {
    Get.put(MoviesLocalRepositoryImpl());
    Get.put(MoviesRepositoryImpl());
    Get.put(FavoritesController());
  }
}