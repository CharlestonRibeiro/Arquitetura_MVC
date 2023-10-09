import 'package:arquitetura_mvc/src/modules/favorites/favorites_module.dart';
import 'package:arquitetura_mvc/src/modules/favorites/favorites_page.dart';
import 'package:arquitetura_mvc/src/modules/home/home_module.dart';
import 'package:arquitetura_mvc/src/modules/home/home_page.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> customRoutes = [
  GetPage(
      name: HomePage.homePage, 
      binding: HomeModule(), 
      page: () => HomePage()),
  GetPage(
      name: FavoritesPage.favoriteMoviesPage,
      binding: FavoritesModule(),
      page: () => const FavoritesPage()),
];