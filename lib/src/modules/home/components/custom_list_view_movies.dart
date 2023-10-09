import 'package:arquitetura_mvc/src/core/colors/custom_colors.dart';
import 'package:arquitetura_mvc/src/core/ulrs/urls.dart';
import 'package:arquitetura_mvc/src/data/repositories/moviesLocal/movies_local_repository_impl.dart';
import 'package:arquitetura_mvc/src/models/movies_model.dart';
import 'package:arquitetura_mvc/src/modules/favorites/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListViewMovies extends StatelessWidget {
  final List<MoviesModel> movies;

  const CustomListViewMovies({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesLocalRepository = Get.find<MoviesLocalRepositoryImpl>();
    final favoriteMoviesController = Get.put(FavoritesController());
    final listTitle = [];

    return Obx(() {
      for (var m in favoriteMoviesController.favoriteMovies) {
        listTitle.add(m.title);
      }

      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: Get.height * 0.45,
              width: Get.width * 0.32,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          Urls.baseImage + movies[index].posterPath,
                          height: Get.height * 0.25,
                          //  width: Get.width * 0.32,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      SizedBox(
                        width: Get.width * 0.35,
                        child: Text(
                          movies[index].title,
                          style: Theme.of(context).textTheme.titleMedium,
                          softWrap: true,
                        ),
                      ),
                      Text(
                        movies[index].releaseDate.substring(0, 4),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: Get.height * 0.12,
                    right: Get.width * 0.01,
                    child: Material(
                      elevation: 5,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                        height: Get.height * 0.04,
                        child: IconButton(
                            iconSize: Get.height * 0.02,
                            onPressed: () {
                              if (!listTitle.contains(movies[index].title)) {
                                moviesLocalRepository.postMoviesLocal(
                                  data: {
                                    'id': movies[index].id,
                                    'title': movies[index].title,
                                    'release_date': movies[index].releaseDate,
                                    'poster_path': movies[index].posterPath,
                                    'genre_ids': movies[index].genres,
                                    'favorite': true,
                                  },
                                );
                                Get.snackbar(
                                  'Filmes favoritos',
                                  '${movies[index].title} adicionado!!!' ,
                                  snackPosition: SnackPosition.TOP,
                                  icon: const Icon(Icons.cached_outlined),
                                  duration: const Duration(seconds: 3),
                                );
                              } else {
                                Get.snackbar(
                                  'Filmes favoritos',
                                  'Erro, ${movies[index].title}Já foi adicionado' ,
                                  snackPosition: SnackPosition.TOP,
                                  icon: const Icon(Icons.cached_outlined),
                                  duration: const Duration(seconds: 3),
                                );
                              }

                              favoriteMoviesController.searchFavoritesMovies();
                            },
                            icon: Icon(
                              Icons.favorite_outlined,
                              color: listTitle.contains(movies[index].title)
                                  ? CustomColors.primary
                                  : CustomColors.gray,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }
}