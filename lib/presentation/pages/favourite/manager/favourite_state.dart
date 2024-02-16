part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteAdded extends FavouriteState {}

class FavouriteDeleted extends FavouriteState {
  final String id;
  FavouriteDeleted(this.id);
}
