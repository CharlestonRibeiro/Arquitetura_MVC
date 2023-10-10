import 'package:arquitetura_mvc/src/data/repositories/movies/movies_repository_impl.dart';
import 'package:arquitetura_mvc/src/models/movies_model.dart';
import 'package:arquitetura_mvc/src/modules/home/home_states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final popularMovies = <MoviesModel>[].obs;
  final topMovies = <MoviesModel>[].obs;
  final _moviesRepository = Get.find<MoviesRepositoryImpl>();

  Rx<PopularMoviesState> popularMoviesState =
      PopularMoviesState.initiaPopularMoviesState.obs;
  Rx<TopMoviesState> topMoviesState = TopMoviesState.initiaTopMoviesState.obs;

  @override
  void onInit() {
    super.onInit();

    searchPopularMovies();
    searchTopMovies();
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

  Future searchPopularMovies() async {
    popularMoviesState.value = PopularMoviesState.loadingPopularMoviesState;
    try {
      final popularMoviesData = await _moviesRepository.getPopularMovies();

      final moviesFinal =
          popularMoviesData.where((e) => e.adult == false).toList();

      popularMovies.assignAll(moviesFinal);
      popularMoviesState.value = PopularMoviesState.successPopularMoviesState;
    } catch (e) {
      popularMoviesState.value = PopularMoviesState.errorPopularMoviesState;
      Get.snackbar(
        'Filmes Populares',
        'Erro',
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future searchTopMovies() async {
    topMoviesState.value = TopMoviesState.loadingTopMoviesState;
    try {
      final topMoviesData = await _moviesRepository.getTopRetadeMovies();

      final moviesFinal = topMoviesData.where((e) => e.adult == false).toList();
      topMovies.assignAll(moviesFinal);
      topMoviesState.value = TopMoviesState.successTopMoviesState;
    } catch (e) {
      topMoviesState.value = TopMoviesState.errorTopMoviesState;
      Get.snackbar(
        'Filmes Populares',
        'Erro',
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    }
  }
}
