import 'package:bloc/bloc.dart';
import 'package:kinopoisk_search/data/db_model/db_movie_model.dart';
import 'package:kinopoisk_search/data/models/movie_model.dart';
import 'package:kinopoisk_search/data/sqflite_helper/movie_database.dart';
import 'package:meta/meta.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {

  MovieDatabase movieDatabase;

  FavouriteCubit(this.movieDatabase) : super(FavouriteInitial());

  Future<int> insertToDatabase(DbMovieModel movieModel) async{
    emit(FavouriteLoading());
    final id = await movieDatabase.insert(movieModel);
    emit(FavouriteAdded());
    return id;
  }

  Future<int> deleteFromDatabase(int id) async{
    emit(FavouriteLoading());
    final response = await movieDatabase.delete(id);
    emit(FavouriteDeleted(id.toString()));
    return response;
  }

  Future<List<DbMovieModel>> getAllMovies() async{
    return await movieDatabase.readAllMovies();
  }
}
