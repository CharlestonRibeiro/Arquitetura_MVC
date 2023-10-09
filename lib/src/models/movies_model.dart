
import 'dart:convert';

class MoviesModel {
  final num id;
  final String title;
  final String releaseDate;
  final String posterPath;
  final bool adult;
  final bool favorite;
  MoviesModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.posterPath,
    required this.adult,
    required this.favorite,
  });



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'release_date': releaseDate,
      'poster_path': posterPath,
      'adult': adult,
      'favorite': favorite,
    };
  }

  factory MoviesModel.fromMap(Map<String, dynamic> map) {
    return MoviesModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      releaseDate: map['release_date'] ?? '',
      posterPath: map['poster_path'] ?? '',
      adult: map['favorite'] ?? false,
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesModel.fromJson(String source) => MoviesModel.fromMap(json.decode(source));
}