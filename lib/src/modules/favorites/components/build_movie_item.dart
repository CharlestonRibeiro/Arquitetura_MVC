
import 'package:arquitetura_mvc/src/core/colors/custom_colors.dart';
import 'package:arquitetura_mvc/src/core/ulrs/urls.dart';
import 'package:arquitetura_mvc/src/models/movies_model.dart';
import 'package:arquitetura_mvc/src/modules/favorites/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildMovieItem extends StatelessWidget {
  final MoviesModel movie;

  const BuildMovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController =
        Get.find<FavoritesController>();

    return SizedBox(
      height: Get.height * 0.45,
      width: Get.width * 0.31,
      child: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.04,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    Urls.baseImage + movie.posterPath,
                    height: Get.height * 0.25,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.35,
                  child: Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleMedium,
                    softWrap: true,
                  ),
                ),
                Text(
                  movie.releaseDate.substring(0, 4),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: Get.height * 0.10,
            right: Get.width * 0.11,
            child: Material(
              elevation: 5,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: Get.height * 0.04,
                child: IconButton(
                  iconSize: Get.height * 0.02,
                  onPressed: () {
                    favoritesController.deleteFavoritesMovies(
                        id: movie.id);
                    favoritesController.searchFavoritesMovies();
                  },
                  icon: Icon(
                    Icons.favorite_outlined,
                    color: CustomColors.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}