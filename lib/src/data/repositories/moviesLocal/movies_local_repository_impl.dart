import 'package:arquitetura_mvc/src/core/ulrs/urls.dart';
import 'package:arquitetura_mvc/src/data/client/dio_client.dart';
import 'package:arquitetura_mvc/src/data/repositories/moviesLocal/movies_local_repository.dart';
import 'package:get/get.dart';

class MoviesLocalRepositoryImpl implements MoviesLocalRepository {
  final dioClient = Get.put(DioClient());

  @override
  Future postMoviesLocal({required Map<String, dynamic> data}) async {
    try {
      await dioClient.postData(url: Urls.urlLocal, data: data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getFavoritesMovies() async {}

  @override
  Future deleteFavoritesMovies({required num id}) async {
    try {
      final urlDelete = '${Urls.urlLocal}/$id';
      await dioClient.deleteData(url: urlDelete);
    } catch (e) {
      rethrow;
    }
  }
}
