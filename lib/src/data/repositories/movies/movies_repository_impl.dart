import 'dart:developer';

import 'package:arquitetura_mvc/src/core/ulrs/urls.dart';
import 'package:arquitetura_mvc/src/data/client/dio_client.dart';
import 'package:arquitetura_mvc/src/data/repositories/movies/movies_repository.dart';
import 'package:arquitetura_mvc/src/models/movies_model.dart';
import 'package:get/get.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final dioClient = Get.put(DioClient());

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    try {
      final popularMovies =
          await dioClient.getData(url: Urls.baseUrl + Urls.urlPopularMovies);
      final List<MoviesModel> result = popularMovies['results']
          .map<MoviesModel>((movieMap) => MoviesModel.fromMap(movieMap))
          .toList();
      return result;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future <List<MoviesModel>> getTopRetadeMovies() async {
    try {
      final topMovies =
          await dioClient.getData(url: Urls.baseUrl + Urls.urlTopMovies);
      final List<MoviesModel> result = topMovies['results']
          .map<MoviesModel>((movieMap) => MoviesModel.fromMap(movieMap))
          .toList();
      return result;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
