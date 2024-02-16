import 'package:kinopoisk_search/data/models/movie_model.dart';
import 'package:kinopoisk_search/data/models/movies_list_model.dart';
import 'package:kinopoisk_search/data/network/api_provider.dart';

abstract class MoviesRepository {
  Future<MoviesListModel> fetchMoviesList(
        int page,
        int limit,
        String? query
      );

  Future<MovieModel> fetchMovieById(
        String id
      );
}

class MoviesRepositoryImpl extends MoviesRepository {
  final ApiProvider apiProvider;

  MoviesRepositoryImpl(this.apiProvider);

  @override
  Future<MoviesListModel> fetchMoviesList(
      int page,
      int limit,
      String? query
      ) async{
    return await apiProvider.getMovieList(page: page, limit: limit, query: query);
  }

  @override
  Future<MovieModel> fetchMovieById(
      String id
      ) async{
    return await apiProvider.getMovieById(id: id);
  }
}