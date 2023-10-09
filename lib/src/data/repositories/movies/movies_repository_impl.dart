import 'dart:developer';

import 'package:arquitetura_mvc/src/core/ulrs/urls.dart';
import 'package:arquitetura_mvc/src/data/client/dio_client.dart';
import 'package:arquitetura_mvc/src/data/repositories/movies/movies_repository.dart';
import 'package:arquitetura_mvc/src/models/movies_model.dart';
import 'package:get/get.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final dioClient = Get.put(DioClient());

  @override
  Future getPopularMovies() async {
    try {
      final popularMovies =
          await dioClient.getData(url: Urls.baseUrl + Urls.urlPopularMovies);
      final result = popularMovies['results']
          .map((movieMap) => MoviesModel.fromMap(movieMap))
          .toList();
      return result;
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future getTopRetadeMovies() async {
    try {
      final topMovies =
          await dioClient.getData(url: Urls.baseUrl + Urls.urlTopMovies);
      final result = topMovies['results']
          .map((movieMap) => MoviesModel.fromMap(movieMap))
          .toList();
      return result;
    } catch (e) {
      log(e.toString());
    }
  }
}
