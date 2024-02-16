import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:kinopoisk_search/data/models/api_error.dart';
import 'package:kinopoisk_search/data/models/movie_model.dart';
import 'package:kinopoisk_search/data/repositories/movies_repository.dart';
import 'package:kinopoisk_search/presentation/manager/movie_bloc/movie_bloc.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {

  MoviesRepositoryImpl moviesRepositoryImpl;

  MovieDetailsCubit(this.moviesRepositoryImpl) : super(MovieDetailsInitial());

  void fetchMovieById(String id) async{
    emit(MovieDetailsLoading());
    print('loading');
    try {
      final response = await moviesRepositoryImpl.fetchMovieById(id);
      emit(MovieDetailsLoaded(movieModel: response));
      print('loaded');
    }
    on ApiException catch (error, stacktrace) {
      print(error.message);
      print('ApiException --> $error, stacktrace: $stacktrace');
      emit(MovieDetailsError(error.message));
    }
  }
}
