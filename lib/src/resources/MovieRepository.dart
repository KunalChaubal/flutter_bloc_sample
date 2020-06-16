import 'dart:async';
import 'MovieApiProvider.dart';
import '../models/ItemModel.dart';

class MovieRepository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}
