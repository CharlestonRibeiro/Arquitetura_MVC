import 'package:arquitetura_mvc/src/models/movies_model.dart';
import 'package:arquitetura_mvc/src/modules/favorites/components/build_movie_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CustomListViewFavoriteMovies extends StatelessWidget {
  final List<MoviesModel> favoritesMovies;

  const CustomListViewFavoriteMovies({
    Key? key,
    required this.favoritesMovies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        padding: const EdgeInsets.all(8.0),
        children: favoritesMovies
            .map((movie) => BuildMovieItem( movie: movie))
            .toList(),
      );
    });
  }
}