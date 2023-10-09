import 'package:arquitetura_mvc/src/core/colors/custom_colors.dart';
import 'package:arquitetura_mvc/src/models/genres_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListViewGenres extends StatelessWidget {
  final List<GenresModel> genresList;

  const CustomListViewGenres({super.key, required this.genresList});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genresList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              
                Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.25,
                  decoration: BoxDecoration(
                      color: CustomColors.black,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(29))),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        genresList[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: CustomColors.white),
                      ),
                    ),
                  ),
                ),
             
              ],
            ),
          );
        },
      );
    });
  }
}