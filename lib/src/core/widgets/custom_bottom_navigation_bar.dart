
import 'package:arquitetura_mvc/src/core/colors/custom_colors.dart';
import 'package:arquitetura_mvc/src/modules/favorites/favorites_controller.dart';
import 'package:arquitetura_mvc/src/modules/favorites/favorites_page.dart';
import 'package:arquitetura_mvc/src/modules/home/home_controller.dart';
import 'package:arquitetura_mvc/src/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteMoviesController = Get.put(FavoritesController());

    return GetBuilder<HomeController>(
      builder: (controller) {
        final route = Get.routing.current;
        final selectedIndex = route == HomePage.homePage ? 0 : 1;

        return BottomNavigationBar(
          backgroundColor: CustomColors.background,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_movies),
              label: 'Filmes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Filmes Favoritos',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: CustomColors.primary,
          unselectedItemColor: CustomColors.gray,
          onTap: (index) {
            if (index == 0) {
              Get.toNamed(HomePage.homePage);
            } else if (index == 1) {
              favoriteMoviesController.searchFavoritesMovies();
              Get.toNamed(FavoritesPage.favoriteMoviesPage);
            }
          },
        );
      },
    );
  }
}