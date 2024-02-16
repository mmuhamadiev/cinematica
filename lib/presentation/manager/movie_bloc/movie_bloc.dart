import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kinopoisk_search/data/models/api_error.dart';
import 'package:kinopoisk_search/data/models/movies_list_model.dart';
import 'package:kinopoisk_search/data/repositories/movies_repository.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {

  MoviesRepositoryImpl moviesRepositoryImpl;

  int page = 1;
  int limit = 10;
  int totalLimit = 100;

  MovieBloc(this.moviesRepositoryImpl) : super(MovieInitial()) {
    on<FetchMovies>((event, emit) async {
      if(state is MovieLoading) return;

      final currentState = state;

      MoviesListModel oldMoviesList = MoviesListModel(docs: [], total: 0, limit: 0, page: 0, pages: 0,);

      if(currentState is MovieLoaded) {
        oldMoviesList = currentState.moviesList!;
      }

      emit(MovieLoading(moviesList: oldMoviesList, isFirstFetch: page == 1));
      print('loading');

      try {
        final response = await moviesRepositoryImpl.fetchMoviesList(1, 10, '').then((moviesListResponse) {
          MoviesListModel moviesListNew = (state as MovieLoading).moviesList!;
          moviesListNew = moviesListResponse;
          totalLimit = moviesListNew.total;
          emit(MovieLoaded(moviesList: moviesListNew));
        });
      } on ApiException catch (error, stacktrace) {
        print(error.message);
        print('ApiException --> $error, stacktrace: $stacktrace');
        emit(MovieError(error.message));
      }
    });

    on<FetchSearchMovies>((event, emit) async {
      if(state is MovieLoading) return;

      final currentState = state;

      MoviesListModel oldMoviesList = MoviesListModel(docs: [], total: 0, limit: 0, page: 0, pages: 0,);

      if(currentState is MovieLoaded) {
        oldMoviesList = currentState.moviesList!;
      }

      emit(MovieLoading(moviesList: oldMoviesList, isFirstFetch: page == 1));
      print('loading');

      try {
        final response = await moviesRepositoryImpl.fetchMoviesList(1, 10, event.query).then((moviesListResponse) {
          MoviesListModel moviesListNew = (state as MovieLoading).moviesList!;
          moviesListNew = moviesListResponse;
          totalLimit = moviesListNew.total;
          emit(MovieLoaded(moviesList: moviesListNew));
        });
      } on ApiException catch (error, stacktrace) {
        print(error.message);
        print('ApiException --> $error, stacktrace: $stacktrace');
        emit(MovieError(error.message));
      }
    });

    on<LoadMoreMovies>((event, emit) async {
      if(state is MovieLoading) return;

      final currentState = state;

      MoviesListModel oldMoviesList = MoviesListModel(docs: [], total: 0, limit: 0, page: 0, pages: 0,);

      if(currentState is MovieLoaded) {
        oldMoviesList = currentState.moviesList!;
      }

      emit(MovieLoading(moviesList: oldMoviesList, isFirstFetch: page + 1 == 1));
      print('loading');

      try {
        final response = await moviesRepositoryImpl.fetchMoviesList(page, limit, event.query).then((moviesListResponse) {
          MoviesListModel moviesListNew = (state as MovieLoading).moviesList!;
          moviesListNew = moviesListResponse;
          totalLimit = moviesListNew.total;
          emit(MovieLoaded(moviesList: moviesListNew));
          if(limit < moviesListNew.total) {
            limit += 10;
          }
        });
      } on ApiException catch (error, stacktrace) {
        print(error.message);
        print('ApiException --> $error, stacktrace: $stacktrace');
        emit(MovieError(error.message));
      }
    });
  }

  void resetPageLimit() {
    page = 1;
    limit = 10;
    totalLimit = 100;
  }
}
