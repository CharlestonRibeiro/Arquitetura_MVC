import 'package:arquitetura_mvc/src/core/ulrs/urls.dart';
import 'package:arquitetura_mvc/src/models/movies_model.dart';
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
                     
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );

  }
}