import 'package:arquitetura_mvc/src/core/ulrs/urls.dart';
import 'package:arquitetura_mvc/src/data/client/dio_client.dart';
import 'package:arquitetura_mvc/src/data/repositories/movies/movies_repository.dart';
import 'package:get/get.dart';
class MoviesRepositoryImpl implements MoviesRepository {
final dioClient = Get.put(DioClient());

  @override
  Future getPopularMovies() async {
    try {
      final popularMovies =
          await dioClient.getData(url: Urls.baseUrl + Urls.urlPopularMovies);
      return popularMovies['results'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getTopRetadeMovies() async {
    try {
      final topRetadeMovies =
          await dioClient.getData(url: Urls.baseUrl + Urls.urlTopRetadeMovies);
      return topRetadeMovies['results'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getGenres() async {
    try {
      final getGenres = await dioClient.getData(url: Urls.urlGenres);
      return getGenres['results'];
    } catch (e) {
      rethrow;
    }
  }
}
