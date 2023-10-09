class Urls {
  Urls._();

  static String get baseUrl => 'https://api.themoviedb.org/3/movie/';
  
  static String get urlPopularMovies =>
      'popular?api_key=77fcf345c0aaa5c563bb5ea8fe9102c6&language=pt-br&page=1';

  static String get urlTopMovies =>
      'top_rated?api_key=77fcf345c0aaa5c563bb5ea8fe9102c6&language=pt-br&page=1';

 static String get baseImage => 'https://image.tmdb.org/t/p/original';

  static String get urlGenres => 'https://api.themoviedb.org/3/genre/movie/list?api_key=77fcf345c0aaa5c563bb5ea8fe9102c6&language=pt-br';

}