import 'package:rxdart/rxdart.dart';

import '../models/ItemModel.dart';
import '../resources/MovieRepository.dart';

class MoviesBloc {
  final _repository = MovieRepository();
  final _moviesFetcher = PublishSubject<ItemModel>();

  Stream<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
