import 'dart:developer';
import 'package:arquitetura_mvc/src/data/repositories/movies/movies_repository_impl.dart';
import 'package:arquitetura_mvc/src/data/repositories/moviesLocal/movies_local_repository_impl.dart';
import 'package:arquitetura_mvc/src/models/genres_model.dart';
import 'package:arquitetura_mvc/src/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  
  final _moviesRepository = Get.find<MoviesRepositoryImpl>();
  final _moviesLocalRepository = Get.find<MoviesLocalRepositoryImpl>();

  final favoriteMovies = <MoviesModel>[].obs;
  final genres = <GenresModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    searchFavoritesMovies();
    searchGenres();
  }

  @override
  void onReady() async {
    Get.snackbar(
      'Bem-vindo!!!',
      'Carregando...',
      icon: const Icon(Icons.cached_outlined),
    );
    super.onReady();
  }

  Future searchFavoritesMovies() async {
    try {
      final favoritesMoviesData =
          await _moviesLocalRepository.getFavoritesMovies();
      final favoritesMoviesList = (favoritesMoviesData as List)
          .map((movieMap) => MoviesModel.fromMap(movieMap))
          .toList();

      favoriteMovies.assignAll(favoritesMoviesList);

      log(favoritesMoviesList.toString());
    } catch (e) {
      Get.snackbar(
        'Filmes Favoritos',
        'Erro',
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future deleteFavoritesMovies({required id}) async {
    try {
      await _moviesLocalRepository.deleteFavoritesMovies(id: id);
       Get.snackbar(
        'Filmes Favoritos',
        'Filmes restirado da lista com sucesso!!!',
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      Get.snackbar(
        'Filmes Favoritos',
        'Erro Delete',
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future searchGenres() async {
    try {
      final genresData = await _moviesRepository.getGenres();

      final geresList = (genresData as List)
          .map((geresMap) => GenresModel.fromMap(geresMap))
          .toList();

      genres.assignAll(geresList);
    } catch (e) {
      Get.snackbar(
        'Filtros',
        'Erro',
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    }
  }
}