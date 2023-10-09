import 'package:arquitetura_mvc/src/core/colors/custom_colors.dart';
import 'package:arquitetura_mvc/src/core/widgets/custom_app_bar.dart';
import 'package:arquitetura_mvc/src/modules/home/components/custom_list_view_movies.dart';
import 'package:arquitetura_mvc/src/modules/home/home_controller.dart';
import 'package:arquitetura_mvc/src/modules/home/home_states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController moviesController = Get.find<HomeController>();

  static const homePage = '/';

  Widget get topMoviesState {
    switch (moviesController.topMoviesState.value) {
      case TopMoviesState.errorTopMoviesState:
        return const Center(child: Icon(Icons.error));
      case TopMoviesState.successTopMoviesState:
        return CustomListViewMovies(movies: moviesController.topMovies);
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }

  Widget get popularMoviesState {
    switch (moviesController.popularMoviesState.value) {
      case PopularMoviesState.errorPopularMoviesState:
        return const Center(child: Icon(Icons.error));
      case PopularMoviesState.successPopularMoviesState:
        return CustomListViewMovies(movies: moviesController.popularMovies);
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mais populares',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: Get.height * 0.45,
                    child: Obx(() => popularMoviesState),
                  ),
                  Text(
                    'Top filmes',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: Get.height * 0.45,
                    child: Obx(() => topMoviesState),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
