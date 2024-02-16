part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {
  const MovieEvent();
}

class FetchMovies extends MovieEvent {}

class LoadMoreMovies extends MovieEvent {
  final String? query;

  const LoadMoreMovies({this.query});
}

class FetchSearchMovies extends MovieEvent {
  final String? query;

  const FetchSearchMovies({this.query});
}
