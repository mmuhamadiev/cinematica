part of 'movie_bloc.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {
  MoviesListModel? moviesList;
  final bool isFirstFetch;

  MovieLoading({this.moviesList, required this.isFirstFetch});
}

class MovieLoaded extends MovieState {

  MoviesListModel? moviesList;

  MovieLoaded({this.moviesList});
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}