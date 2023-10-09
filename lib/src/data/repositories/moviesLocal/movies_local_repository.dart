abstract class MoviesLocalRepository {
  Future postMoviesLocal({required Map<String, dynamic> data});
  Future getFavoritesMovies();
  Future deleteFavoritesMovies({required num id});
}