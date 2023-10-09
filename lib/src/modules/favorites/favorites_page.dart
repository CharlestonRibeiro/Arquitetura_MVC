import 'package:arquitetura_mvc/src/core/colors/custom_colors.dart';
import 'package:arquitetura_mvc/src/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:arquitetura_mvc/src/modules/favorites/components/custom_list_view_favorite_movies.dart';
import 'package:arquitetura_mvc/src/modules/favorites/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});
  static const favoriteMoviesPage = '/FavoriteMoviesPage';

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController =
        Get.find<FavoritesController>();

    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundAppBar,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Meus favoritos',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ),
      body: CustomListViewFavoriteMovies(
          favoritesMovies: favoritesController.favoriteMovies),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
